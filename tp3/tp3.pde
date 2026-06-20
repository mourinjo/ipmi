// https://youtu.be/fqTv8isuEkE

PImage referencia;
color colorA;
color colorB;
float rotacion = 0;
int cantCapas = 18;
float escala = 1.0;
int btnX = 10;
int btnY = 355;
int btnW = 110;
int btnH = 35;

void setup() {
  size(800, 400);
  referencia = loadImage("32.png");
  colorA = color(0);
  colorB = color(255);
}

void draw() {
  background(0);
  image(referencia, 0, 0, 400, 400);

  if (mouseX > width / 2) {
    escala = map(mouseY, 0, height, 1.0, 0.5);
    if (escala < 0.5) escala = 0.5;
    if (escala > 1.0) escala = 1.0;
  }

  pushMatrix();
  translate(600, 200);
  rotate(rotacion);
  dibujarPatron();
  popMatrix();

  dibujarBoton(btnX, btnY);
}

float calcularTam(int capa) {
  return map(capa, 1, cantCapas, 40, 200) * escala;
}

void dibujarPatron() {
  noStroke();

  float tamMax = calcularTam(cantCapas);

  fill(colorB);
  rect(-tamMax, -tamMax, tamMax, tamMax);

  fill(colorA);
  rect(0, -tamMax, tamMax, tamMax);

  fill(colorA);
  rect(-tamMax, 0, tamMax, tamMax);

  fill(colorB);
  rect(0, 0, tamMax, tamMax);

  for (int i = cantCapas; i >= 1; i--) {
    float tam = calcularTam(i);

    color cDiag, cNormal;
    if (i == 1) {
      cDiag   = colorB;
      cNormal = colorA;
    } else if (i % 2 == 1) {
      cDiag   = colorA;
      cNormal = colorB;
    } else {
      cDiag   = colorB;
      cNormal = colorA;
    }

    for (int fila = 0; fila < 2; fila++) {
      for (int col = 0; col < 2; col++) {
        if (fila == col) {
          fill(cDiag);
        } else {
          fill(cNormal);
        }
        float x = -tam + col * tam;
        float y = -tam + fila * tam;
        rect(x, y, tam, tam);
      }
    }
  }
}

void dibujarBoton(int x, int y) {
  fill(200);
  stroke(50);
  rect(x, y, btnW, btnH, 10);
  fill(0);
  textSize(16);
  textAlign(CENTER, CENTER);
  text("Reiniciar", x + btnW/2, y + btnH/2);
}

void mousePressed() {
  if (mouseX > btnX && mouseX < btnX + btnW &&
      mouseY > btnY && mouseY < btnY + btnH) {
    reiniciar();
    return;
  }
  if (mouseX > width / 2) {
    colorA = color(random(255), random(255), random(255));
    colorB = color(random(255), random(255), random(255));
  }
}
void reiniciar() {
  colorA = color(0);
  colorB = color(255);
  cantCapas = 18;
  rotacion = 0;
  escala = 1.0;
}
