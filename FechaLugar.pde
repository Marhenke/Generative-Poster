class FechaLugar {
    
  private Caja caja;
  private PFont font;
    
  //  FECHA/LUGAR
  private String fechaFestival = "15 + 16 May 2022";
  private String lugarFestival = "Eleanor Tinsley Park, Houston";
    
  //  PARÁMETROS
  private String fontName = "ABCDiatypeMono-Regular-Trial.otf";
  private int fontSize = 18;
  private color fontColor1;
  private color boxColor;
  private int margen = 10;
  private int altoSubrayado = 10;
 
  //  CONSTRUCTOR  
  FechaLugar(){
  }
   
  //  INICIALIZACIÓN
  public void init()
  {
    font = createFont(fontName, fontSize, true);
    fontColor1 = color(255);
    float i = random (0,4);
    
    //Aca se hace un random que determina el color del subrayado del texto y el color de tipografia correspondiente
    if(i > 0 && i <=1)
    {
      boxColor = color(180,156,246);
    }
    else if (i > 1 && i <= 2)
    {
      boxColor = color(250,250,120);
      fontColor1 = color(0);
    }
    else if (i > 2 && i <= 3)
    {
      boxColor = color(170, 247, 227);
      fontColor1 = color(0);
    }
    else
    {
      boxColor = color(252, 168, 149);
    }
    
    //EL subrayado tendra distinto alto dependiendo de si la descripcion es asignada a una caja de ancho 2 o 4 asi como la tipografia tendra distinto tamaño
    if(caja.ancho == 2)
    {
      fontSize = 16;
      altoSubrayado = fontSize*2 + margen;
    }
    else if (caja.ancho == 4)
    {
      fontSize = 20;
      altoSubrayado = fontSize;
    }
  }
  
  //  RENDERIZADO FECHA/LUGAR  
  public void draw()
  {
    textLeading(20);
    textAlign(LEFT, TOP);
    textFont(font, fontSize);
    
    fill(boxColor);
    rect(caja.x+margen, caja.y+margen/2, caja.anchoPx-margen*2, fontSize);
    rect(caja.x+margen, caja.y+fontSize+3*margen/2, caja.anchoPx-margen*2, altoSubrayado);

    fill(fontColor1);
    text(fechaFestival, caja.x+margen, caja.y, caja.anchoPx-margen*2, caja.altoPx);
    fill(fontColor1);
    text(lugarFestival, caja.x+margen, caja.y+fontSize+margen, caja.anchoPx, caja.altoPx - 2*margen);
  }
  
  //  ASIGNACIÓN DE CAJA      
  public void asignarCaja(Caja _caja){
    caja =  new Caja(_caja.ancho, _caja.alto, _caja.x, _caja.y, _caja.id);
  }
  
}
