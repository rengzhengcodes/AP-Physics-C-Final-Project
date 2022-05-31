public class MField {
	private PVector field;
	private int[] position;

	/**
		*@param field The strength and direction of the field.
		*@param position The position of the object.
	**/
	public MField(PVector field, int[] position) {
		this.field = field;
		this.position = position;
	}
	public MField(PVector field) {
		this.field = field;
	}

	/**
		*@param strength The strength of the field
		*@param position The position of the field
	**/
	public MField(float strength, int[] position) {
		this(new PVector(0, 0, strength), position);
	}

	public Physics.Force affectCharge(Physics.Velocity v, float charge) {
		PVector velocityVec = v.getVec();
		PVector resultant = velocityVec.cross(this.field).mult(charge);
		return new Physics.Force(resultant);
	}
}
