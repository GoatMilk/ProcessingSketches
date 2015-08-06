import ddf.minim.*;
Minim minim;
AudioSample sound;
PImage backgroundImage;
int xpos = 200;
int ypos = 200;
int speedx = 5;
int speedy = 5;
int paddleY = 550;
int paddleLength = 125;

void setup()
{
   size(800, 600); 
   backgroundImage = loadImage("imgres.jpg");
   minim = new Minim(this);
   sound = minim.loadSample("pong.wav", 128);
}

void draw()
{
   image(backgroundImage, 0, 0, 800, 600);
   xpos = xpos + speedx;
   ypos = ypos + speedy;
   fill(255, 255, 255);
   ellipse(xpos, ypos, 18, 18);
   rect(mouseX, paddleY, paddleLength, 10);
   stroke(64, 64, 64, 75);
   
   if(xpos == 800)
   {
      speedx = -5;
   }
   else if(xpos == 0)
   {
      speedx = 5; 
   }
   
   if(ypos == 600)
   {
      speedy = -5;
      sound.trigger();
   }
   else if(ypos == 0)
   {
      speedy = 5;
   }
   
   if(intersects(xpos, ypos, mouseX, paddleY + 110, paddleLength))
   {
     text("hit paddle", 50, 50);
      speedx =- speedx;
      speedy =- speedy; 
      sound.trigger();
   }
   
}

boolean intersects(int ballX, int ballY, int paddleX, int paddleY, int paddleLength) {
if (ballY > paddleY - paddleLength && ballX > paddleX && ballX < paddleX + paddleLength)
return true;
else 
return false;
}


