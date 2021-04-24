void reset(){
  ballx=width/2;
  bally=height/2;
  vx=random(-5,5);
  vy=random(-5,5);
  
  //game initialization
  score=0;
  lives=3;
}

void resetPosition(){
  ballx=width/2;
  bally=height/2;
  vx=random(-5,5);
  vy=random(-5,5);
}
