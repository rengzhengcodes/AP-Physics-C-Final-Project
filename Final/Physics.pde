import java.util.*;

public class Physics {
	public final Acceleration g = new Acceleration(new PVector(0, 0, 9.81));

	static abstract class VectorPhysics {
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

	static class Position extends VectorPhysics {
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

	static class Velocity extends VectorPhysics {
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

	static class Acceleration extends VectorPhysics {
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

	static class Force extends VectorPhysics {
		this.units = "N";

		public Force(PVector vec) {
			super(vec);
		}

		public void add(Force vec) {
			this.vec.add(vec);
		}
	}

	/**
		*@param m Mass of object in kg.
		*@return Normal force
	**/
	public static Force getGravityForce(float m) {
		return new Force(PVector.mult(m, g.getVec()));
	}
}
