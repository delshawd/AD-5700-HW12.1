
void setup() {
  size(800, 600); //2D mode
}

void draw() {
  background(0);

  pushMatrix();
  translate(width/2, height/2);
  scale(2, 2);
  int skip = 1;

  stroke(255);
  strokeWeight(2);

  float sumX = 0;
  float sumY = 0;
  float total = 0;

  float record = height;
  float recordX = 0;
  float recordY = 0;

  String[] lines = loadStrings("steeringwheel.ply");

  for (int i=9; i<695; i+=skip) {
    String[] points = lines[i].split(" ");
    float x = float(points[0]);
    float y = float(points[1]);
    float z = float(points[2]);

    point(x, y);

    sumX += x;
    sumY += y;
    total++;

    if (y < record) {
      record = y;
      recordX = x;
      recordY = y;
    }
  }

  stroke(0, 0, 255);
  strokeWeight(10);
  point(sumX/total, sumY/total);

  stroke(0, 255, 0);
  strokeWeight(10);
  point(recordX, recordY);

  popMatrix();
}
