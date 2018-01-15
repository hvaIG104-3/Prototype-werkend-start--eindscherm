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
ControlButton goResume;

//particles for Player
ParticleSystem jetpackParticle = new ParticleSystem(width/2, height/2);

Obstacles obstacle1[] =new Obstacles[100];
Player player = new Player();
Enemy enemies = new Enemy();
Pu_exp exp = new Pu_exp();        
Pu_slow slow = new Pu_slow();
Pu_lives livespu = new Pu_lives();
Lives lives = new Lives();
StartScreen start = new StartScreen();
EndScreen end= new EndScreen();
Score score = new Score();
ScoreBoard scoreBoard = new ScoreBoard();
Controls controls = new Controls();

boolean pauze;
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
PImage img;
PImage img2;
PImage [] background = new PImage[2];
PImage pow2;
PImage pow3;
PImage pow4;
PImage plyr;
PImage startScreen;
PImage gameOptie;
PImage gameOptieController;

//Sound Files//
//sound 1//
SoundFile file;
//sound 2//
SoundFile soundSlow;
SoundFile soundObstacle;
SoundFile soundEnemy;
SoundFile soundCoin;
SoundFile soundLives;
SoundFile soundGameOver;
SoundFile soundIntro;


//Initialization of all classes
void setup() {
  size(800, 600);
  frameRate(60);
  background(51);
  player.init();
  lives.init();
  enemies.init();
  exp.init();
  slow.init();
  livespu.init();
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
  points = punten;

  //controller
  // Initialise the ControlIO
  control = ControlIO.getInstance(this);
  // Find a device that matches the configuration file
  cont = control.getMatchedDevice("/Controls/ps4Controller");
  if (cont != null) {
  }
  //Deze loop zorgt ervoor dat er 10 objecten worden aangemaakt en geinitialiseerd.
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
  img = loadImage("Images/enemy.png");
  img2 = loadImage("Images/collision.png"); 
  pow2 = loadImage("Images/powt.png");  
  pow3 = loadImage("Images/powh.png");  
  pow4 = loadImage("Images/pow4.png");   
  plyr = loadImage("Images/plyr.png");
  gameOptie = loadImage("Images/gameOptie.png");
  gameOptieController = loadImage("Images/gameOptieController.png");

  //inladen van soundfile uit de main map//
  //sound 1//

  file = new SoundFile(this, "Sound/starts.mp3");

  //sound 2//
  soundSlow = new SoundFile(this, "Sound/slow.mp3");
  soundCoin = new SoundFile(this, "Sound/coin.wav");
  soundLives = new SoundFile(this, "Sound/Lives.wav");
  soundObstacle = new SoundFile(this, "Sound/obstacle.wav");
  soundEnemy = new SoundFile(this, "Sound/enemy.flac");
  soundGameOver = new SoundFile(this, "Sound/gameOver.wav");
  soundIntro = new SoundFile(this, "Sound/introMusic.wav");
}

//Updating all classes
void updateGame() {
  player.update();
  lives.update();
  score.update();
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
  /*
  if (keyCode == 'P') {    
   // noLoop(); zorgt ervoor dat de loop/draw wordt stopgezet met loop() gaat de loop/draw weer verder me waar het was voor de noLoop()
   if (looping) {
   noLoop();
   }
   } else if (keyCode == 'R') {
   loop();
   }
   */
}
void keyReleased() {
  player.move(0);
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



  enemies.draw();
  exp.draw();
  slow.draw();
  livespu.draw();
  lives.draw();
  score.draw();
  jetpackParticle.draw();
  textAlign(RIGHT);
  textSize(25);
   if (cont != null) {
     image(gameOptieController, 650, 52, 143, 84);
   } else {
  image(gameOptie, 650, 52, 116, 83);
   }
}

void reset() {
  background(51);
  player.init();
  lives.init();
  enemies.init();
  exp.init();
  slow.init();
  livespu.init();
  punten = 0;
}

void startScreen() {
  
  //haalt de setup en draw uit StartScreen
  start.setup();
  start.draw();
  //zorgt er voor dat elkaar als game start je na game over eerst naar endscreen gaat
  controls.keyPressed();
  controls.getUserInput();
}

void endScreen() {
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

void highScore() {
  scoreBoard.draw();
  if (again ==3) {//zorgt ervoor dat je terugkeert naar eindscherm
    stage = 3;
  }
}

void draw() {
  pauze = false;
  controls.keyPressed();
  controls.getUserInput();
  
  if (pauze == false) {
    //startscherm
    if (stage ==1) {
      startScreen();
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
      endScreen();
    }
    //scoreboard/highscore
    if (stage == 4) {
      highScore();
    }
  }
 
}