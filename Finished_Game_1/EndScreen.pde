//class zorgt ervoor dat je bij game over een endscreen hebt met mogelijke meer keuzes
//Update: Heb de tekst vervangen door afbeeldingen gemaakt via: https://textcraft.net/ Tekst kan terug gezet worden

//op dit moment alleen keuze voor terug naar startscreen.

//Update:

class EndScreen {
  //declareren van een font
  PFont gameOver;
  PFont endText; 
  PFont scoreText;
  PFont score;

  //declareren van afbeeldingen
  PImage exitImage;
  PImage againImage;
  PImage scoreBoardImage;  
  PImage gameOverImage;

  void setup() {
    //geeft de grote aan de eerste 2 nullen weet ik niet precies wat is ik denk draai, de achterste 2 zijn de verhoudingen
    image(startScreen, 0, 0, 800, 600);

    //koppelt de juiste font aan de juiste PFont (via tools>lettertype maken, kan je een .vlw bestand maken met een font en grote)
    score = loadFont("Fonts/score.vlw");
    scoreText = loadFont("Fonts/scoreTextFont.vlw");
    exitImage = loadImage("Images/exit.png");
    againImage = loadImage("Images/try-again.png");
    scoreBoardImage = loadImage("Images/scoreboard.png");
    gameOverImage = loadImage("Images/game-over.png");
  }

  void draw() {
    //gameover    
    image(gameOverImage, 214, 150, 371, 58);
    //Score
    fill(#FFB51F);
    textFont(score);
    text(round(punten), 400, 300);
    //opties
    image(againImage, 80, 425, 217, 102); //opnieuw
    image(exitImage, 430, 425, 243, 108); //exit
    image(scoreBoardImage, 193, 350, 415, 51);  //Scoreboard/highscore
    music.stop();
  }
}