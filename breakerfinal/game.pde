void game(){
  image(background,0,0,600,750);  
  music.play();
  //bricks
  int i=0;
  while(i<n){  
    if(alive[i]==true){
      manageBrick(i);
    }
    i++;
  }

  //paddle
  fill(68,138,198);
  stroke(68,138,198,150);
  circle(paddlex, paddley, paddled);
    
  //move paddles
  if(akey==true) paddlex=paddlex-5;
  if(dkey==true) paddlex=paddlex+5;
  
  //boundaries for moving paddles
  if(paddlex<50){
    paddlex=50; 
  }
  if(paddlex>550){
    paddlex=550;
  }
  
  //ball
  fill(254,206,6);
  stroke(254,183,63,150);
  circle(ballx, bally, balld); 
  
  //moving ball
  ballx=ballx+vx;
  bally=bally+vy;
  
  //bouncing ball
  pd=dist(paddlex, paddley, ballx, bally);
  pr=paddled/2; 
  R=balld/2;
  if (pd<=pr+R) {
    vx=(ballx-paddlex)/20;
    vy=(bally-paddley)/20;
  }
  if (bally<balld/2) {
    vy=vy*-1;
  }
  if (ballx<balld/2 || ballx>width-balld/2) {
    vx=vx*-1;
  }
  
  if(lives==3){
    if(bally>740){
      lives=2;
      lostlife.play();
      resetPosition();     
    }
  }
  if(lives==2){
    if(bally>740){
      lostlife.rewind();            
      lives=1;
      lostlife.play();
      resetPosition();           
    }
  }
  if(lives==1){
    if(bally>740){
      lostlife.rewind();                  
      lives=0;
      lostlife.play();
      resetPosition();     
    }
  }
  if (lives==0){
    mode=GAMEOVER;
  } 
  textSize(30);
  fill(255);
  text("LIVES: "+lives,90,700);
  text("SCORE: "+score,510,700);
}

void manageBrick(int i){
  stroke(255,150);
  strokeWeight(5);
  if(y[i]==90) fill(91,88,182);
  if(y[i]==180) fill(185,87,206);
  if(y[i]==270) fill(89,148,206);
  if(y[i]==360) fill(57,78,148);    
  circle(x[i],y[i],brickd);
  //bounce ball off of brick    
  if(dist(ballx,bally,x[i],y[i])<balld/2+brickd/2){
  vx=(ballx-x[i])/20;
  vy=(bally-y[i])/20;
  vx = vx * 3; //increases spead of the target 
  vy = vy * 3; 
  score++;
  point.rewind();
  point.play();
  alive[i]=false;
  }      
  
  if(score==20){
    music.rewind();
    mode=WIN;
  }
}

void gameClicks(){
  mode=PAUSE;
}
