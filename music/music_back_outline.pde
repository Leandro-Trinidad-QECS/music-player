void musicBack() {
  noStroke();
  fill(81, 86, 95);
  rect(0.0, 0.0, 899.0, 51.0);
  rect(1.0, 438.0, 898.0, 61.0);

  //Music Icon
  rect(52.0, 78.0, 161.0, 161.0);
  //ellipse(52.0, 78.0, 161.0, 161.0);


  fill(66, 68, 72);
  rect(265.0, 52.0, 669.0, 385.0);
  textSize(35);
  fill(255);
  text("Spotyfi", 130, 20);
  progressbar();
  textSize(15);
  fill(255);

  if (meta[songSpot].title() != "") {
    text(meta[songSpot].title(), 52, 260, 161, 40);
  } else {
    text(meta[songSpot].fileName(), 52, 260, 161, 40);
  }
  ////prints the title
  //if (meta[songSpot].fileName() != "") {
  //  text(meta[songSpot].fileName(), 52, 260, 161, 40);
  //} else if (meta[songSpot].title() != "") {
  //  text(meta[songSpot].title(), 52, 260, 161, 40);
  //} else {
  //  text("Unknown", 52, 260, 161, 40);
  //}
}