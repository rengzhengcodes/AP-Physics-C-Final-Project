public class Acceleration extends VectorPhysics {
	public Acceleration(int x, int y) {
		super(x, y);
	}

	public Acceleration(PVector vec) {
		super(vec);
	}

	public void add(Acceleration vec) {
		this.vec.add(vec);
	}
}
