//class zorgt ervoor dat je bij game over een endscreen hebt met mogelijke meer keuzes
//op dit moment alleen keuze voor terug naar startscreen.

//Update: Heb de tekst vervangen door afbeeldingen gemaakt via: https://textcraft.net/ Tekst kan terug gezet worden

class EndScreen {
  //declareren van een font
  PFont gameOver;
  PFont endText; 
  PFont scoreText;

  //declareren van afbeeldingen
  PImage exitImage;
  PImage againImage;
  PImage scoreBoardImage;  
PImage gameOverImage;

  void setup() {
    //laad de afbeelding in het mapje met met naam startScreen.jpg
    startScreen = loadImage("startScreen.jpg");
    //geeft de grote aan de eerste 2 nullen weet ik niet precies wat is ik denk draai, de achterste 2 zijn de verhoudingen
    image(startScreen, 0, 0, 800, 600);
    //koppelt de juiste font aan de juiste PFont (via tools>lettertype maken, kan je een .vlw bestand maken met een font en grote)
    gameOver = loadFont("gameOverFont.vlw");
    endText = loadFont("endTextFont.vlw");
    scoreText = loadFont("scoreTextFont.vlw");
    exitImage = loadImage("exit.png");
    againImage = loadImage("try-again.png");
    scoreBoardImage = loadImage("scoreboard.png");
    gameOverImage = loadImage("game-over.png");
  }

  void init() {
    //return vallue zodat er in Game_prototype gereset kan worden, of later naar andere schermen)
    if (again == 1) {
      again = 1;
    } else if (again == 2) {
      again = 2;
    }
  }


  void draw() {
    //gameover    
    image(gameOverImage, 214, 150, 371,58);
    /*textAlign(CENTER);
    fill(255, 3, 3);
    textFont(gameOver);
    text("Game Over", 400, 225);
    */
    //Score
    textFont(scoreText);
    text(round(punten), 400, 300);
    //opties
    image(againImage, 80, 425, 217, 102); //opnieuw
    image(exitImage, 430, 415, 243, 108); //exit
    image(scoreBoardImage, 193, 350, 415, 51);  //Scoreboard/highscore
    
    /*textFont(endText);
    //text("TRY AGAIN PRESS LEFT", 200, 450);
    //text("EXIT PRESS RIGHT", 600, 450);
    //text("SCOREBOARD PRESS S", 400, 400);
    */
   
    if (keyCode == LEFT) {     //keycode left zorgt ervoor dat je terug gaat naar stage 1 (startscherm
      again = 1; //gaat terug naar startscherm
    } else if (keyCode == RIGHT) {//keycode left zorgt voor exit
      exit(); //
    } else if (keyCode == 'S') { //keycode S zorgt ervoor dat naar stage 4 (scoreboard) gaat
      again = 2;
    }
    //stopt intro sound//
    file.stop();
  }

  void update() {
  }
}