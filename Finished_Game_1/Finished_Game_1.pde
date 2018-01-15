import processing.sound.*;
//controller
import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

//controller
ControlIO control;
Configuration config;
ControlDevice cont;
ControlHat move;
ControlButton startKnop;
ControlButton goTry;
ControlButton goExit;
ControlButton goScore;

//particles for Player
ParticleSystem jetpackParticle = new ParticleSystem(width/2, height/2);
ParticleSystem colissionsObstacle = new ParticleSystem(width/2, height/2);

Obstacles obstacle1[] =new Obstacles[100];
Bullet bullet = new Bullet();
Player player = new Player();
Pu_exp exp = new Pu_exp();        
Pu_slow slow = new Pu_slow();
Pu_lives livespu = new Pu_lives();
Lives lives = new Lives();
StartScreen start = new StartScreen();
EndScreen end= new EndScreen();
Score score = new Score();
ScoreBoard scoreBoard = new ScoreBoard();
Controls controls = new Controls();

float punten;
float points;
float pPosX;
float pPosY;
float [] bg = new float [2];
int stage = 1;
int again;
int numObjectBegin = 10;
int bgSpeed = 2;
float[] lanes = new float[6];
float[] lanes2 = new float[]{800, 850, 900, 950, 1000, 1050, 1100, 1150, 1200, 1250, 1300, 1350, 1400, 1450, 1500, 1550, 1600};

//images//
PImage imgEnemy;
PImage imgObstacle;
PImage [] background = new PImage[2];
PImage powTime;
PImage powHealth;
PImage powPoints;
PImage imgPlayer;
PImage startScreen;
PImage plasmabolt;

//Sound Files//
SoundFile music;
SoundFile file3;
SoundFile file4;

//Initialization of all classes
void setup() {
  size(800, 600);
  frameRate(60);
  background(51);
  player.init();
  lives.init();
  exp.init();
  slow.init();
  livespu.init();
  scoreBoard.init();
  bullet.init();
  jetpackParticle= new ParticleSystem(width/2, height/2);
  jetpackParticle.spreadFactor=0.3916084;
  jetpackParticle.minSpeed=1.0;
  jetpackParticle.maxSpeed=1.0;
  jetpackParticle.startVx=-0.07692307;
  jetpackParticle.startVy=0.7482517;
  jetpackParticle.particleShape="ellipse";
  jetpackParticle.emitterType="point";
  jetpackParticle.birthSize=10.0;
  jetpackParticle.deathSize=23.846153;
  jetpackParticle.gravity=0.044055946;
  jetpackParticle.birthColor=color(255.0, 98.0, 0.0, 230.0);
  jetpackParticle.deathColor=color(206.0, 0.0, 0.0, 0.0);
  jetpackParticle.blendMode="add";
  jetpackParticle.framesToLive=53;

  colissionsObstacle= new ParticleSystem(width/2, height/2);
  colissionsObstacle.spreadFactor=1.0;
  colissionsObstacle.minSpeed=1.0;
  colissionsObstacle.maxSpeed=4.0;
  colissionsObstacle.startVx=0.0;
  colissionsObstacle.startVy=0.0069930553;
  colissionsObstacle.particleShape="ellipse";
  colissionsObstacle.emitterType="point";
  colissionsObstacle.birthSize=15.538462;
  colissionsObstacle.deathSize=31.461536;
  colissionsObstacle.gravity=0.0;
  colissionsObstacle.birthColor=color(255.0, 62.0, 0.0, 255.0);
  colissionsObstacle.deathColor=color(255.0, 0.0, 0.0, 255.0);
  colissionsObstacle.blendMode="add";
  colissionsObstacle.framesToLive=200;

  points = punten;

  //controller
  // Initialise the ControlIO
  control = ControlIO.getInstance(this);
  // Find a device that matches the configuration file
  cont = control.getMatchedDevice("Controller");
  if (cont != null) {
  }
  //Deze loop zorgt ervoor dat er 25 objecten worden aangemaakt en geinitialiseerd.
  for (int i = 0; i<25; i++) {
    obstacle1[i]=new Obstacles();
    obstacle1[i].init();
  }
  //bewegende achtergrond image 
  for (int i = 0; i < 2; i ++)
  {
    background[i] = loadImage("Images/sky1.jpg");
    bg[i] = width * i;
  }

  lanes[0] = 0;
  lanes[1] = 100;
  lanes[2] = 200;
  lanes[3] = 300;
  lanes[4] = 400;
  lanes[5] = 500;

  // Images must be in the "data" directory to load correctly
  imgEnemy = loadImage("Images/enemy.png");
  imgObstacle = loadImage("Images/obstacle.png"); 
  powTime = loadImage("Images/powt.png");  
  powHealth = loadImage("Images/powh.png");  
  powPoints = loadImage("Images/powp.png");   
  imgPlayer = loadImage("Images/plyr.png");
  plasmabolt = loadImage("Images/plasmabolt.png");

  //inladen van soundfile uit de main map//
  music = new SoundFile(this, "Sound/startschermmusic.mp3");
  file3 = new SoundFile(this, "Sound/beep.mp3");
  file4 = new SoundFile(this, "Sound/bop.wav");
}

