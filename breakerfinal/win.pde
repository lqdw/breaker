void win(){
  music.play();
  
  image(win,0,0,600,750); 
  textSize(10);
  textFont(cyberpunk);//font of logo  
  text("YOU WON!",300,300);
  textSize(20);
  text("click anywhere to play again",300,400);
  
  tactileExit(260,460,80,40);
  fill(241,121,0);
  strokeWeight(5);
  rect(260,460,80,40);
  fill(255);
  textSize(20);
  text("EXIT",300,477);
  
}

void tactileExit(int x, int y, int w, int l){//if mouse is on exit
  if (mouseX>260 && mouseX<340 && mouseY>460 && mouseY<500){    
    stroke(144,35,0);
  }else{//if mouse is not on exit
    stroke(211,65,7);
  }
}

void winClicks(){
  if (mouseX>260 && mouseX<340 && mouseY>460 && mouseY<500){  
    exit();
  }else{
    mode=INTRO;
    reset();
  }
}
