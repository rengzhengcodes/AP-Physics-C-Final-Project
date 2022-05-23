public abstract class VectorPhysics {
	private final String units; // The units of the vector (for diagnostic purposes)
	private PVector vec; // The vector of the physics thing (direction + magnitude)

	public VectorPhysics(int x, int y) {
		this.vec = new PVector(x, y);
	}

	public VectorPhysics(PVector vec) {
		this.vec = vec;
	}

	public abstract void add();

	public String getUnits() {
		return this.units;
	}

	public PVector getVec() {
		return this.vec;
	}
}
