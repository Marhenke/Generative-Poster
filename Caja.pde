class Caja {
  
  int ancho;   // ANCHO EN MÓDULOS. VALORES: 2 4
  int alto;    // ALTO EN MÓDULOS. VALORES: 1 2 3 4 
  int x, y;    // POSICIÓN DE LA CAJA
  int id;      // NÚMERO DE IDENTIFICACION DE LA CAJA
  int area;    // AREA DE LA CAJA EXPRESADA EN MÓDULOS. VALORES 4 6 
  int anchoPx; // ANCHO EN PIXELES
  int altoPx;  // ALTO EN PIXELES
  int modulo = width/4;
 
  Caja (int w, int h, int _x, int _y, int _id){
    x = _x;
    y = _y;     
    ancho = w;
    alto = h;
    id = _id;
    area = w*h;
    altoPx = alto * modulo;
    anchoPx = ancho * modulo;
  }
 
  void draw(){
    stroke(255);     
    fill(255,0);
    rect(x, y, anchoPx, altoPx);
  }
   
}
 
