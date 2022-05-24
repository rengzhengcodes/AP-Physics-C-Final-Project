public class Table {
	private float wallFrictionCoeff;
	private float floorFrictionCoeff;
	private MField mfield;
	public final width = 2.7;
	public final length = 1.4;

	/**
		*@param wallFrictionCoeff The coefficient of friction to the wall.
		*@param floorFrictionCoeff The coefficient of friction of the floor.
	**/
	public table(float wallFrictionCoeff, float floorFrictionCoeff, MField mfield) {
		this.wallFrictionCoeff = wallFrictionCoeff;
		this.floorFrictionCoeff = floorFrictionCoeff;
		this.mfield = mfiled;
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
}
