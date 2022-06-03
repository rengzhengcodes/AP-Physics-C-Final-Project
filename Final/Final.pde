// !!!!!Canvas max size 800x1400!!!!!!
void setup() {
 // cannot have any functions in size for some stupid reason, including numerical operators
	size(1400, 700);
	frameRate(120);
}

void draw() {
	PImage tableImage = loadImage("Pool Table.png");
	tableImage.resize(width, height);
	imageMode(CORNER);
	image(tableImage, 0, 0);
}

void defineBallPos() {
	Physics.Position[] ballStarts = {
		new Physics.Position(1, 1),
		new Physics.Position(10, 10),
		new Physics.Position(20, 20),
		new Physics.Position(30, 30),
		new Physics.Position(40, 40),
		new Physics.Position(50, 50),
		new Physics.Position(60, 60),
		new Physics.Position(70, 70),
		new Physics.Position(80, 80),
		new Physics.Position(90, 90),
		new Physics.Position(100, 100),
		new Physics.Position(110, 110),
		new Physics.Position(120, 120),
		new Physics.Position(130, 130),
		new Physics.Position(140, 140),
		new Physics.Position(150, 150)
	}
}
