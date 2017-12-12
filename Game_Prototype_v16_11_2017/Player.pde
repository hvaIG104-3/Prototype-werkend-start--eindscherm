public class Player {

  float posX;
  float posY;
  float h, w;
  int clr;
  int direction;

  void setup() {
    if (cont != null) {
      move = cont.getHat("move");
    }
  }

  void init() {
    posX = 10;
    posY = height / 2;
    clr = color(255, 255, 0);
    h = 99;
    w = 50;
  }

  void draw() {
    //fill(255,20,0);
    //rect(posX,posY,w,h);
    image(plyr, posX, posY, w, h);
  }

  void update() {
    posY += direction * 1;
    getUserInput();      

    //Zorgt voor een particlesysteem bij de player
    jetpackParticle.emit(1);
    jetpackParticle.x0=posX+8;
    jetpackParticle.y0=posY+70;
  }

  public void move (int tDir) {
    direction = tDir;
  }


  public void getUserInput() {
    setup();
    if (cont != null) {
      boolean omhoog = move.up();
      posY += omhoog ? -5 * 1: 0;

      boolean omlaag = move.down();
      posY += omlaag ? 5 * 1 : 0;
    }
  }
}