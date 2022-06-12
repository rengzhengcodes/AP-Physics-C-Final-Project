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
			Physics.Velocity temp = (other.velocity).copy();
			temp.scale(-1);
			velocity.add(temp);
			Physics.Position dirVector = new Physics.Position(other.pos.getX()-pos.getX(), other.pos.getY()-pos.getY());
			Physics.Velocity unitDir = new Physics.Velocity(dirVector.getVec().copy());
			dirVector.normalize();
			unitDir.scale(dirVector.getVec().dot(unitDir.getVec()));
			(other.velocity) = unitDir.copy();
			unitDir.scale(-1);
			velocity.add(unitDir);
			temp.scale(-1);
			(other.velocity).add(temp);
			velocity.add(temp);
		}
	}
	void collide (Obstacle obstacle) {
		// grabs shape
		int shape = obstacle.getKind();
		// behavior based on shape
		if (shape==ELLIPSE) {
			if (dist(pos.getX(), pos.getY(), obstacle.getXPos(), obstacle.getYPos()) <= this.size + obstacle.getRadius()) {
				Physics.Position dirVector = new Physics.Position(obstacle.getXPos()-pos.getX(), obstacle.getYPos()-pos.getY());
				Physics.Velocity unitDir = new Physics.Velocity(dirVector.getVec().copy());
				unitDir.normalize();
				unitDir.scale(dirVector.getVec().dot(unitDir.getVec()));
				unitDir.scale(-2);
				velocity.add(unitDir);
			}
		} else {
			if (
				(obstacle.getXPos() - (obstacle.getWidth() / 2) <= pos.getX() &&
				pos.getX() <= obstacle.getXPos() + (obstacle.getWidth() / 2)) &&
				(obstacle.getYPos() - (obstacle.getLength() / 2) <= pos.getY() &&
				pos.getY() <= obstacle.getYPos() + (obstacle.getLength() / 2))
			)
			{
				velocity.scale(-1);
				float ang = velocity.heading();
				float switcher = atan(obstacle.getYPos()/obstacle.getXPos());
				Physics.Velocity unitDir;
				if (ang < switcher) {
					unitDir = new Physics.Velocity(1,0);
				} else if (ang < PI-switcher) {
					unitDir = new Physics.Velocity(0,1);
				} else if (ang < PI+switcher) {
					unitDir = new Physics.Velocity(-1,0);
				} else if (ang < 2*PI-switcher) {
					unitDir = new Physics.Velocity(0,-1);
				} else {
					unitDir = new Physics.Velocity(1,0);
				}
				velocity.scale(-1);
				//Do stuff to determine direction of normal
				unitDir.scale(velocity.getVec().dot(unitDir.getVec()));
				unitDir.scale(-2);
				velocity.add(unitDir);
			}
		}
	}
	void move () {
		//move a small unit
		velocity.scale(timeunit);
		pos.move(velocity);
		velocity.scale(1/timeunit);
		//figure out collisions;
		for (Obstacle i: table.getObstacles()) {
			collide(i);
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
		accel2.scale(1/timeunit);
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
}
