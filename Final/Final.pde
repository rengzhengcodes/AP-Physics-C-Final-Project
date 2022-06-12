// !!!!!Canvas max size 800x1400!!!!!!
Table table = new Table(1);

void setup() {
 // cannot have any functions in size for some stupid reason, including numerical operators
	size(1400, 700);
	frameRate(24);
	defineBallPos();
}

void draw() {
	PImage tableImage = loadImage("Pool Table.png");
	tableImage.resize(width, height);
	imageMode(CORNER);
	image(tableImage, 0, 0);
	for (Ball i: table.getBalls()) { 
    		i.display();
	}
}

void defineBallPos() {
	Physics.Position[] ballStarts = {
		new Physics.Position(350, 350),
		new Physics.Position(900, 350),
		new Physics.Position(938, 328),
		new Physics.Position(938, 372),
		new Physics.Position(976, 306),
		new Physics.Position(976, 350),
		new Physics.Position(976, 394),
		new Physics.Position(1014, 284),
		new Physics.Position(1014, 328),
		new Physics.Position(1014, 372),
		new Physics.Position(1014, 416),
		new Physics.Position(1052, 262),
		new Physics.Position(1052, 306),
		new Physics.Position(1052, 350),
		new Physics.Position(1052, 394),
		new Physics.Position(1052, 438)
	};
	table.addBall(new Ball(0, "cue.png", table));
	table.getBall(0).setPosition(ballStarts[0]);
	for (int i = 0; i < ballStarts.length - 1; i++) {
		table.addBall(new Ball(0, (i+1) + ".png", table));
		table.getBall(i+1).setPosition(ballStarts[i+1]);
	}
}
