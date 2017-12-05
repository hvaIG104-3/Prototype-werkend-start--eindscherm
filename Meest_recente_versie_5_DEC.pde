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

float punten;
float points;
int stage = 1;
int again;
int numObjectBegin = 10;
float[] lanes = new float[6];
float[] lanes2 = new float[]{800, 850, 900, 950, 1000, 1050, 1100, 1150, 1200, 1250, 1300, 1350, 1400, 1450, 1500, 1550, 1600};

//images//
PImage img;
PImage img2;
PImage bg1;
PImage bg2;
PImage pow2;
PImage pow3;
PImage pow4;
PImage plyr;
PImage startScreen;

import processing.sound.*;

//Sound Files//
//sound 1//
SoundFile file;
//String audioName1 = "starts.mp3";
//String path;
//sound 2//
SoundFile file2;
//String audioName2 = "loopt.mp3";
//String path2;
//sound 3//
SoundFile file3;
//String audioName3 = "beep.mp3";
//String path3;
//sound 4//
SoundFile file4;
//String audioName4 = "bop.wav";
//String path4;

//Initialization of all classes
void setup() {
  size(800, 600);
  background(51);
  player.init();
  lives.init();
  enemies.init();
  exp.init();
  slow.init();
  livespu.init();
  end.init();
  scoreBoard.init();
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


  //Deze loop zorgt ervoor dat er 10 objecten worden aangemaakt en geinitialiseerd.
  for (int i = 0; i<100; i++) {
    obstacle1[i]=new Obstacles();
    obstacle1[i].init();
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
  bg1 = loadImage("Images/bg1.jpg");   
  bg2 = loadImage("Images/bg2.jpg");   
  pow2 = loadImage("Images/powt.png");  
  pow3 = loadImage("Images/powh.png");  
  pow4 = loadImage("Images/pow4.png");   
  plyr = loadImage("Images/plyr.png");

  //inladen van soundfile uit de main map//
  //sound 1//
  //path = sketchPath(audioName1);
  //file = new SoundFile(this, path);
  file = new SoundFile(this, "Sound/starts.mp3");
  //sound 2//
  // path2 = sketchPath(audioName2);
  file2 = new SoundFile(this, "Sound/loopt.mp3");
  //sound 2 start//
  file2.play();

  //sound 3//
  //path3 = sketchPath(audioName3);
  file3 = new SoundFile(this, "Sound/beep.mp3");

  //sound 4//
  //path4 = sketchPath(audioName4);
  file4 = new SoundFile(this, "Sound/bop.wav");
}

//Updating all classes
void updateGame() {
  player.update();
  lives.update();
  start.update();
  end.update();
  score.update();
  jetpackParticle.update();

  if (player.posY < 0) {
    player.posY = 0;
  }
  if (player.posY > height-100) {
    player.posY = height-100;
  }
}

void keyPressed() {
  if (keyCode == UP) {
    player.move(-height/6);
  } else if (keyCode == DOWN) {
    player.move(height/6);
  } else if (keyCode == 'P') {
    // noLoop(); zorgt ervoor dat de loop/draw wordt stopgezet met loop() gaat de loop/draw weer verder me waar het was voor de noLoop()
    if (looping)
      noLoop();
  } else if (keyCode == 'R') {
    loop();
  } else if (keyCode =='E') {
    exit();
  } else if (keyCode =='M') { //stopt de muziek
    file.stop();
  } else if (keyCode == 'Q') { //zorgt dat je doorgaat naar eindscherm
    stage = 3;
  }
}

void keyReleased() {
  player.move(0);
}


void drawGame() {
  background(bg1);
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
  text("P = Pause", 790, 52);
  text("R = Resume", 790, 79);
  text("E = Exit", 790, 106);
  text("M = Sound OFF", 790, 131);
}

void draw() {
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
      score.reset();
      setup();
      stage =1;
    } else if (again ==2) {//zorgt ervoor dat je naar het Scoreboard gaat
      stage = 4;
    }
    //scoreboard/highscore
    if (stage == 4) {
      score.draw();
      scoreBoard.highScore();
      scoreBoard.draw();
      if (again ==3) {//zorgt ervoor dat je terugkeert naar eindscherm
        stage = 3;
      }
    }
  }
}