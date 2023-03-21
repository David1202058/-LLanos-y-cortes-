class Particle {
  float x, y; // posición de la partícula
  float speedX, speedY; // velocidad de movimiento de la partícula
  float size; // tamaño de la partícula
  int life; // duración de vida de la partícula
  int maxLife; // duración máxima de vida de la partícula
  color col; // color de la partícula
  
  Particle(float xpos, float ypos, float spX, float spY, float s, int l, color c) {
    x = xpos;
    y = ypos;
    speedX = spX;
    speedY = spY;
    size = s;
    life = l;
    maxLife = l;
    col = c;
  }
  
  void move() {
    // actualizar la posición basada en la velocidad
    x += speedX;
    y += speedY;
    // reducir la duración de vida
    life--;
    // si la duración de vida llega a cero, reiniciar la partícula
    if (life <= 0) {
      reset();
    }
  }
  
  void reset() {
    // reiniciar la partícula con una duración de vida aleatoria
    x = random(width);
    y = random(height);
    speedX = random(-1, 1);
    speedY = random(-1, 1);
    size = random(5, 15);
    life = int(random(50, 200));
    maxLife = life;
    col = color(0, 150, 255);
  }
  
  void display() {
    // dibujar la partícula con un alpha basado en la duración de vida
    float alpha = map(life, 0, maxLife, 0, 255);
    fill(red(col), green(col), blue(col), alpha);
    noStroke();
    ellipse(x, y, size, size);
  }
}

ArrayList<Particle> particles = new ArrayList<Particle>(); // lista de partículas
int particleCount = 100; // cantidad de partículas

void setup() {
  size(500, 500);
  background(255);
  // crear partículas aleatorias
  for (int i = 0; i < particleCount; i++) {
    float xpos = random(width);
    float ypos = random(height);
    float spX = random(-1, 1);
    float spY = random(-1, 1);
    float s = random(5, 15);
    int l = int(random(50, 200));
    color c = color(0, 150, 255);
    Particle p = new Particle(xpos, ypos, spX, spY, s, l, c);
    particles.add(p);
  }
}

void draw() {
  background(255);
  // mover y mostrar cada partícula
  for (Particle p : particles) {
    p.move();
    p.display();
  }
}
