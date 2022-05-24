public class Ball {
	private final int mass = 1;
	private final int size = 0.061;
	private float charge;
	private Velocity velocity;
	private Position pos;

	/**
		*@param charge The charge of the ball in Coulombs.
	**/
	public Ball(float charge) {
		this.charge = charge;
		this.velocity = new Velocity(0, 0);
	}
	static void collide (Ball other) {
		Velocity temp = (other.velocity).copy();
		temp.scale(-1);
		velocity.add(temp);
		Position dirVector = new Position(other.pos.getX()-pos.getX(), other.pos.getY()-pos.getY());
		Velocity side = velocity.scale(dirVector.cross(velocity)/dirVector.mag()/velocity.mag());
		side.scale(-1);
		velocity.add(side);
	}
}
