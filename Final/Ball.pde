public class Ball {
	private final int mass = 1;
	private final float size = 0.061;
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
	void collide (Ball other) {
		Physics.Velocity temp = (other.velocity).copy();
		temp.scale(-1);
		velocity.add(temp);
		Physics.Position dirVector = new Physics.Position(other.pos.getX()-pos.getX(), other.pos.getY()-pos.getY());
		Physics.Velocity unitDir = new Velocity(dirVector.copy());
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
		int shape = obstacle.getKind();
		if (shape==ELLIPSE) {
			Physics.Position dirVector = new Physics.Position(obstacle.getXPos()-pos.getX(), obstacle.getYPos()-pos.getY());
			Physics.Velocity unitDir = new Velocity(dirVector.copy());
			unitDir.normalize();
			unitDir.scale(dirVector.getVec().dot(unitDir.getVec()));
			unitDir.scale(-2);
			velocity.add(unitDir);
		} else {
			
		}
	}
}
