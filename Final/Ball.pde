import java.util.*;

public class Ball {
	private static final int mass = 1;
	public static final float size = 0.061;
	private float charge;
	private Physics.Velocity velocity;
	private Physics.Position pos;
	private PImage ball = null;
	private final float timeunit = 1/24.;
	private Table table;

	/**
		*@param charge The charge of the ball in Coulombs.
	**/
	public Ball(float charge, String file, Table table) {
		this.charge = charge;
		this.velocity = new Physics.Velocity(0, 0);
		this.ball = loadImage(file);
		this.table = table;
	}

	public Ball(String file, Table table) {
		this.charge = 0;
		this.velocity = new Physics.Velocity(0, 0);
		this.ball = loadImage(file);
		this.table = table;
	}
	void collide (Ball other) {
		Physics.Position otherPos = other.getPosition();

		if (dist(otherPos.getX(), otherPos.getY(), pos.getX(), pos.getY()) <= size * Physics.pixelsPerMeter) {
			Physics.Position dirVector = new Physics.Position(other.pos.getX()-pos.getX(), other.pos.getY()-pos.getY());
			Physics.Velocity unitDir = new Physics.Velocity(dirVector.getVec().copy());
			dirVector.normalize();
			Physics.Velocity self_switch = velocity.copy();
			Physics.Velocity other_switch = other.velocity.copy();
			self_switch.normalize();
			other_switch.normalize();
			self_switch.scale(-1*velocity.getVec().dot(dirVector.getVec()));
			other_switch.scale(1*other.velocity.getVec().dot(dirVector.getVec()));
			velocity.add(self_switch);
			other.velocity.add(other_switch);
			self_switch.scale(-0.7);
			other_switch.scale(-0.7);
			velocity.add(other_switch);
			other.velocity.add(self_switch);
		}
	}
	void collidevert (Obstacle obstacle) {
    Physics.Velocity unitDir;
    if (pos.getX() + size >= obstacle.getXPos() - obstacle.getLength()/2 &&
      pos.getX() - size <= obstacle.getXPos() + obstacle.getLength()/2 &&
      pos.getY() + size >= obstacle.getYPos() - obstacle.getWidth()/2 &&
      pos.getY() - size <= obstacle.getYPos() + obstacle.getWidth()/2) {
      if (pos.getX() < obstacle.getXPos()) {
        unitDir = new Physics.Velocity(-1,0);
      } else {
        unitDir = new Physics.Velocity(1,0);
      }
      velocity.scale(-1);
      unitDir.scale(2*velocity.getVec().dot(unitDir.getVec()));
      velocity.scale(-1);
      velocity.add(unitDir);
      
    }
  }
  
  void collidehori (Obstacle obstacle) {
    Physics.Velocity unitDir;
    if (pos.getY() + size >= obstacle.getYPos() - obstacle.getWidth()/2 &&
      pos.getY() - size <= obstacle.getYPos() + obstacle.getWidth()/2 &&
      pos.getX() + size >= obstacle.getXPos() - obstacle.getLength()/2 &&
      pos.getX() - size <= obstacle.getXPos() + obstacle.getLength()/2) {
      if (pos.getY() < obstacle.getYPos()) {
        unitDir = new Physics.Velocity(0,-1);
      } else {
        unitDir = new Physics.Velocity(0,1);
      }
      velocity.scale(-1);
      unitDir.scale(2*velocity.getVec().dot(unitDir.getVec()));
      velocity.scale(-1);
      velocity.add(unitDir);
    }
  }

	void move () {
		//move a small unit
		velocity.scale(timeunit);
		pos.move(velocity);
		velocity.scale(1/timeunit);
		//figure out collisions;
		for (int i = 0; i < obst.size(); i++) {
			if (i==2 || i==5 || i==7 || i==9) {
				collidevert(obst.get(i));
			} else {
				collidehori(obst.get(i));
			}
		}
		//decelerate due to friction
		if (velocity.mag() > 0) {
			float vHeading = velocity.heading();
			Physics.Force fric = fric();
			Physics.Acceleration accel = fric.accel(mass);
			accel.scale(timeunit);
			velocity.accelerate(accel);
			if (abs(vHeading - velocity.heading()) > abs(velocity.heading() - fric.heading())) {
				velocity = new Physics.Velocity(0, 0);
			}
		}
		//accelerate due to magnetic field
		Physics.Force magnet = magnet();
		Physics.Acceleration accel2 = magnet.accel(mass);
		accel2.scale(timeunit);
		velocity.accelerate(accel2);
	}

	Physics.Force fric () {
		Physics.Force f1 = Physics.getGravityForce(mass);
		f1.scale(table.getFloorFCoeff());
		float mag = f1.mag();
		Physics.Force f = new Physics.Force(new PVector(1,0));
		velocity.scale(-1);
		f.rotate(velocity.heading());
		velocity.scale(-1);
		f.scale(mag);
		return f;
	}

	Physics.Force magnet () {
		return (table.getMfield()).affectCharge(velocity, charge);
	}

	void display() {
		pushMatrix();
		translate(pos.getX(), pos.getY());
		imageMode(CENTER);
		image(ball, 0, 0, round(size * Physics.pixelsPerMeter), round(size * Physics.pixelsPerMeter));
		popMatrix();
	}

	void setPosition(Physics.Position pos) {
		this.pos = pos;
	}

	Physics.Position getPosition() {
		return this.pos;
	}

	void setVelocity(Physics.Velocity v) {
		this.velocity = v;
	}

	void setCharge(float charge) {
		this.charge = charge;
	}

	float getCharge() {
		return this.charge;
	}
}
