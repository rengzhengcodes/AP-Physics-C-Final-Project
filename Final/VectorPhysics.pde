public class VectorPhysics {
	private String units; // The units of the vector (for diagnostic purposes)
	private PVector vec; // The vector of the physics thing (direction + magnitude)

	/**
		*@param x X magnitude of the vector.
		*@param y Y magnitude of the vector.
		*@param units Units of the vector.
	**/
	public VectorPhysics(int x, int y, String units) {
		this(new PVector(x, y), units);
	}

	/**
		*@param vec Vector of mvmt.
		*@param units Units of the vector.
	**/
	public VectorPhysics(PVector vec, String units) {
		this.vec = vec;
		this.units = units;
	}
}
