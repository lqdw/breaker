void intro(){
  music.play();
  image(gif[f],0,0,width,height);
  f++;
  if(f==numberOfFrames) f=0;
  
  textSize(30);
  textFont(cyberpunk);//font of logo
  if (title<300){//move logo
    title=title+10;
  }  
  text("BREAKOUT",300,title);
  textSize(20);
  text("a breakout game",300,title+70);
  text("- click anywhere to start -",300,500);
  textSize(15);
  text("made by: Linda Wang, 1-4",170,700);
  text("fun fact: use 'A' and 'D' to move!",300,570);
  text("click anywhere during the game to pause",300,610);
}

void introClicks(){
  mode=GAME;
}
