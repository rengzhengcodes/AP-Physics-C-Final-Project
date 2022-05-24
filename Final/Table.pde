public class Table {
	private float wallFrictionCoeff;
	private float floorFrictionCoeff;
	private MField mfield;
	public static final float width = 2.7;
	public static final float length = 1.4;

	/**
		*@param wallFrictionCoeff The coefficient of friction to the wall.
		*@param floorFrictionCoeff The coefficient of friction of the floor.
	**/
	public Table(float wallFrictionCoeff, float floorFrictionCoeff, MField mfield) {
		this.wallFrictionCoeff = wallFrictionCoeff;
		this.floorFrictionCoeff = floorFrictionCoeff;
		this.mfield = mfield;
	}

	public MField getMfield() {
		return this.mfield;
	}

	public float getWallFCoeff() {
		return this.wallFrictionCoeff;
	}

	public float getFloorFCoeff() {
		return this.floorFrictionCoeff;
	}
}
