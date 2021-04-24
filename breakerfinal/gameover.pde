void gameover(){
  image(background,0,0,600,750);  
  gameover.play();
  music.pause();
  
  textFont(cyberpunk);//font of logo
  fill(0);
  text("YOU LOST",310,320);   
  fill(255);
  text("YOU LOST",300,300);
  fill(0);
  textSize(20);
  text("click anywhere to play again",305,405);  
  fill(255);
  text("click anywhere to play again",300,400); 

  
  
  tactileExit(260,460,80,40);
  fill(241,121,0);//exit button
  strokeWeight(5);
  rect(260,460,80,40);
  fill(255);
  textSize(20);
  text("EXIT",300,477);  
}

void gameoverClicks(){
  if (mouseX>260 && mouseX<340 && mouseY>460 && mouseY<500){  
    exit();
  }else{
    mode=INTRO;
    reset();
  }
}
