PImage landscape;
PShape world;

PShader texShader;
float angle;

void setup() {
  size(600, 600, P3D);
  landscape = loadImage("lachoy.jpg");
  world = createWorld(500, landscape, 100);
  texShader = loadShader("worldfrag.glsl", "worldvert.glsl");
}

void draw() {
  background(0);
  shader(texShader);
  translate(50, height/2);
  shape(world);
  angle += 0.01;
}


PShape createWorld(int slide, PImage texture, int detail) {
  textureMode(NORMAL);
  PShape wd = createShape();
  wd.beginShape(QUAD_STRIP);
  wd.noStroke();
  wd.texture(texture);
  for (int i = 0; i <= detail; i++) {
    float u = float(i) / 4*detail;
    float x = (slide / detail) * i;
    wd.normal(1, 0, 1); 
    wd.vertex(x, -slide/2, 1, u, 0);
    wd.vertex(x, slide/2, 1, u, 1);
  }
  for (int i = 0; i <= detail; i++) {
    float u = float(i) / 4*detail;
    float x = (slide / detail) * i;
    wd.normal(1, 0, 1); 
    wd.vertex(x, -slide/2, 1, u, 0);
    wd.vertex(x, slide/2, 1, u, 1);
  }
  for (int i = 0; i <= detail; i++) {
    float u = float(i) / 4*detail;
    float x = (slide / detail) * i;
    wd.normal(1, 0, 1); 
    wd.vertex(x, -slide/2, 1, u, 0);
    wd.vertex(x, slide/2, 1, u, 1);
  }
  for (int i = 0; i <= detail; i++) {
    float u = float(i) / 4*detail;
    float x = (slide / detail) * i;
    wd.normal(1, 0, 1); 
    wd.vertex(x, -slide/2, 1, u, 0);
    wd.vertex(x, slide/2, 1, u, 1);
  }
  wd.endShape();  
  
  return wd;
}
