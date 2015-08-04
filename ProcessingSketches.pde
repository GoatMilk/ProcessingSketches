void setup()
{
  size(1920, 1080, P3D);
  background(255, 8, 234);
  text("Cameron", 1800, 1000);
}

void draw()
{
   if(mousePressed)
   {
     fill(0, random(255), random(255));
     noStroke();
     lights();
     translate(mouseX, mouseY, -30);
     sphere(55);
   }
   else
   {
      fill(255, 0, 0);   
   }
   
}
