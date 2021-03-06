public class Player {

  float h, w;
  int clr;
  int direction;
  int hDirection;

  void setup() {
    if (cont != null) {
      move = cont.getHat("move");
    }
  }

  void init() {
    pPosX = 10;
    pPosY = height / 2;
    clr = color(255, 255, 0);
    h = 99;
    w = 50;
  }

  void draw() {
    //fill(255,20,0);
    //rect(posX,posY,w,h);
    image(imgPlayer, pPosX, pPosY, w, h);
  }

  void update() {
    pPosY += direction * 1; 
    pPosX += hDirection * 1;
    
    if(pPosX<0)
    pPosX = 0;
    if(pPosX >width/4)
    pPosX = width/4;
    if(pPosY > height)
    pPosY = height;
    if(pPosY < 0)
    pPosY =0;

    //Zorgt voor een particlesysteem bij de player
    jetpackParticle.emit(1);
    jetpackParticle.x0=pPosX+8;
    jetpackParticle.y0=pPosY+70;
    
  }

  public void move (int tDir) {
    direction = tDir;
  }
  public void moveHor(int hDir){
  hDirection= hDir;
  }
}