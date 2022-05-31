public class Obstacle {
	private PShape pshape;
	private float xpos;
	private float ypos;
	private float radius;
	private float length;
	private float width;

	/**
		*@param PShape The shape of the obstacle (probably between rectangle and ball)
		*@param xpos The xpos of the table
		*@param ypos The ypos of the table
	**/
	
	public Obstacle(PShape pshape, float radius, float xpos, float ypos) {
		this.pshape = shape;
		this.radius = radius;
		this.xpos = xpos;
		this.ypos = ypos;
	}
	
	public Obstacle(PShape pshape, float length, float width, float xpos, float ypos) {
		this.pshape = shape;
		this.length = length;
		this.width = width;
		this.xpos = xpos;
		this.ypos = ypos;
	}
	
	public PShape getPShape() {
		return pshape;
	}
	
	public float getXPos() {
		return xpos;
	}
	
	public float getYPos() {
		return ypos;
	}
	
	public float getRadius() {
		return radius;
	}
	
	public float getLength() {
		return length;
	}
	
	public float getWidth() {
		return width;
	}
}
