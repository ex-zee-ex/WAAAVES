import controlP5.*;

import themidibus.*; //Import the library
MidiBus myBus;

ControlP5 cp5;
Slider abc;
boolean sw1,sw2,sw3,sw4;
int sliderheight,sliderwidth,margin,pos;
//float sliderValue;
float spc, theta2,amp,period,dx,yv,wavew;
float aa,ss, dd, ff, gg, jj, hh,kk,db,ds,dh;
float qq, ww, ee, rr, tt, yy, uu, ii,oo;
int[][] bpix0;
int[][] bpix1;
int[][] spix0;
int[][] spix1;
int[][] hpix0;
int[][] hpix1;
int cs=3;
int w,h,siz;
int wid,hei;
//int sw2,sw3,sw4,sw5,sw6,sw7,sw8;
float theta;
int ar;
void setup(){

size(1000,1000,P3D);

margin=200;
amp=hei/4;
ar=50;
sliderheight=ar/2;
sliderwidth=margin*3/4;
pos=width-margin;

wid=width-margin;
hei=height-margin;
spc=cs;
wavew=wid+cs;
period=wid/2.0;
dx=(TWO_PI/period)*spc;


colorMode(HSB,100);
w=wid/cs;
h=hei/cs;
siz=(wid*hei)/(cs*cs);
bpix0=new int[w][h];
bpix1=new int[w][h];
spix0=new int[w][h];
spix1=new int[w][h];
hpix0=new int[w][h];
hpix1=new int[w][h];


 MidiBus.list();
 myBus = new MidiBus(this, 0, -1);
 
 
 
 jj=hh=.2;
 gg=.7;
 qq=.1;
 kk=.1;
 //sw2=sw3=sw4=sw5=sw6=sw7=sw8=1;
 
 
 cp5 = new ControlP5(this);
 
 
 //sinewaveheight
  cp5.addSlider("qq")
     .setPosition(pos,ar)
     .setHeight(sliderheight)
     .setWidth(sliderwidth)
     .setRange(-1,1)
     ;
     
     //sinewavespeed
  cp5.addSlider("ww")
     .setPosition(pos,2*ar)
     .setHeight(sliderheight)
     .setWidth(sliderwidth)
     .setRange(-1,1)
     ;
     
      //sinewavefm
  cp5.addSlider("ee")
     .setPosition(pos,3*ar)
     .setHeight(sliderheight)
     .setWidth(sliderwidth)
     .setRange(-1,1)
     ;
     
     //brightnessceilinglimit
  cp5.addSlider("ff")
     .setPosition(pos,4*ar)
     .setHeight(sliderheight)
     .setWidth(sliderwidth)
     .setRange(0,1)
     ;
     //brightnessfloorlimit
  cp5.addSlider("dd")
     .setPosition(pos,5*ar)
     .setHeight(sliderheight)
     .setWidth(sliderwidth)
     .setRange(0,1)
     ;
     
     //brightnesscontrol
  cp5.addSlider("jj")
     .setPosition(pos,6*ar)
     .setHeight(sliderheight)
     .setWidth(sliderwidth)
     .setRange(-1,1)
     ;
     
     //brightnesscontrol
  cp5.addSlider("hh")
     .setPosition(pos,7*ar)
     .setHeight(sliderheight)
     .setWidth(sliderwidth)
     .setRange(0,1)
     ;
     
     //brightnesscontrol
  cp5.addSlider("gg")
     .setPosition(pos,8*ar)
     .setHeight(sliderheight)
     .setWidth(sliderwidth)
     .setRange(-1,1)
     ;
  
   cp5.addToggle("sw1")
     .setPosition(pos,9*ar)
     .setSize(sliderheight,sliderheight)
     ;
     
      cp5.addToggle("sw2")
     .setPosition(pos+sliderheight,9*ar)
     .setSize(sliderheight,sliderheight)
     ;
     
     
       cp5.addToggle("sw3")
     .setPosition(pos+2*sliderheight,9*ar)
     .setSize(sliderheight,sliderheight)
     ;
       cp5.addToggle("sw4")
     .setPosition(pos+3*sliderheight,9*ar)
     .setSize(sliderheight,sliderheight)
     ;
   
         
         
}//endsetup

