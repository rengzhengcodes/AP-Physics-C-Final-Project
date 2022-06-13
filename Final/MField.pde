public class MField {
	private PVector field;

	/**
		*@param field The strength and direction of the field.
	**/

	public MField(PVector field) {
		this.field = field;
	}

	/**
		*@param strength The strength of the field
	**/
	public MField(float strength) {
		this(new PVector(0, 0, strength));
	}

	public float mag() {
		return this.field.mag();
	}

	public Physics.Force affectCharge(Physics.Velocity v, float charge) {
		PVector velocityVec = v.getVec();
		PVector resultant = velocityVec.cross(this.field).mult(charge);
		return new Physics.Force(resultant);
	}
}
