int e;
int M1x, M2x, M3y, M4y, M5x;
PImage flautistadehamelin;
PImage flautistadehamelin1;
PImage flautistadehamelin2;
PImage flautistadehamelin3;
PImage flautistadehamelin4;
PImage flautistadehamelin5;
PFont fuente2;

void setup() {
  size(640, 480);
  textAlign(CENTER, CENTER);
  
  flautistadehamelin = loadImage("flautistadehamelin.jpg");
  flautistadehamelin1 = loadImage("flautistadehamelin1.jpg");
  flautistadehamelin2 = loadImage("flautistadehamelin2.jpg");
  flautistadehamelin3 = loadImage("flautistadehamelin3.jpg");
  flautistadehamelin4 = loadImage("flautistadehamelin4.jpg");
  flautistadehamelin5 = loadImage("flautistadehamelin5.jpg");
  fuente2 = loadFont("Arial-BoldMT-30.vlw");

  e = 0;

  M1x = width;
  M2x = -400;
  M3y = -100;
  M4y = height + 50;
  M5x = width;
}

void draw() {
  if (e == 0) {
    background(80);
    image(flautistadehamelin, 0, 0, width, height);
    dibujarBoton();

  } else if (e == 1) {
    background(80);  
    image(flautistadehamelin1, 0, 0, width, 400);

    fill(255);
    textFont(fuente2);
    textSize(16);
    text("Hamelín sufrió una terrible plaga de ratas. Desesperados, los vecinos le exigieron al alcalde una solución urgente.", M1x - 300, 405, 600, 60);
    
    if (M1x > 320) {
      M1x -= 3;
    }

    if (frameCount == (60 * 10)) {
      e = 2;
    }

  } else if (e == 2) {
    background(80);
    image(flautistadehamelin2, 0, 0, width, 400);

    fill(255);
    textFont(fuente2);
    textSize(16);
    text("Un misterioso flautista apareció en el pueblo. Prometió llevarse a todos los roedores a cambio de unas monedas de oro.", M2x - 300, 405, 600, 60);
    
    if (M2x < 320) {
      M2x += 3;
    } else {
      M2x = 320;
    }

    if (frameCount == (60 * 20)) {
      e = 3;
    }

  } else if (e == 3) {
    background(80);
    image(flautistadehamelin3, 0, 0, width, 400);

    fill(255);
    textFont(fuente2);
    textSize(16);
    text("El hombre tocó una melodía mágica. Las ratas salieron hipnotizadas, lo siguieron en fila hasta el río y se ahogaron.", 20, M3y - 30, 600, 60);
    
    if (M3y < 435) {
      M3y += 3;
    }

    if (frameCount == (60 * 30)) {
      e = 4;
    }

  } else if (e == 4) {
    background(80);
    image(flautistadehamelin4, 0, 0, width, 400);

    fill(255);
    textFont(fuente2);
    textSize(16);
    text("Con el problema resuelto, el alcalde rompió su promesa. Se negó a pagarle la recompensa acordada y se burló de él.", 20, M4y - 30, 600, 60);
    
    if (M4y > 435) {
      M4y -= 3;
    }

    if (frameCount == (60 * 40)) {
      e = 5;
    }

  } else if (e == 5) {
    background(80);
    image(flautistadehamelin5, 0, 0, width, 400);

    fill(255);
    textFont(fuente2);
    textSize(16);
    text("Enojado, el flautista tocó una nueva canción. Hipnotizó a todos los niños del pueblo, quienes lo siguieron hasta desaparecer en una montaña.", M5x - 300, 405, 600, 60);
    
    if (M5x > 320) {
      M5x -= 3;
    }

    if (frameCount == (60 * 45)) {
      e = 6;
    }

  } else if (e == 6) {
    background(80);
    image(flautistadehamelin5, 0, 0, width, 400);
    
    fill(255);
    textFont(fuente2);
    textSize(16);
    text("Enojado, el flautista tocó una nueva canción. Hipnotizó a todos los niños del pueblo, quienes lo siguieron hasta desaparecer en una montaña.", 20, 405, 600, 60);

    dibujarBoton(); 
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (mouseX > 220 && mouseX < 420 && mouseY > 20 && mouseY < 60) {
      
      if (e == 0) {
        e = 1;
        frameCount = 0;
      } else if (e == 6) {
        e = 0;              
        frameCount = 0;     
        
        M1x = width;
        M2x = -400;
        M3y = -100;
        M4y = height + 50;
        M5x = width;
      }
    }
  }
}

void dibujarBoton() {
  fill(150); 
  rect(220, 20, 200, 40); 
  
  fill(0); 
  textSize(16);
  
  if (e == 0) {
    text("Iniciar", 320, 40);
  } else if (e == 6) {
    text("Volver al inicio", 320, 40); 
  }
}
