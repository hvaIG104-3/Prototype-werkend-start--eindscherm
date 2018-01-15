class ScoreBoard {
  String[] highScore = new String[5];
  String scoreList;
  //declareren van een Font
  PFont highScoreText;
  
  PImage topscore;

  void setup() {
    //zorgt voor achtergrond
    //laad de afbeelding in het mapje met met naam startScreen.jpg
    startScreen = loadImage("Images/startScreen.jpg");
    //geeft de grote aan de eerste 2 nullen weet ik niet precies wat is ik denk draai, de achterste 2 zijn de verhoudingen
    image(startScreen, 0, 0, 800, 600);
    highScoreText = loadFont("Fonts/highScoreText.vlw");
    highScore = loadStrings("Data/Text/scoreBoard.txt");
    topscore = loadImage("Images/highscore.png");
  }

  void draw() {
    //zorgt ervoor dat de highscore word weergeven
    setup();
   image(topscore, 220, 75, 347, 67);
    for (int i = 0; i < highScore.length; i++) {
      textAlign(CENTER);
      textSize(60);
      text(round(parseFloat(highScore[i])), width/2, 230 + 75*i);
    }
  }

  void highScore() {
    setup();
    //berekend de highscore en update het
    if (highScore.length<5)
    {
      highScore=append(highScore, str(punten)); //append vergroot een array en voegt nieuwe data toe//
    } else {//dit gedeelte zorgt ervoor dat de highscore word geupdate word
      if (parseInt(highScore[highScore.length-1])<punten) 
      {
        highScore[highScore.length-1]=str(punten);
        for (int i=highScore.length-1; i>0; i--)
        {
          if (parseInt(highScore[i])>parseInt(highScore[i-1]))
          {
            String setScoreLower=highScore[i-1];
            highScore[i-1]=highScore[i];
            highScore[i]=setScoreLower;
          }
        }
      }
      scoreList="";
      for (int i = 0; i < highScore.length; i++)
      {
        scoreList+=highScore[i]+" ";
      }
      saveStrings("Data/Text/scoreBoard.txt", highScore);
    }
  }
}