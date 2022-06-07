public class Ball {
	private final int mass = 1;
	private final float size = 0.061;
	private float charge;
	private Physics.Velocity velocity;
	private Physics.Position pos;
	private PImage ball = null;
	private final float timeunit = 1/24.;

	/**
		*@param charge The charge of the ball in Coulombs.
	**/
	public Ball(float charge, String file) {
		this.charge = charge;
		this.velocity = new Physics.Velocity(0, 0);
		this.ball = loadImage(file);
	}
	void collide (Ball other) {
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
	void move () {
		//move a small unit
		pos.move(velocity.scale(timeunit));
		velocity.scale(1/timeunit);
		//detect collision
	}
	void display() {
		pushMatrix();
		translate(pos.getX(), pos.getY());
		imageMode(CENTER);
		image(ball, 0, 0);
		popMatrix();
	}
}
