//import gifAnimation.*;

//GifMaker gifExport;

int quantity = 500;
float [] xPosition = new float[quantity];
float [] yPosition = new float[quantity];
int [] flakeSize = new int[quantity];
int [] direction = new int[quantity];
int minFlakeSize = 1;
int maxFlakeSize = 5;

PShape img;

void setup() {
  size(1366, 768);
  frameRate(12);
  noStroke();
  smooth();
  
  for(int i = 0; i < quantity; i++) {
    flakeSize[i] = round(random(minFlakeSize, maxFlakeSize));
    xPosition[i] = random(0, width);
    yPosition[i] = random(0, height);
    direction[i] = round(random(0, 1));
  }
  
  img = loadShape("fiber.svg");
  
//  frameRate(12);
//  gifExport = new GifMaker(this, "fiber.gif");
//  gifExport.setRepeat(0);
}

void draw() {
  background(3,169,244);
  
  for(int i = 0; i < xPosition.length; i++) {
    ellipse(xPosition[i], yPosition[i], flakeSize[i], flakeSize[i]);
    
    if(direction[i] == 0) {
      xPosition[i] += map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    } else {
      xPosition[i] -= map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    }
    
    yPosition[i] += flakeSize[i] + direction[i]; 
    if(xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i] || yPosition[i] > height + flakeSize[i]) {
      xPosition[i] = random(0, width);
      yPosition[i] = -flakeSize[i];
    }
  }
  
  shape(img, 260, 290, 850, 175.9083);
  
//  gifExport.setDelay(1);
//  gifExport.addFrame();
//  if (frameCount == 120) {
//    gifExport.finish();
//  }
}