//Updating all classes
void updateGame() {
  player.update();
  lives.update();
  score.update();
  bullet.update();
  colissionsObstacle.update();
  jetpackParticle.update();

  if (pPosY < 0) {
    pPosY = 0;
  }
  if (pPosY > height-100) {
    pPosY = height-100;
  }
}

void keyPressed() {
  if (keyCode == UP) {
    player.move(-height/6 * 1);
  }
  if (keyCode == DOWN) {
    player.move(height/6 * 1);
  }
  if (keyCode == LEFT) {
    player.moveHor(-50);
  }
  if (keyCode == RIGHT) {
    player.moveHor (50);
  }
  if (keyCode == 'P') {    
    // noLoop(); zorgt ervoor dat de loop/draw wordt stopgezet met loop() gaat de loop/draw weer verder me waar het was voor de noLoop()
    if (looping) {
      noLoop();
    }
  } else if (keyCode == 'R') {
    loop();
  }
}
void keyReleased() {
  player.move(0);
  player.moveHor(0);
}

void drawGame() {


  //background tekenen
  for (int j = 0; j < bg.length; j++)
  {
    image(background[j], bg[j], 0);
    bg[j] -= bgSpeed;

    if (bg[j] + width <= 0)
    {
      bg[j] = width;
    }
  }

  player.draw();
  //teken de eerste obstakels
  for (int i=0; i<numObjectBegin; i++) {
    obstacle1[i].draw();
  }
  //bij 600 punten teken er vier bij
  if (punten >= 150) {
    for (int i = numObjectBegin; i< numObjectBegin + 1; i++) {
      obstacle1[i].draw();
    }
  }
  //bij 1250 nog meer
  if (punten >= 300) {
    for (int i = numObjectBegin+1; i< numObjectBegin + 2; i++) {
      obstacle1[i].draw();
    }
  }
  if (punten >= 450) {
    for (int i = numObjectBegin+2; i< numObjectBegin + 3; i++) {
      obstacle1[i].draw();
    }
  }
  if (punten >= 600) {
    for (int i = numObjectBegin+3; i< numObjectBegin + 4; i++) {
      obstacle1[i].draw();
    }
  }
  if (punten >= 750) {
    for (int i = numObjectBegin+4; i< numObjectBegin + 5; i++) {
      obstacle1[i].draw();
    }
  }
  if (punten >= 900) {
    for (int i = numObjectBegin+5; i< numObjectBegin + 6; i++) {
      obstacle1[i].draw();
    }
  }
  if (punten >= 1050) {
    for (int i = numObjectBegin+6; i< numObjectBegin + 7; i++) {
      obstacle1[i].draw();
    }
  }
  if (punten >= 1200) {
    for (int i = numObjectBegin+7; i< numObjectBegin + 8; i++) {
      obstacle1[i].draw();
    }
  }
  if (punten >= 1350) {
    for (int i = numObjectBegin+8; i< numObjectBegin + 9; i++) {
      obstacle1[i].draw();
    }
  }
  if (punten >= 1500) {
    for (int i = numObjectBegin+9; i< numObjectBegin + 10; i++) {
      obstacle1[i].draw();
    }
  }
  if (punten >= 2000) {
    for (int i = numObjectBegin+10; i< numObjectBegin + 12; i++) {
      obstacle1[i].draw();
    }
  }
  exp.draw();
  slow.draw();
  livespu.draw();
  lives.draw();
  score.draw();
  jetpackParticle.draw();
  colissionsObstacle.draw();
  if (bullet.isFired) {
    bullet.draw();
  }
  textAlign(RIGHT);
  textSize(25);
  text("P = Pause", 790, 52);
  text("R = Resume", 790, 79);
  text("E = Exit", 790, 106);
  text("M = Sound OFF", 790, 131);
}

void reset() {
  background(51);
  player.init();
  lives.init();
  exp.init();
  slow.init();
  livespu.init();
  scoreBoard.init();
  punten = 0;
}

void draw() {
  controls.keyPressed();
  controls.getUserInput();
  //startscherm
  if (stage ==1) {
    //haalt de setup en draw uit StartScreen
    start.setup();
    start.draw();
    //zorgt er voor dat elkaar als game start je na game over eerst naar endscreen gaat
  }
  //de game zelf
  if (stage ==2) {
    drawGame();
    updateGame();
    keyPressed();
    keyReleased();
  }
  //Eindscherm
  if ( stage ==3) {
    again = 0;
    //haalt de setup en draw uit EndScreen
    end.setup();
    end.draw();
    if (again == 1) { //zorgt dat je word terug gezet naar beginscherm en opnieuw kan spelen
      reset();
      stage =1;
    } else if (again ==2) {//zorgt ervoor dat je naar het Scoreboard gaat
      stage = 4;
    }
  }
  //scoreboard/highscore
  if (stage == 4) {
    score.draw();    
    scoreBoard.draw();
    if (again ==3) {//zorgt ervoor dat je terugkeert naar eindscherm
      stage = 3;
    }
  }
}