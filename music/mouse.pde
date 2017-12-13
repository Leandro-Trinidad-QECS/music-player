void mousePressed() {
  if (overCircle(int(play.x), int(play.y), int(play.w))) {
    play.button = !play.button;
  }
  if (overCircle(int(300+playhead), height-36+5, 10)) {
    drag = true;
  }
  if (mouseX > 300 && mouseX < 300+530 && mouseY > height-36 && mouseY < height-15) {
    int position = int( map( mouseX, 300, 300+530, 0, player[songSpot].length() ) );
    //println(position);
    player[songSpot].cue( position );
  }
  if (rewind.mouseHover() && (mouseEvent.getClickCount()==2)) {
    //player[songSpot].cue(player[songSpot].length
    player[songSpot].pause();
    songSpot--;
    if (songSpot < 0) {
      songSpot = filenames.length - 1;
    }
    player[songSpot].cue(0);


    if (play.button) {
      player[songSpot].play();
    } else {
      player[songSpot].pause();
    }
  } else if (rewind.mouseHover() && (mouseEvent.getClickCount()==1)) {
    player[songSpot].rewind();
  }
  if (skip.mouseHover()) {
    //player[songSpot].cue(player[songSpot].length());
    player[songSpot].pause();
    songSpot++;
    if (songSpot > filenames.length - 1) {
      songSpot = 0;
    }
    player[songSpot].cue(0);
    if (play.button) {
      player[songSpot].play();
    } else {
      player[songSpot].pause();
    }
  }
}
void mouseDragged() { 
  if (drag) {
    int position = int( map( mouseX, 300, 300+530, 0, player[songSpot].length() ) );
    //println(player[songSpot].position() + "   "+ position);
    player[songSpot].cue( position );
  }
}
void mouseReleased() {
  if (drag) {
    drag = false;
  }
}