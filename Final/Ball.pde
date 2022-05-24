public class Ball {
	private final int mass = 1;
	private final int size = 1;
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
}
