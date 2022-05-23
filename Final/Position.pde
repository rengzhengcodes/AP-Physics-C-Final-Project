public class Position extends VectorPhysics {
	public Position(int x, int y) {
		super(x, y);
	}

	public Position(PVector vec) {
		super(vec);
	}

	public void add(Position vec) {
		this.vec.add(vec);
	}

	public void move(Velocity vec) {
		this.vec.add(vec);
	}
}
