import processing.sound.*;

/*************************************************************************

 LABORATORIO DE DISEÑO 7 . LICENCIATURA EN DISEÑO . UTDT 
  
 PR02 DISEÑO GENERATIVO
 2022
 
 Lucas De Marziani, Magdalena Molinari, Guillermo Peloche, 
 Martín Tarifeño, Rosario Murúa, Santiago Ocampo, Tamara Moura Costa
 
**************************************************************************

 Desarrollar código en los siguientes archivos:
 --- NombreFestival
 --- FechaLugar
 --- Descripcion
 --- Lineup
 --- Textura
 --- TexturaFondo
 
 El resto de los archivos en principio no es necesario que los modifiquen, 
 pero pueden hacerlo con total libertad si lo necesitan.
 
 Copiar archivos de fuentes (.ttf / .otf), imágenes y todo recurso externo
 a la carpeta data de este sketch.
 
 Shortcuts
 - pulsar barra espaciadora: para cambiar layout
 - pulsar tecla s para salvar frame

**************************************************************************/

  Layout layout;
  TexturaFondo texturaFondo;
  NombreFestival nombreFestival;
  FechaLugar fechaLugar;
  Descripcion descripcion;
  Lineup lineup;
  Textura textura;

  String[] canciones = {"Lil Wayne  Mona Lisa.wav", "Grimes Shinigami Eyes.wav", "Poppy  Bloom.wav", "CL Tie a Cherry.wav", "ILLENIUM Story of My Life.wav"}; //Array con los nombres de las canciones
  SoundFile[] soundtrack =  new SoundFile[canciones.length];         //Array que contendra las canciones                                          
  SoundFile soundtrack1;
  Amplitude analizadorAmplitud;
  
  void setup(){
    //  TAMAÑO RENDERIZADO
    size(384,672);
    frameRate(10);
    smooth(8);
   
  
    //  CREACIÓN LAYOUT
    layout = new Layout();
    layout.armarGrilla();
   
    //  CREACIÓN ELEMENTOS
    texturaFondo = new TexturaFondo();   
    nombreFestival = new NombreFestival();
    fechaLugar = new FechaLugar();
    descripcion = new Descripcion();
    lineup = new Lineup();
    textura = new Textura();
   
    //  ASIGNACIÓN ELEMENTOS
    asignarCajas(); 
    
    //  INICIALIZACIÓN DE ELEMENTOS
    texturaFondo.init();
    textura.init();    
    nombreFestival.init();  
    fechaLugar.init();
    descripcion.init();
    lineup.init();  
    
    //  SONIDO
    for(int i = 0; i < canciones.length; i++)                    //Se cargan las canciones al array
    {
        soundtrack[i] = new SoundFile(this,canciones[i]);
    }
    soundtrack1 = soundtrack[texturaFondo.selectorArtista];      //Suena la cancion que corresponde al artista seleccionado por el rand de texturaFondo.init()
    soundtrack1.loop();
    
    // ANALIZADOR DE AMPLITUD (VOLUMEN)
    analizadorAmplitud = new Amplitude(this);
    analizadorAmplitud.input(soundtrack1);
    
  }

  //  RENDERIZADO PIEZA FINAL
  void draw(){
    //  RESET
    //background(0);

    //  ELEMENTOS
    texturaFondo.draw();
    textura.draw();    
    nombreFestival.draw();  
    fechaLugar.draw();
    descripcion.draw();
    lineup.draw();
    
    //  GRILLA
    layout.draw();
  }
 
  //  SHORTCUTS DE TECLADO
  void keyPressed() {
    switch (key){
      case ' ':  //  barra espaciadora para regenerar grilla
        background(0);
        soundtrack[texturaFondo.selectorArtista].stop();
        //soundtrack[texturaFondo.selectorArtista].loop();
        layout.armarGrilla();
        asignarCajas();
        texturaFondo.init();
        textura.init();
        nombreFestival.init();
        fechaLugar.init();
        descripcion.init();
        lineup.init();
        soundtrack[texturaFondo.selectorArtista].loop();
        
        break;
      case 's':  //  s para guardar frame
        if(key == 's')
          saveFrame("data/PR2-###.jpg");
        break;
      case 'g':  //  g para mostrar grilla
        layout.showHideGrid();
        break;
    }   
  }
  
  //  ASIGNACIÓN DE CAJAS
  void asignarCajas(){
    Boolean[] cajasArray = new Boolean[5];
    for(int i=0;i<5;i++){
      cajasArray[i] = false;
    }  
   
    switch(int(random(0,4))){
      case 0:
        nombreFestival.asignarCaja(layout.caja02);
        fechaLugar.asignarCaja(layout.caja01);
        descripcion.asignarCaja(layout.caja03);
        lineup.asignarCaja(layout.caja05);
        textura.asignarCaja(layout.caja04);
        break;
      case 1:
        nombreFestival.asignarCaja(layout.caja03);
        fechaLugar.asignarCaja(layout.caja05);  
        descripcion.asignarCaja(layout.caja04);
        lineup.asignarCaja(layout.caja02);
        textura.asignarCaja(layout.caja01);        
        break;
      case 2:
        nombreFestival.asignarCaja(layout.caja03);
        fechaLugar.asignarCaja(layout.caja04); 
        descripcion.asignarCaja(layout.caja02);
        lineup.asignarCaja(layout.caja01);
        textura.asignarCaja(layout.caja05);        
        break;
      case 3:
        nombreFestival.asignarCaja(layout.caja02);
        fechaLugar.asignarCaja(layout.caja01);
        descripcion.asignarCaja(layout.caja05);
        lineup.asignarCaja(layout.caja03);
        textura.asignarCaja(layout.caja04);        
        break;
    }
  }
