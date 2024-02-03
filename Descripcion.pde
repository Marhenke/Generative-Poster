class Descripcion {
    
  private Caja caja;
  private PFont font;
    
  //  DESCRIPCIÓN
  private String descripcion = "MUSIC & ARTS Festival";
    
  //  PARÁMETROS
  private String fontName = "DelaGothicOne-Regular.ttf";
  private int fontSize = 20;
  private int fontLeading;
  private color fontColor;
  private int margen = 10;
  private color boxColor;
  private float altoSubrayado;
  
  //  CONSTRUCTOR
  Descripcion(){
  }
  
  //  INICIALIZACIÓN
  public void init()
  {
    font = createFont(fontName, fontSize, true);
    fontColor = color(255);
    fontLeading = 16;
    float i = random (0,4);
    
    //Aca se hace un random que determina el color del subrayado del texto y el color de tipografia correspondiente
    if(i > 0 && i <=1)
    {
      boxColor = color(180,156,246);
    }
    else if (i > 1 && i <= 2)
    {
      boxColor = color(250,250,120);
      fontColor = color(0);
    }
    else if (i > 2 && i <= 3)
    {
      boxColor = color(170, 247, 227);
      fontColor = color(0);
    }
    else
    {
      boxColor = color(252, 168, 149);
    }
    
    //EL subrayado tendra distinto alto dependiendo de si la descripcion es asignada a una caja de ancho 2 o 4
    if(caja.ancho == 2)
    {
      altoSubrayado = 3*fontSize;
    }
    else if (caja.ancho == 4)
    {
      altoSubrayado = fontSize;
    }
  }
  
  //  RENDERIZADO DESCRIPCIÓN
  public void draw()
  {
    textAlign(LEFT, TOP);
    textFont(font, fontSize);
    textLeading(fontLeading);
    
    //Se dibuja la caja de subrayado
    fill(boxColor);
    rect(caja.x+margen, caja.y+margen/2, caja.anchoPx-margen*2, altoSubrayado);
    
    //Se escribe la descripcion por encima del subrayado
    fill(fontColor);
    text(descripcion, caja.x+margen, caja.y, caja.anchoPx-margen*2, caja.altoPx);      
  }
  
  //  ASIGNACIÓN DE CAJA
  public void asignarCaja(Caja _caja){
    caja =  new Caja(_caja.ancho, _caja.alto, _caja.x, _caja.y, _caja.id);
  }
}
