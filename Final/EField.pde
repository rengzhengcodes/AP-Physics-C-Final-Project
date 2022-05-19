public class EField {
	private PVector field;
	private int[] position;

	/**
		*@param field The strength and direction of the field.
		*@param position The position of the object.
	**/
	public EField(PVector field, int[] position) {
		this.field = field;
		this.position = position;
	}

	/**
		*@param x X strength of vector
		*@param y Y strength of vector
	**/
	public EField(float x, float y, int[] position) {
		this(new PVector(x, y), position);
	}
}
