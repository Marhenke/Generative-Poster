class TexturaFondo 
{
  float alpha;
  float caso;
  int selectorArtista;
  private String[] artistas = {"LilWayne.png", "Grimes.png", "Poppy.png", "CL.png", "Illenium.png"};    //Array conteniendo nombres de las imagenes
  private PImage[] imagenes = new PImage[artistas.length];                                              //Array que contendra las imagenes
  SoundFile soundtrack;
  
  //  CONSTRUCTOR
  TexturaFondo(){
  }
  
  //  INICIALIZACIÓN
  public void init()
  {
    //Este random determinara el color de fondo
    caso = random (0,4);                                          
    
    //Se cargan las imagenes en el array imagenes[]
    for(int i = 0; i< artistas.length; i++)
    {
      imagenes[i] = loadImage(artistas[i]);
    }
    
    //Este random determinara que artista aparecera en el poster
    selectorArtista = (int)random (0,5);
  }
  
  //  RENDERIZADO TEXTURA FONDO
  public void draw()
  {  
    //Aqui se renderizara el color de fonfo de textura correspondiente al rand que se hizo en el init
    if(caso <=1)
    {
        background(180,156,246,50);
        noStroke();
        for (float i = random(1,5); i < 800; i+= 25)
        {
          for (float j = random(1,5); j < 800; j+= 25)
          {
            alpha = random(50,150);
            fill(150,random(150,200),250, alpha); 
            ellipse(i + random(1,5), j + random(1,5), 50,50);
          }
        }
    }
    
    else if (caso > 1 && caso <=2)
    {
        background(250,250,120,50);
        noStroke();
        for (float i = random(1,5); i < 800; i+= 25)
        {
          for (float j = random(1,5); j < 800; j+= 25)
          {
            alpha = random(50,150);
            fill(250,240,random(60,170), alpha); 
            ellipse(i + random(1,5), j + random(1,5), 50,50);
          }
        }
    }
    
    else if (caso > 2 && caso <=3)
    {
        background(170, 247, 227,50);
        noStroke();
        for (float i = random(1,5); i < 800; i+= 25)
        {
          for (float j = random(1,5); j < 800; j+= 25)
          {
            alpha = random(50,150);
            fill(random(60,170),240,200, alpha); 
            ellipse(i + random(1,5), j + random(1,5), 50,50);
          }
        }
    }
    else if (caso > 3)
    {
        background(252, 168, 149,50);
        noStroke();
        for (float i = random(1,5); i < 800; i+= 25)
        {
          for (float j = random(1,5); j < 800; j+= 25)
          {
            alpha = random(50,150);
            fill(250,random(140,210),random(195,115), alpha); 
            ellipse(i + random(1,5), j + random(1,5), 50,50);
          }
        }
    }
    
    //Se dibuja la imagen correspondiente al artista seleccionado por el rand del init
     image(imagenes[selectorArtista], 0,0);
  }
  
}
