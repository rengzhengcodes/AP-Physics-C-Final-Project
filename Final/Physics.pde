import java.util.*;

public static class Physics {
	public static final Acceleration g = new Acceleration(new PVector(0, 0, 9.81));
	public static final float pixelsPerMeter = 1400 / 2.7;

	static abstract class VectorPhysics {
		private final String units = null;
		private PVector vec;
		public VectorPhysics(float x, float y) {
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

		public float mag() {
			return this.vec.mag();
		}

		public float heading() {
			return this.vec.heading();
		}

		public float getX() {
			return this.vec.x;
		}

		public float getY() {
			return this.vec.y;
		}
		public void normalize() {
			this.vec.normalize();
		}

		public void rotate(float x) {
			this.vec.rotate(x);
		}
	}

	static class Position extends VectorPhysics {
		private final String units = "m";
		private PVector vec;

		public Position(float x, float y) {
			super(x, y);
		}

		public Position(PVector vec) {
			super(vec);
		}

		public void add(Position vec) {
			super.vec.add(vec.getVec());
		}

		public void move(Velocity vec) {
			super.vec.add(vec.getVec());
		}

		public float heading() {
			return super.vec.heading();
		}

		public Position copy() {
			return new Position(super.vec.copy());
		}
	}

	static class Velocity extends VectorPhysics {
		private final String units = "m/s";
		private PVector vec;

		public Velocity(float x, float y) {
			super(x, y);
		}

		public Velocity(PVector vec) {
			super(vec);
		}

		public void add(Velocity vec) {
			super.vec.add(vec.getVec());
		}

		public void accelerate(Acceleration	vec) {
			super.vec.add(vec.getVec());
		}

		public void scale(float m) {
			super.vec.mult(m);
		}

		public Velocity copy() {
			return new Velocity(super.vec.copy());
		}
	}

	static class Acceleration extends VectorPhysics {
		private final String units = "m/s^2";
		private PVector vec;

		public Acceleration(float x, float y) {
			super(x, y);
		}

		public Acceleration(PVector vec) {
			super(vec);
		}

		public void add(Acceleration vec) {
			super.vec.add(vec.getVec());
		}

		public void scale(float m) {
			super.vec.mult(m);
		}
	}

	static class Force extends VectorPhysics {
		private final String units = "N";
		private PVector vec;

		public Force(PVector vec) {
			super(vec);
		}

		public void add(Force vec) {
			super.vec.add(vec.getVec());
		}

		public void scale(float m) {
			super.vec.mult(m);
		}

		public float mag() {
			return super.vec.mag();
		}

		public void normalize() {
			super.vec.normalize();
		}

		public void rotate(float x) {
			super.vec.rotate(x);
		}

		public Acceleration accel(float m) {
			super.vec.mult(1/m);
			Acceleration temp = new Acceleration(super.vec);
			super.vec.mult(m);
			return temp;
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
