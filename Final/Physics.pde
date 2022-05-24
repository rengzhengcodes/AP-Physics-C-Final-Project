import java.util.*;

public static class Physics {
	public static final Acceleration g = new Acceleration(new PVector(0, 0, 9.81));
	public static final int pixelsPerMeter = 296;

	static abstract class VectorPhysics {
		private final String units = null;
		private PVector vec;
		public VectorPhysics(int x, int y) {
			this.vec = new PVector(x, y);
		}

		public VectorPhysics(PVector vec) {
			this.vec = vec;
		}

		public String getUnits() {
			return this.units;
		}

		public PVector getVec() {
			return this.vec;
		}
	}

	static class Position extends VectorPhysics {
		private final String units = "m";
		private PVector vec;

		public Position(int x, int y) {
			super(x, y);
		}

		public Position(PVector vec) {
			super(vec);
		}

		public void add(Position vec) {
			this.vec.add(vec.getVec());
		}

		public void move(Velocity vec) {
			this.vec.add(vec.getVec());
		}
	}

	static class Velocity extends VectorPhysics {
		private final String units = "m/s";
		private PVector vec;

		public Velocity(int x, int y) {
			super(x, y);
		}

		public Velocity(PVector vec) {
			super(vec);
		}

		public void add(Velocity vec) {
			this.vec.add(vec.getVec());
		}

		public void accelerate(Acceleration	vec) {
			this.vec.add(vec.getVec());
		}

		public void scale(float m) {
			this.vec.mult(m);
		}

		public Velocity copy() {
			return new Velocity(this.vec.copy());
		}
	}

	static class Acceleration extends VectorPhysics {
		private final String units = "m/s^2";
		private PVector vec;

		public Acceleration(int x, int y) {
			super(x, y);
		}

		public Acceleration(PVector vec) {
			super(vec);
		}

		public void add(Acceleration vec) {
			this.vec.add(vec.getVec());
		}
	}

	static class Force extends VectorPhysics {
		private final String units = "N";
		private PVector vec;

		public Force(PVector vec) {
			super(vec);
		}

		public void add(Force vec) {
			this.vec.add(vec.getVec());
		}
	}

	/**
		*@param m Mass of object in kg.
		*@return Normal force
	**/
	public static Force getGravityForce(float m) {
		return new Force(PVector.mult(g.getVec(), m));
	}
}
