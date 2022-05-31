public class Obstacle {
	private float obsFrictionCoeff;
	private PShape pshape;
	private float xpos;
	private float ypos;
	private float radius;
	private float length;
	private float width;

	/**
		*@param obsFrictionCoeff The coefficient of friction to the obstacle.
		*@param PShape The shape of the obstacle (probably between rectangle and ball)
		*@param xpos The xpos of the table
		*@param ypos The ypos of the table
	**/
	
	public Obstacle(float obsFrictionCoeff, PShape pshape, float radius, float xpos, float ypos) {
		this(obsFrictionCoeff, pshape, radius, xpos, ypos);
	}
	
	public Obstacle(float obsFrictionCoeff, PShape pshape, float length, float width, float xpos, float ypos) {
		this(obsFrictionCoeff, pshape, length, width, xpos, ypos);
	}
	
	float getObsFrictionCoeff() {
		return obsFrictionCoeff;
	}
	
	PShape getPShape() {
		return pshape;
	}
	
	float getXPos() {
		return xpos;
	}
	
	float getYPos() {
		return ypos;
	}
	
	float getRadius() {
		return radius;
	}
	
	float getLength() {
		return length;
	}
	
	float getWidth() {
		return width;
	}
}
