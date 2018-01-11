Obstacles obstacle1 =new Obstacles();
Player player = new Player();
Enemy enemies = new Enemy();
Pu_exp exp = new Pu_exp();        
Pu_slow slow = new Pu_slow();
Pu_lives livespu = new Pu_lives();
Lives lives = new Lives();
StartScreen start = new StartScreen();
EndScreen end= new EndScreen();
Score score = new Score();
float punten;
int stage = 1;
int again;
float[] lanes = new float[6];

//images//
PImage img;
PImage img2;
PImage bg1;
PImage bg2;
PImage pow2;
PImage pow3;
PImage pow4;
PImage plyr;

import processing.sound.*;
//Sound Files//
//sound 1//
SoundFile file;
String audioName1 = "starts.mp3";
String path;
//sound 2//
SoundFile file2;
String audioName2 = "loopt.mp3";
String path2;
//sound 3//
SoundFile file3;
String audioName3 = "beep.mp3";
String path3;
//sound 4//
SoundFile file4;
String audioName4 = "bop.wav";
String path4;

//Initialization of all classes
void setup() {
  size(800, 600);
  background(51);
  player.init();
  lives.init();
  obstacle1.init();
  enemies.init();
  exp.init();
  slow.init();
  livespu.init();
  end.init();

  lanes[0] = 0;
  lanes[1] = 100;
  lanes[2] = 200;
  lanes[3] = 300;
  lanes[4] = 400;
  lanes[5] = 500;
 
   // Images must be in the "data" directory to load correctly
  img = loadImage("enemy.png");
  img2 = loadImage("collision.png"); 
  bg1 = loadImage("bg1.jpg");   
  bg2 = loadImage("bg2.jpg");   
  pow2 = loadImage("powt.png");  
  pow3 = loadImage("powh.png");  
  pow4 = loadImage("pow4.png");   
  plyr = loadImage("plyr.png"); 
  
  //inladen van soundfile uit de main map//
      //sound 1//
path = sketchPath(audioName1);
file = new SoundFile(this, path);
      
      //sound 2//
path2 = sketchPath(audioName2);
file2 = new SoundFile(this, path2);
//sound 2 start//
file2.play();

      //sound 3//
path3 = sketchPath(audioName3);
file3 = new SoundFile(this, path3);

      //sound 4//
path4 = sketchPath(audioName4);
file4 = new SoundFile(this, path4);

}

//Updating all classes
void updateGame() {
  player.update();
  enemies.update();
  exp.update();
  slow.update();
  lives.update();
  livespu.update();
  start.update();
  end.update();
  score.update();

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
    //music.stop();
  }
}

void keyReleased() {
  player.move(0);
}


void drawGame() {
  background(bg1);
  player.draw();
  obstacle1.draw();
  enemies.draw();
  exp.draw();
  slow.draw();
  lives.draw();
  livespu.draw();
  score.draw();
  textAlign(RIGHT);
  textSize(25);
  text("P = Pause", 790, 52);
  text("R = Resume", 790, 79);
  text("E = Exit", 790, 106);
  text("M = Sound OFF", 790, 131);
}

void draw() {

  if (stage ==1) {
    //haalt de setup en draw uit StartScreen
    start.setup();
    start.draw();
    //zorgt er voor dat elkaar als game start je na game over eerst naar endscreen gaat
  }
  if (stage ==2) {
    drawGame();
    updateGame();
    keyPressed();
    keyReleased();
  }
  if ( stage ==3) {
    //haalt de setup en draw uit EndScreen
    end.setup();
    end.draw();
    //vanuit de return van end.init() gaat hij naar juiste scherm, op dit moment nog alleen reset van game (werkt nog niet altijd even goed) 
    if (again == 1) {
      score.reset();
      setup();
      stage =1;
      again = 3;
    }
  }
}