void draw(){
  theta2 +=.005*(1+50*ww);
  //background(100);
  //int fill3;
//i is x
//translate(width/2,height/2);
float xx=theta2;

for(int i=2;i<w-2;i++){
  
  //here is the bit that generates the waaaves
  amp=cs*(1+hei/8*qq)*(1+.5*ee*cos(theta*(1+i*cos(theta/8+theta2/16*i/w)/w)));

  yv=(sin(xx)+1)*amp;
 // println(yv);
  xx+=dx;
  fill(0);
 //ellipse(i*spc,height/2+yv,spc,spc);
 
 
 
  //j is y
  for(int j=2;j<h-2;j++){
    
    
    //where is everyone
    int lb=bpix0[i][j];
    
    
    int l_ub=bpix0[i][j+1];
    int l_rb=bpix0[i+1][j];
    int l_db=bpix0[i][j-1];
    int l_lb=bpix0[i-1][j];
    int l_u_rb=bpix0[i+1][j+1];
    int l_d_rb=bpix0[i+1][j-1];
    int l_u_lb=bpix0[i-1][j+1];
    int l_d_lb=bpix0[i-1][j-1];
    
    //more distant neighbors
     int lb1=bpix0[i][j+2];
     int lb2=bpix0[i+1][j+2];
     int lb3=bpix0[i+2][j+2];
     int lb4=bpix0[i+2][j+1];
     int lb5=bpix0[i+2][j];
     int lb6=bpix0[i+2][j-1];
     int lb7=bpix0[i+2][j-2];
     int lb8=bpix0[i+1][j-2];
    
    int ls=spix0[i][j];
    
    
    int l_us=spix0[i][j+1];
    int l_rs=spix0[i+1][j];
    int l_ds=spix0[i][j-1];
    int l_ls=spix0[i-1][j];
    int l_u_rs=spix0[i+1][j+1];
    int l_d_rs=spix0[i+1][j-1];
    int l_u_ls=spix0[i-1][j+1];
    int l_d_ls=spix0[i-1][j-1];
    
     
     int lh=hpix0[i][j];
    
    
    int l_uh=hpix0[i][j+1];
    int l_rh=hpix0[i+1][j];
    int l_dh=hpix0[i][j-1];
    int l_lh=hpix0[i-1][j];
    int l_u_rh=hpix0[i+1][j+1];
    int l_d_rh=hpix0[i+1][j-1];
    int l_u_lh=hpix0[i-1][j+1];
    int l_d_lh=hpix0[i-1][j-1];
    
    
    
    int x=(i)*cs;
    int y=(j)*cs;
    
    db=jj*.05;
    
    if(sw2==false){
     db=(1+2*jj)/2;
    }
    
        ds=hh*.01;
        dh=gg*.01;
         if(sw3==false){dh=(1+2*gg)/2;}
            
    int fillb=0;   
    int fillh=0;
            if(sw2==true){
     fillb=int(lb+db*(l_ub+l_u_rb+l_rb+l_d_rb)+db*.125*(lb1+lb2+lb3+lb4+lb5+lb6+lb7+lb8));
            }
    
    if(sw2==false){
     fillb=int(lb+db*(l_ub+l_u_rb+l_rb+l_d_rb)/4)/2;
   
        }
    
    
    if(sw3==true){
    fillh=int(lh+dh*(l_uh+l_u_rh+l_rh+l_d_rh))%100;
    }
    if(sw3==false){fillh=int(lh+dh*(l_uh+l_u_rh+l_rh+l_d_rh)/4)/2;}
    int fills=int(ls+ds*(l_us+l_u_rs+l_rs+l_d_rs));
    if(fillb>100*(1-ff)){
      
      if(sw1==false){
      fillb=fillb%100;
    //  println("hey");
      }
      
 //   fillb=fillb%100;
   // if(ff==0){
     
      if(sw1==true){
    fillb=int(100);
      }
  //  }x
   // fillb=(100-fillb%100);
 }

 
 if(fillb<(-1000*dd)){
    fillb=0;
   // fillb=(100-fillb%100);
   
 }
 
 
 
 if(fillh>100){
 
   if(sw4==false){
 fillh=fillh%100;
   }
 }
 
 
 
    if(fills>100){fills=(100-fills%100);}
    if(fillh<0){
    
    fillh=abs(fillh);
  
}
   // if(fillh%2==0){fillh=(100-fillh);}
  //  println(fillb+"  "+fillh+"  "+fills);
    if(((y-height/2+amp)<=yv+cs)&&((y-height/2+amp)>=yv-cs)){

    fillb=50;
    fillh=50;
    fills=50;
   
    }
    
    

    

    
     noStroke();
    fill(fillh,fills,fillb);
    pushMatrix();
    translate(x,y);

    rect(0,0,cs,cs);

    popMatrix();
   
   
    
     bpix1[i][j]=int(fillb*(1+.1*kk*random(-1,1)));
     spix1[i][j]=int(fills*(1+.1*kk*random(-1,1)));
     hpix1[i][j]=int(fillh*(1+.1*kk*random(-1,1)));

    
    
    
  
  }//endjfor
}//endifor
//noLoop();

for(int i=0;i<w;i++){
  for(int j=0;j<h;j++){
bpix0[i][j]=bpix1[i][j];
spix0[i][j]=spix1[i][j];
hpix0[i][j]=hpix1[i][j];
//println(bpix0[i][j]);
  }//endjfor
}//endifor


 if(keyPressed){
  
   
   
   
   
   
   if(key=='k'){kk+=.01;}
   if(key==','){kk-=.01;}
   if(key=='l'){ee+=.01;}
   if(key=='.'){ee-=.01;}
   
 if(key==']'){
  for(int i=0;i<w;i++){
   for(int j=0;j<h;j++){
    bpix0[i][j]=0;
     spix0[i][j]=0;
      hpix0[i][j]=0;
   }//endjfor
  }//endifor
 }//end]
 
 }//endifkeypressed
 
 theta+=.01;
}//enddraw

