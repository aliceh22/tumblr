
PImage img;
String imgFileName = "wall";
String fileType = "jpg";
String newName = "_glitched2.png";

color randomColor = color(random(255), random(255), random(255), 255);

boolean glitchFinished = false;
boolean fileSaved = false;

int seed = 15;
int maxHeight;
int[] startPointsX;
int[] startPointsY;
int[] lengthX;
int[] lengthY;
int[] displacement;


void setup(){
  
   // load image and put onto resizable surface
   img = loadImage(imgFileName+"."+fileType);
  
   surface.setResizable(true);
   surface.setSize(img.width, img.height);
   
   image(img, 0, 0, img.width, img.height);
   
   maxHeight = floor(img.height/6);
   
   startPointsX = new int[seed];
   startPointsY = new int[seed];
   lengthX = new int[seed];
   lengthY = new int[seed];
   displacement = new int[seed];
   
   for(int i=0; i<seed; i++){
     
     //starting points in x and y directions for glitch sections
      startPointsX[i] = int(random(0,(img.width-10)));
      startPointsY[i] = int(random(0,(img.height-10))); 
      
     //size of glitch sections 
      lengthX[i] = int(random(10,img.width));
      lengthY[i] = int(random(10,maxHeight));
      
      displacement[i] = int(random(30, img.width/2));
   }
  
}



void draw(){
 if(!glitchFinished){
   
   img.loadPixels();
   
   //move stuff for each seed point
   for(int count=0; count<seed; count++)
   {
     for(int x = 0; x<lengthX[count]; x++)
     {
       int xx = startPointsX[count] + x;
         for(int y = 0; y<lengthY[count]; y++)
         {
           int special = int(random(-10,10));
           if((xx + (startPointsY[count]+y)*img.width + displacement[count]) < img.height*img.width-special){
              img.pixels[xx + special + (startPointsY[count]+y)*img.width] = img.pixels[xx + special + (startPointsY[count]+y)*img.width + displacement[count]];
           }
         }
     }
   }
   
   //update all pixels
   img.updatePixels();
   glitchFinished = true;
   println("Click or press any key to save and exit...");
 }


 
  
}


void keyPressed(){
  img.save(imgFileName+newName);
    fileSaved = true;
    println("Glitched image saved");
    
    System.exit(0);
}