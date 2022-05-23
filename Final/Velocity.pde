public class Velocity extends VectorPhysics {
	this.units = "m/s";

	public Velocity(int x, int y) {
		super(x, y);
	}

	public Velocity(PVector vec) {
		super(vec);
	}

	public void add(Velocity vec) {
		this.vec.add(vec);
	}

	public void accelerate(Acceleration	vec) {
		this.vec.add(vec);
	}
}