void controllerChange(int channel, int number, int value) {
  
  //AAALSO note on and note off can be used as switches!! 
  
  // Receive a controllerChange
  
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  
  
  //nanocontroller controlls
  
  if(number==20){
  qq=(value-63)/63.0;
 // println("x="+x);
  }
   if(number==21){
  ww=(value-63)/63.0;

 // println("x="+x);
  }
  if(number==22){
  ff=(value)/127.0;

 // println("x="+x);

  }
    if(number==23){
  dd=(value)/127.0;

 // println("x="+x);
  }
  
    
  
  if(number==25){
  gg=(value)/127.0;

 // println("x="+x);
  }
  if(number==26){
  hh=(value)/127.0;

 // println("x="+x);
  }
  if(number==27){
  jj=(value-63)/63.0;

 // println("x="+x);
  }
  
  
  

  
  
  
  
  
  //not at the moment usefull controls
 if(number==71){
  ee=(value)/127.0;

 // println("x="+x);
  }
   if(number==72){
  rr=(value)/127.0;

 // println("x="+x);
  }
   if(number==25){
  tt=(value)/127.0;

 // println("x="+x);
  }
   if(number==73){
  yy=(value)/127.0;
 // println("x="+x);
  }
   if(number==74){
  uu=(value)/127.0;

 // println("x="+x);
  }
   if(number==70){
  ii=(value)/127.0;

 // println("x="+x);
  }
   if(number==63){
  oo=(value)/127.0;

 // println("x="+x);
  }
  
  
  
  
  
  if(number==22){
  aa=(value)/127.0;

 // println("x="+x);
  }
  if(number==23){
  ss=(value)/127.0;

 // println("x="+x);
  }
  if(number==95){
  kk=(value-63)/63.0;

 // println("x="+x);
  }
  
  
  //old maudio controlls
  /*
  
  if(number==20){
  qq=(value-63)/63.0;
 // println("x="+x);
  }
   if(number==21){
  ww=(value-63)/63.0;

 // println("x="+x);
  }
 if(number==71){
  ee=(value)/127.0;

 // println("x="+x);
  }
   if(number==72){
  rr=(value)/127.0;

 // println("x="+x);
  }
   if(number==25){
  tt=(value)/127.0;

 // println("x="+x);
  }
   if(number==73){
  yy=(value)/127.0;
 // println("x="+x);
  }
   if(number==74){
  uu=(value)/127.0;

 // println("x="+x);
  }
   if(number==70){
  ii=(value)/127.0;

 // println("x="+x);
  }
   if(number==63){
  oo=(value)/127.0;

 // println("x="+x);
  }
  
  
  
  
  
  if(number==22){
  aa=(value)/127.0;

 // println("x="+x);
  }
  if(number==23){
  ss=(value)/127.0;

 // println("x="+x);
  }
  if(number==61){
  dd=(value)/127.0;

 // println("x="+x);
  }
  if(number==24){
  ff=(value)/127.0;

 // println("x="+x);
  }
  if(number==26){
  gg=(value)/127.0;

 // println("x="+x);
  }
  if(number==27){
  hh=(value)/127.0;

 // println("x="+x);
  }
  if(number==62){
  jj=(value-63)/63.0;

 // println("x="+x);
  }
  if(number==95){
  kk=(value-63)/63.0;

 // println("x="+x);
  }
  
  */
}//endcontrollerchange
