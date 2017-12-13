void progressbar() {

  //playhead = player[songSpot].position();
  playhead = map(player[songSpot].position(), 0, player[songSpot].length(), 0, 530); //previouse 100


  //sets the time
  Calendar posTime = Calendar.getInstance();
  posTime.setTimeInMillis(player[songSpot].position());

  Calendar lenTime = Calendar.getInstance();
  lenTime.setTimeInMillis(player[songSpot].length());

  fill(#757578);
  rect(300, height-36, 530, 10, 50);
  fill(255);
  rect(300, height-36, playhead, 10, 50);
  textSize(15);

  //shows what time it is and ends
  text(formatter.format(lenTime.getTime()), 300+530+30, height-36);
  text(formatter.format(posTime.getTime()), 300-30, height-36);


  //when hovering the progress bar
  if (mouseX > 300 && mouseX < 300+530 && mouseY > height-36 && mouseY < height-15) {
    int position_check = int( map( mouseX, 300, 300+530, 0, player[songSpot].length() ) );
    fill(130, 167, 216);
    ellipse(300+playhead, height-36+5, 12, 12  );

    //time
    Calendar relTime = Calendar.getInstance();
    relTime.setTimeInMillis(position_check);

    textSize(15);
    text(formatter.format(relTime.getTime()), mouseX, height-36-20);
    //text(formatter.format(posTime.getTime()), 300+playhead, height-36-20);
    if (player[songSpot].position() > player[songSpot].length()-1000) {
      player[songSpot].pause();
      songSpot ++;
      player[songSpot].cue(0);

      //TODO: fix skip with problem
    }
  }
}