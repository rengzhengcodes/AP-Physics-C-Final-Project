public class Force extends VectorPhysics {
	this.units = "N";

	public Force(PVector vec) {
		super(vec);
	}

	public void add(Force vec) {
		this.vec.add(vec);
	}
}
