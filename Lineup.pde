class Lineup {
    
  private Caja caja;
  private PFont font;
    
  //  DESCRIPCIÓN
  private String[] lineup = {".Lil Wayne", ".Grimes", ".Illenium", ".Poppy", ".CL"}; //Array de strings con el lineup para el caso caja.ancho = 2
  private String lineup1 = "Lil Wayne . Grimes . CL . Illenium . Poppy";
  private float[] sizeofLineup = new float[lineup.length];                           //Array que contendra la cantidad de chars correspondiente a cada string del lineup1[]
  private float[] sumatoriaLineup = new float[lineup.length];                        //Array que contendra la sumatoria de chars del lineup[]. Es decir, si sizeofLineup[0] = 1
                                                                                     // y sizeofLineup[1] = 2 entonces sumatoriaLineup[0] = 1 y sumatoriaLineup[1] = 4
    
  //  PARÁMETROS
  private String fontName = "ABCDiatypeMono-Medium-Trial.otf";
  private int fontSize;
  private int fontLeading;
  private color fontColor;
  private int margen;
  private color boxColor;
  float sum = 0;
  
  //  CONSTRUCTOR
  Lineup(){
  }
  
  //  INICIALIZACIÓN
  public void init() 
  {
    margen = 10;
    fontSize = 20;
    fontLeading = 20;
    font = createFont(fontName, fontSize, true);
    fontColor = color(255,255,255);
    
    //Se carga el array sizeofLineup con la cantidad de chars por string
    for (int i = 0; i < lineup.length; i++)
    {
      sizeofLineup[i] = lineup[i].length();
    }
    
    //Se carga el array sumatoriaLineup con la sumatoria de chars de los strings
    for (int i = 0; i < lineup.length; i++)
    {
      sumatoriaLineup[i] = createSum(i);
    }
    
    //Aca se hace un random que determina el color del subrayado del texto y el color de tipografia correspondiente
    float i = random (0,4);
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
    
    //La tipografia sera de 16 en el caso de que se le asigne la caja mas chica, sino sera de 20
    if(caja.alto == 1 && caja.ancho == 2)
    {
       fontSize = 16;
    }
  }
  
  //  RENDERIZADO LINEUP
  public void draw()
  {
    textFont(font, fontSize);
    textLeading(fontLeading);
    textAlign(LEFT, TOP);
    
    //Se escribe el lineup y se dibuja el subrayado correspondiente al tipo de caja. Si es de ancho 2 se dibuja uno encima del otro, sino iran en orden.
    if(caja.ancho == 2)
    {
      fill(boxColor);
      rect(caja.x+margen, caja.y+margen, caja.anchoPx-margen*2, fontSize*5);
      fill(fontColor);
      for(int i = 0; i<lineup.length; i++)
      {
        text(lineup[i], caja.x+margen, caja.y+margen+fontSize*i, caja.anchoPx-margen*2, caja.altoPx);
      }
    }
    else if (caja.ancho == 4)
    {
      fill(boxColor);
      rect(caja.x+margen, caja.y+margen, caja.anchoPx-margen*2, fontSize*2);
      fill(fontColor);
      text(lineup1, caja.x+margen, caja.y+margen, caja.anchoPx-margen*2, caja.altoPx);
    }
  }
  
  //  ASIGNACIÓN DE CAJA
  public void asignarCaja(Caja _caja){
    caja =  new Caja(_caja.ancho, _caja.alto, _caja.x, _caja.y, _caja.id);
  }
  
  //Funcion que calcula la sumatoria de chars de x elementos de un array
  public float createSum(int indice)
  {
    for (int i = indice; i<0; i--)
    {
      sum += sizeofLineup[i];
    }
    return sum;
  }
  
}
