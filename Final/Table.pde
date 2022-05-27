public class Table {
	private float wallFrictionCoeff;
	private float floorFrictionCoeff;
	private MField mfield;
	private float xsize;
	private float ysize;

	/**
		*@param wallFrictionCoeff The coefficient of friction to the wall.
		*@param floorFrictionCoeff The coefficient of friction of the floor.
		*@param MField The (optional) magnetic field on the board
		*@param xsize The length of the table
		*@param ysize The width of the table
	**/
	public table(float wallFrictionCoeff, float floorFrictionCoeff, MField mfield, float xsize, float ysize) {
		this.wallFrictionCoeff = wallFrictionCoeff;
		this.floorFrictionCoeff = floorFrictionCoeff;
		this.mfield = mfiled;
		this.xsize = xsize;
		this.ysize = ysize;
	}
	public table(float wallFrictionCoeff, float floorFrictionCoeff, float xsize, float ysize) {
		this.wallFrictionCoeff = wallFrictionCoeff;
		this.floorFrictionCoeff = floorFrictionCoeff;
		this.mfield = new Mfield(new PVector(0,0));
		this.xsize = xsize;
		this.ysize = ysize;
	}

	public MField getMfield() {
		return mefield;
	}

	public float getWallFCoeff() {
		return wallFrictionCoeff;
	}

	public float getFloorFCoeff() {
		return floorFrictionCoeff;
	}
	public float xSize() {
		return xsize;
	}
	public float ySize() {
		return ysize;
	}
}
