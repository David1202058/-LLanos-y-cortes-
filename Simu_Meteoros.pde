class Particle {
  float x, y; // posición de la partícula
  float speedX, speedY; // velocidad de movimiento de la partícula
  float size; // tamaño de la partícula
  color col; // color de la partícula
  
  Particle(float xpos, float ypos, float spX, float spY, float s, color c) {
    x = xpos;
    y = ypos;
    speedX = spX;
    speedY = spY;
    size = s;
    col = c;
  }
  
  void move() {
    // actualizar la posición basada en la velocidad
    x += speedX;
    y += speedY;
    // rebote en los bordes de la pantalla
    if (x < 0 || x > width) {
      speedX *= -1;
    }
    if (y > height) {
      reset();
    }
  }
  
  void reset() {
    // reiniciar la partícula en una posición aleatoria en la parte superior de la pantalla
    x = random(width);
    y = random(-height/2, -height/10);
    speedX = random(-2, 2);
    speedY = random(10, 20); // velocidad descendente
    size = random(5, 15);
    col = color(random(200, 255), random(100, 200), 0);
  }
  
  void display() {
    // dibujar la partícula
    fill(col);
    noStroke();
    ellipse(x, y, size, size);
  }
}

ArrayList<Particle> particles = new ArrayList<Particle>(); // lista de partículas
int particleCount = 100; // cantidad de partículas

void setup() {
  size(500, 500);
  background(0);
  // crear partículas aleatorias
  for (int i = 0; i < particleCount; i++) {
    float xpos = random(width);
    float ypos = random(-height/2, -height/10); // comenzar desde arriba de la pantalla
    float spX = random(-2, 2);
    float spY = random(10, 20); // velocidad descendente
    float s = random(5, 15);
    color c = color(random(200, 255), random(100, 200), 0);
    Particle p = new Particle(xpos, ypos, spX, spY, s, c);
    particles.add(p);
  }
}

void draw() {
  background(0);
  // mover y mostrar todas las partículas
  for (Particle p : particles) {
    p.move();
    p.display();
  }
}
