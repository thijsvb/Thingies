class Drop {
  Cel cel;
  ArrayList<Cel> path = new ArrayList<Cel>();
  PVector vel;
  PVector grav;
  float mass = 10;
  float r = pow(mass, 1/3) * 10;

  Drop(Cel c) {
    cel = c;
    path.add(c);
    vel = new PVector();
    grav = new PVector(0, mass);
  }

  void fall() {
    PVector dir = PVector.add(vel, grav);
    dir.add(cel.pos);
    ArrayList<Cel> neighbors = cel.neighbors();

    Cel next = cel;
    float best = 1000;
    for (Cel c : neighbors) {
      PVector effort = PVector.sub(c.pos, dir);
      float total = effort.mag() + c.res;
      if (total < best) {
        next = c;
        best = total;
      }
    }

    moveTo(next);
  }

  void moveTo(Cel c) {
    PVector vel = PVector.sub(c.pos, cel.pos);
    path.add(c);
    cel = c;
  }

  void show() {
    noStroke();
    fill(255);
    ellipse(cel.pos.x, cel.pos.y, r, r);

    fill(180, 40);
    for (Cel c : path) {
      ellipse(c.pos.x, c.pos.y-r/4, r, r);
    }
  }
}