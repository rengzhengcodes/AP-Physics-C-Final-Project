public class Obstacle {
	private PShape pshape;
	private float xpos;
	private float ypos;
	private float radius;
	private float l;
	private float w;
	private PImage img;

	/**
		*@param PShape The shape of the obstacle (probably between rectangle and ball)
		*@param length The length of the obstacle (if rectangle)
		*@param width The width of the obstacle (if rectangle)
		*@param radius The radius of the obstacle (if circle)
		*@param xpos The xpos of the obstacle
		*@param ypos The ypos of the obstacle
	**/

	public Obstacle(PShape pshape, float radius, float xpos, float ypos) {
		this.pshape = pshape;
		this.radius = radius;
		this.xpos = xpos;
		this.ypos = ypos;
		convertToImage();
	}

	public Obstacle(PShape pshape, float l, float w, float xpos, float ypos) {
		this.pshape = pshape;
		this.l = l;
		this.w = w;
		this.xpos = xpos;
		this.ypos = ypos;
		convertToImage();
	}
	
	public void convertToImage() {
		if (getKind()==RECT) {
			img = createImage(int(l), int(w), RGB);
			img.loadPixels();
			for (int i = 0; i < img.pixels.length; i++) {
				img.pixels[i] = color(37, 128, 72);
			}
			img.updatePixels();
		} else {
			img = loadImage("obstacle.png");
		}
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
		return l;
	}

	public float getWidth() {
		return w;
	}

	public int getKind() {
		//should return either RECT or ELLIPSE
		return pshape.getKind();
	}
	void display() {
		pushMatrix();
		translate(xpos, ypos);
		imageMode(CENTER);
		image(img, 0, 0, l, w);
		popMatrix();
	}
}
