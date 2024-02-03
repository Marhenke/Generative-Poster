class NombreFestival {
    
  private Caja caja;
  private PFont font;
  
  //  NOMBRE DEL FESTIVAL
  private String nombreFestival = "WAO";
  
  //  PARÁMETROS
  private String fontName = "DelaGothicOne-Regular.ttf";
  private int fontSize = 50;
  private int fontColor;
  private int margen = 10;
  
  //  CONSTRUCTOR    
  NombreFestival(){
  }
 
  //  INICIALIZACIÓN
  public void init()
  {
    font = createFont(fontName, fontSize, true);
    fontColor = color(255,255,255);
    fill(random(200,255),random(200,255),random(200,255));
    rect(0,0,0,0);
  }
  
  //  RENDERIZADO NOMBRE FESTIVAL
  public void draw()
  {
    textAlign(LEFT, TOP);
    textFont(font, fontSize);
    fill(fontColor);
    text(nombreFestival, caja.x+margen, caja.y, caja.anchoPx-margen*2, caja.altoPx);      
  }
  
  //  ASIGNACIÓN DE CAJA      
  public void asignarCaja(Caja _caja){
    caja =  new Caja(_caja.ancho, _caja.alto, _caja.x, _caja.y, _caja.id);
  }
  
}
