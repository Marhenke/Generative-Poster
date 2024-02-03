class Textura {

  private Caja caja;
  private PImage img;
  float margen = 10;
  float amp = 0;
  
  //  CONSTRUCTOR
  Textura(){
        
  }
  
  //  INICIALIZACIÓN
  public void init()
  {
    img = loadImage("Logo.png");  
  }
  
  //  RENDERIZADO TEXTURA
  public void draw()
  {
    image(img, random(caja.x+margen, caja.x+3*margen), caja.y);
  }
  
  //  ASIGNACIÓN DE CAJA      
  public void asignarCaja(Caja _caja){
    caja =  new Caja(_caja.ancho, _caja.alto, _caja.x, _caja.y, _caja.id);
  }
  
}
