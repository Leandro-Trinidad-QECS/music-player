//Music Player
// By Leandro Trinidad

//imports java
import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

DateFormat formatter = new SimpleDateFormat("mm:ss");
//String[] songName= {"BTS_DNA", "Soulja Boy - Soulja Boy Tell'em - Crank That", "Camila Cabello - Havana (Audio) ft. Young Thug", "ed-sheeran-perfect"};
String ext = ".mp3";
//imports minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

String[] filenames;
//vars
int toggleplay;
boolean drag;
float playhead;
int rew2;

Minim minim;
AudioPlayer[] player;

PImage[] img;


Button exit;
switchButtons play;
Button pause;
Button skip;
Button rewind;
AudioMetaData[] meta ;
int songSpot = 0;

void setup() {
  java.io.File folder = new java.io.File(dataPath("/sound"));
  filenames = folder.list();
  player = new AudioPlayer[filenames.length];
  meta = new AudioMetaData[filenames.length];
  size(900, 500);
  //frame.setResizable(true);
  minim = new Minim(this);
  for (int i=0; i < filenames.length; i++) {
    player[i] = minim.loadFile("sound/" + filenames[i]);
  }
  for (int i=0; i < filenames.length; i++) {
    meta[i] = player[i].getMetaData();
  }


  img = new PImage[10];

  imageMode(CENTER);
  textAlign(CENTER, CENTER);

  for (int i=0; i < img.length; i++) {
    img[i] = loadImage("images/" + i + ".png");
    img[i].resize(30, 30);
  }

  exit = new Button(img[1], width-40, 25, 30, 30, img[2]);
  play = new switchButtons(img[0], img[4], 132, height-34, 30, 30, img[3], img[5]);
  skip = new Button(img[6], 132+40, height-34, 30, 30, img[7]);
  rewind = new Button(img[9], 132-40, height-34, 30, 30, img[8]);
}
void draw() {
  background(51);
  fill(51);
  //draws the backdrop and the exit button
  musicBack();
  exit.Draw();

  //if exit button is clicked it exits
  if (exit.MouseIsOver()) {
    exit();
  }

  //play button
  play.Draw();

  //if play/paused is preesed plays and pauses
  if (play.button) {
    player[songSpot].play();
  } else {
    player[songSpot].pause();
  }

  //draws the skip button and rewind
  skip.Draw();
  rewind.Draw();
}