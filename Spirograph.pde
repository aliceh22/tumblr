

float R=200, r=160, rp=53; //SPIROGRAPH VARIABLES
//R is the radius of outer circle
//r is radius of inner circle (should be smaller than R)
//rp is the distance from the center of the smaller circle 
//that the drawing point is placed.


float fps=300;  // frames per second - speed of animation
float Cx, Cy, Mx, My, Px, Py, prevPx, prevPy, Mx1, My1, Mx2, My2;
float rm, ratio;
float angle1, angle2;
float ang1, ang2;
float ctr1x, ctr1y, ctr2x, ctr2y;
float count = 1, a, remainder, frames, angCount = PI/70;
color back = #E8C35E;     //background colour
color spiro =  #2B6771;   //spirograph colour
boolean print = false;    //Change to true to save spirograph as png
String name = "spiro19.png";

//#E8C35E  #2B6771 #bd6060
//  #397A99 #E44E66 #F1D452  #076D9E



void setup() {
  size(400, 400, P3D); //window size -> increase for R>200
  ratio=R/r;
  rm= R-r;
  angle1 = 0;
  Cx = width/2;
  Cy = height/2;
  
  Mx = Cx+rm*cos(ang1);
  My = Cy+rm*sin(ang1);
  Px = Mx + rp*cos(ang2);
  Py = My + rp*sin(ang2);
  
  prevPx=Px;
  prevPy=Py;
  ctr1x=Px;
  ctr1y=Py;
  ctr2x=Px;
  ctr2y=Py;
  
  
  ang1 = radians(angle1);
  ang2 = radians(angle2);
  
  remainder = ratio - floor(ratio);
  if(remainder == 0){
    a = 1;
  }else{
    a = ceil(1/remainder);
  }
  frames = 4*PI*a /angCount;
  background(back);
  frameRate(fps);
  print(frames);
}


void draw() {
  
  ang2 = -ratio*ang1;
  
  Mx = Cx + rm*cos(ang1);
  My = Cy + rm*sin(ang1);
  prevPx = Mx + rp*cos(ang2);
  prevPy = My + rp*sin(ang2);
  
  Mx1 = Cx+rm*cos(ang1 + angCount);
  My1 = Cy+rm*sin(ang1 + angCount);
  Px = Mx1 + rp*cos(ang2 - ratio*angCount);
  Py = My1 + rp*sin(ang2 - ratio*angCount);

  Mx2 = Cx+rm*cos(ang1 + 2*angCount);
  My2 = Cy+rm*sin(ang1 + 2*angCount);
  ctr2x = Mx2 + rp*cos(ang2 - 2*ratio*angCount);
  ctr2y = My2 + rp*sin(ang2 - 2*ratio*angCount);
  
  
  
 
  
  stroke(spiro);
  strokeWeight(3);
  curve(ctr1x, ctr1y, prevPx, prevPy, Px, Py, ctr2x, ctr2y);
  
  ang1 = ang1+angCount;
  
  ctr1x = prevPx;
  ctr1y = prevPy;
  
  
  if(count>=frames){
    noLoop();
    if(print){
      saveFrame(name);
    }
    return;
  }
  count++;
  
}
