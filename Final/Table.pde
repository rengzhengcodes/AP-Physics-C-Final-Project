import java.util.*;

public class Table {
	private float floorFrictionCoeff;
	private MField mfield;
	public static final float l = 2.7;
	public static final float w = 1.4;
	private ArrayList<Obstacle> obs;

	/**
		*@param floorFrictionCoeff The coefficient of friction of the floor.
		*@param MField The (optional) magnetic field on the board
		*@param xsize The length of the table
		*@param ysize The width of the table
	**/
	//For the table with magnetic field and w. / without obstacles
	public Table(float floorFrictionCoeff, MField mfield) {
		this.floorFrictionCoeff = floorFrictionCoeff;
		this.mfield = mfield;
		obs = new ArrayList<Obstacle>();
	}
	//For the generic pool table
	public Table(float floorFrictionCoeff) {
		this.floorFrictionCoeff = floorFrictionCoeff;
		this.mfield = new MField(new PVector(0,0));
		obs = new ArrayList<Obstacle>();
	}

	public MField getMfield() {
		return this.mfield;
	}

	public float getFloorFCoeff() {
		return this.floorFrictionCoeff;
	}
	
	public float getWidth() {
		return w;
	}
	
	public float getLength() {
		return l;
	}
	
	public void addObject(Obstacle obstacle) {
		obs.add(obstacle);
	}
}
