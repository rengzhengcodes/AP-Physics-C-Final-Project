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
