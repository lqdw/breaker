import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int mode;

final int INTRO=0;
final int GAME=1;
final int PAUSE=2;
final int GAMEOVER=3;
final int WIN=4;

PImage background;
PImage background2;
PImage win;
PImage[] gif;
int numberOfFrames;

PFont cyberpunk;

//paddle entity variables
float paddlex, paddley, paddled;

//ball entity variables
float ballx, bally, balld;

//ball velocity
float vx,vy;

//bouncing variables
float pd,pr,R;

//keyboard variables
boolean akey,dkey;

int score, lives;

int tempx, tempy;

int title;//move title

int[] x;//array of x coords
int[] y;//array of y coords
boolean[] alive; 
int n;//# of elements in array
int brickd;//diameter of all bricks

int f;

Minim minim;//sounds
AudioPlayer music, lostlife, won, gameover,point;  

void setup(){
  size(600,750);
  
  mode=INTRO;
  
  textAlign(CENTER,CENTER);  
  
  //initialize paddle
  paddlex=width/2;
  paddley=750;
  paddled=200;
  
  //initialize ball
  ballx=width/2;
  bally=height-300;
  balld=20;
  vx=random(-5,5);
  vy=random(-5,5);  
  
  //initialize keyboard
  akey=dkey=false;
  
  //initialize score
  score=0;
  
  lives=3;
  
  //brick array setup
  brickd=40;
  n=20;
  x=new int[n];//tells the arrays how many pages they should have 
  y=new int[n];  
  alive=new boolean[n];
  tempx=100;
  tempy=90;
  int i=0;  
  while(i<n){
    x[i]=tempx;
    y[i]=tempy;
    alive[i]=true;
    tempx=tempx+100;
    if(tempx==width){
      tempx=100;
      tempy=tempy+90;
    }
    i=i+1;
  }
  
  background=loadImage("background.jpg");
  background2=loadImage("background2.jpg");
  win=loadImage("win.jpg");
  
  cyberpunk=createFont("cyberpunk.ttf",100);
  
  title=-110;
  
  //minim
  minim=new Minim(this);
  music=minim.loadFile("music.mp3");
  lostlife=minim.loadFile("lostlife.wav");
  gameover=minim.loadFile("gameover.wav");  
  point=minim.loadFile("point.wav");  
  
  //gif
   numberOfFrames=16;
   gif=new PImage[numberOfFrames];
   int j=0;
   while(j<numberOfFrames){
     gif[j]=loadImage("frame_0"+j+"_delay-0.1s.gif");
     j++;
   }
 
}

void draw(){
  if(mode==INTRO){
    intro();
  }else if(mode==GAME){
    game();
  }else if(mode==PAUSE){
    pause();
  }else if(mode==GAMEOVER){
    gameover();
  }else if(mode==WIN){
    win();    
  }else{
  println("Error: Mode="+mode);
  }
}
