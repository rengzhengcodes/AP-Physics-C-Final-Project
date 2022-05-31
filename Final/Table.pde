public class Table {
	private float floorFrictionCoeff;
	private MField mfield;
	public static final float width = 2.7;
	public static final float length = 1.4;

	/**
		*@param floorFrictionCoeff The coefficient of friction of the floor.
		*@param MField The (optional) magnetic field on the board
		*@param xsize The length of the table
		*@param ysize The width of the table
	**/
	//For the table with magnetic field and w. / without obstacles
	public table(float floorFrictionCoeff, MField mfield, float xsize, float ysize) {
		this.floorFrictionCoeff = floorFrictionCoeff;
		this.mfield = mfiled;
		this.xsize = xsize;
		this.ysize = ysize;
	}
	//For the generic pool table
	public table(float floorFrictionCoeff, float xsize, float ysize) {
		this.floorFrictionCoeff = floorFrictionCoeff;
		this.mfield = new Mfield(new PVector(0,0));
		this.xsize = xsize;
		this.ysize = ysize;
	}

	public MField getMfield() {
		return this.mfield;
	}

	public float getFloorFCoeff() {
		return this.floorFrictionCoeff;
	}
	public float xSize() {
		return xsize;
	}
	public float ySize() {
		return ysize;
	}
}
