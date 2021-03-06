// !!!!!Canvas max size 800x1400!!!!!!
Table table = new Table(1);
Physics.Position mouseStart = null;
PImage tableImage;
HScrollbar hs1, hs2;
int mode = 0;
Obstacle center1;
Obstacle center2;

void setup() {
 // cannot have any functions in size for some stupid reason, including numerical operators
  size(1400, 800);
  frameRate(24);
  defineBallPos();
  defineWalls();
  center1 = center1Obstacle();
  center2 = center2Obstacle();
  tableImage = loadImage("Pool Table.png");
  tableImage.resize(1400, 700);

  hs1 = new HScrollbar(0, 740, width, 16, 16);
  hs2 = new HScrollbar(0, 790, width, 16, 16);
}

void draw() {
	background(255);

	if (table.getBalls().size() == 1) {
		imageMode(CORNER);
		image(loadImage("win.jpg"), 0, 0);
		return;
	}
	switch (mode) {
		case 0:
			image(loadImage("choice.jpg"), 0, 0);

			if (mousePressed) {
				if (mouseX < 1400/3.) {
					mode = 1;
					table.getObstacles().remove(center1);
					table.getObstacles().remove(center2);
				} else if (mouseX < 1400 * 2/3.) {
					mode = 2;
					table.getObstacles().remove(center1);
					table.getObstacles().remove(center2);
				} else {
					mode = 3;
				}
			}
			return;
		case 1:
			break;
		case 3:
		case 2:
			hs1.update();
			hs2.update();
			hs1.display();
			textAlign(CENTER);
			textSize(20);
			MField mf = new MField((hs1.getPos() - 700) / 700);
			table.setMField(mf);
			text("Magnetic Field Strength: " + (hs1.getPos() - 700) / 700, width/2, 720);
			hs2.display();
			table.getBalls().get(0).setCharge((hs2.getPos() - 700) / 700);
			text("Cue Ball Charge: " + table.getBalls().get(0).getCharge(), width/2, 770);
			break;
	}

	imageMode(CORNER);
	image(tableImage, 0, 0);
	ArrayList<Ball> arr = table.getBalls();
	for (int i = 0; i < arr.size(); i++) {
		arr.get(i).display();
		arr.get(i).move();
		for (int j = 0; j < i; j++) {
			arr.get(i).collide(arr.get(j));
		}
	}

	detectPots();

	for (Obstacle i: table.getObstacles()) {
		i.display();
	}

	if (mode >= 2) {
		textSize(20);
		textAlign(CENTER);
		if (table.getBalls().get(0).getCharge() > 0) {
			Physics.Position ballPos = table.getBalls().get(0).getPosition();
			fill(color(255, 0, 0));
			text("+", ballPos.getX(), ballPos.getY());
		} else if (table.getBalls().get(0).getCharge() < 0) {
			Physics.Position ballPos = table.getBalls().get(0).getPosition();
			fill(color(0, 0, 255));
			text("-", ballPos.getX(), ballPos.getY());
		}

		textSize(50);
		fill(255);
		if ((hs1.getPos() - 700) / 700 < 0) {
			text("X", 700, 350);
			text("X", 350, 350);
			text("X", 1050, 350);
			text("X", 700, 450);
			text("X", 350, 450);
			text("X", 1050, 450);
			text("X", 700, 250);
			text("X", 350, 250);
			text("X", 1050, 250);
		} else if ((hs1.getPos() - 700) / 700 > 0) {
			text(".", 350, 350);
			text(".", 700, 350);
			text(".", 1050, 350);
			text(".", 700, 450);
			text(".", 350, 450);
			text(".", 1050, 450);
			text(".", 700, 250);
			text(".", 350, 250);
			text(".", 1050, 250);
		}
	}

	if (mouseStart != null) {
		strokeWeight(8);
		stroke(0);
		line(mouseStart.getX(), mouseStart.getY(), mouseX, mouseY);
		System.out.println("drawing line");
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

void defineWalls() {
  Physics.Position[] wallPoses = {
    new Physics.Position(380, 60),
    new Physics.Position(1020, 60),
    new Physics.Position(30, 350),
    new Physics.Position(380, 642),
    new Physics.Position(1020, 642),
    new Physics.Position(1370, 350)
  };
  PShape pshape;
  Obstacle obs;
  for (int i = 0; i < wallPoses.length; i++) {
    if (i % 3 != 2) {
      pshape = createShape(RECT, wallPoses[i].getX()-270, wallPoses[i].getY()-24, 540, 48);
      obs = new Obstacle(pshape, 540, 48, wallPoses[i].getX(), wallPoses[i].getY());
      table.addObstacle(obs);
    } else {
      pshape = createShape(RECT, wallPoses[i].getX()-24, wallPoses[i].getY()-250, 48, 500);
      obs = new Obstacle(pshape, 48, 500, wallPoses[i].getX(), wallPoses[i].getY());
      table.addObstacle(obs);
    }
  }
}

Obstacle center1Obstacle() {
  PShape rect = createShape(RECT, 700, 340, 200, 130);
  Obstacle obs = new Obstacle(rect, 200, 130, 700, 340);
  table.addObstacle(obs);
  return obs;
}

Obstacle center2Obstacle() {
  PShape rect = createShape(RECT, 690, 350, 230, 100);
  Obstacle obs = new Obstacle(rect, 230, 100, 690, 350);
  table.addObstacle(obs);
  return obs;
}

void detectPots() {
  int r = 30;
  Physics.Position[] potPoses = {
    new Physics.Position(698, 641),
    new Physics.Position(1330, 621),
    new Physics.Position(1330, 76),
    new Physics.Position(698, 55),
    new Physics.Position(66, 77),
    new Physics.Position(66, 621)
  };

  ArrayList<Ball> potted = new ArrayList<Ball>();

  for (Ball i: table.getBalls()) {
    Physics.Position iPos = i.getPosition();
    for (Physics.Position potPos: potPoses) {
      if (dist(iPos.getX(), iPos.getY(), potPos.getX(), potPos.getY()) <= r) {
        potted.add(i);
      }
    }
  }

  for (Ball i: potted) {
    if (i == table.getBalls().get(0)) {
      i.setVelocity(new Physics.Velocity(0, 0));
      i.setPosition(new Physics.Position(350, 350));
    } else {
      table.removeBall(i);
    }
  }
}

void mousePressed() {
  System.out.println(mouseX + ", " + mouseY);
  Physics.Position cuePos = table.getBall(0).getPosition();
  if (dist(mouseX, mouseY, cuePos.getX(), cuePos.getY()) < Ball.size * Physics.pixelsPerMeter) {
    mouseStart = new Physics.Position(mouseX, mouseY);
    System.out.println(mouseStart.getX() + ", " + mouseStart.getY());
  }
}

void mouseReleased() {
  if (mouseStart != null) {
    Physics.Velocity vel = new Physics.Velocity(mouseStart.getX() - mouseX, mouseStart.getY() - mouseY);
    vel.scale(1/2.);
    table.getBall(0).setVelocity(vel);

    mouseStart = null;
    System.out.println("mouse released");
  }
}
