public class Ball {
	private final int mass = 1;
	private final int size = 0.061;
	private float charge;
	private Physics.Velocity velocity;
	private Physics.Position pos;

	/**
		*@param charge The charge of the ball in Coulombs.
	**/
	public Ball(float charge) {
		this.charge = charge;
		this.velocity = new Physics.Velocity(0, 0);
	}
	static void collide (Ball other) {
		Physics.Velocity temp = (other.velocity).copy();
		temp.scale(-1);
		velocity.add(temp);
		Physics.Position dirVector = new Physics.Position(other.pos.getX()-pos.getX(), other.pos.getY()-pos.getY());
		Physics.Velocity side = velocity.scale(dirVector.cross(velocity)/dirVector.mag()/velocity.mag());
		side.scale(-1);
		velocity.add(side);
		(other.velocity).set(velocity);
		side.scale(-1);
		velocity.set(side);
		temp.scale(-1);
		(other.velocity).add(temp);
		velocity.add(temp);
	}
	static void collide (Obstacle obstacle) {

	}
}
