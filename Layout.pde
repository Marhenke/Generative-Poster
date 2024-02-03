class Layout {
    
  private int modulo = width/4;
  private int filasCounter = 0;
  private int filas = 7;
  private int columnas = 4;
  public Caja caja01, caja02, caja03, caja04, caja05;
  public Boolean showGrid = false; 

  //  CONSTRUCTOR LAYOUT
  Layout(){
    armarGrilla();
  }
  
  //  RENDERIZDO LAYOUT
  public void draw(){
    if(showGrid){
      caja01.draw(); 
      caja02.draw(); 
      caja03.draw(); 
      caja04.draw(); 
      caja05.draw();
    }
  }
 
  //  RENDERIZADO GRILLA
  public void showHideGrid(){
    if(showGrid)
      showGrid = false;
    else
      showGrid = true;
  }
  
  //  ARMADO DE GRILLA    
  public void armarGrilla(){
    caja01 = new Caja(getAnchoRand(2,columnas+1), getAltoRand(1,5), 0, 0, 1);
    filasCounter = caja01.alto;  
    //Si hay lugar al lado del 1ro, dibujo el 2do, de igual o mayor alto
    if(caja01.ancho<4){
      caja02 = new Caja(columnas-caja01.ancho, getAltoRand(caja01.alto,5), caja01.ancho*modulo, 0, 2); 
      if(caja02.alto>caja01.alto){//si la 2da columna es mas alta, completo a izquierda //println("camino1");
        filasCounter = caja02.alto;
        caja03 = new Caja(caja01.ancho, caja02.alto-caja01.alto, 0, caja01.alto*modulo, 3);
        if((filas-filasCounter)>1){
          if(getAnchoRand(2,5)==2){
            caja04 = new Caja(2, filas-filasCounter, 0, filasCounter*modulo, 4);
            caja05 = new Caja(2, filas-filasCounter, caja04.ancho*modulo, filasCounter*modulo, 5);
          }else{
            caja04 = new Caja(4, filas-filasCounter-1, 0, filasCounter*modulo, 4);
            filasCounter = filasCounter+caja04.alto;
            caja05 = new Caja(4, filas-filasCounter, 0, filasCounter*modulo, 5);
          }
         }else{
           caja04 = new Caja(2, 1, 0, filasCounter*modulo, 4);
           caja05 = new Caja(2, 1, caja04.ancho*modulo, filasCounter*modulo, 5);
         }
       }else{ //sigo con una nueva //println("CAMINO 2");
          caja03 = new Caja(getAnchoRand(2,5), getAltoRand(1,filas-filasCounter-2), 0, filasCounter*modulo, 3);         
          if(caja03.ancho==4){ //Si no hay lugar, sigo abajo con el 4to
            filasCounter = filasCounter+caja03.alto;
            if((filas-filasCounter)>1){
              if(getAnchoRand(2,5)==2){//println("CAMINO 2A");
                caja04 = new Caja(2, filas-filasCounter, 0, filasCounter*modulo, 4);
                caja05 = new Caja(2, filas-filasCounter, caja04.ancho*modulo, filasCounter*modulo, 5);
              }else{//println("CAMINO 2B");
                caja04 = new Caja(4, filas-filasCounter-1, 0, filasCounter*modulo, 4);
                filasCounter = filasCounter+caja04.alto;
                caja05 = new Caja(4, filas-filasCounter, 0, filasCounter*modulo, 5);
              }
            }else{//println("CAMINO 2C");
              caja04 = new Caja(2, 1, 0, filasCounter*modulo, 4);
              caja05 = new Caja(2, 1, caja04.ancho*modulo, filasCounter*modulo, 5);
            }
          }else{ //Si hay lugar, lo completo con el 4to y pongo abajo el 5to //println("CAMINO 2D");
            caja04 = new Caja(2, caja03.alto, caja03.ancho*modulo, filasCounter*modulo, 4);
            filasCounter=filasCounter+caja03.alto;
            caja05 = new Caja(4,filas-filasCounter, 0, filasCounter*modulo, 5);
          }
       }
     }else{ //Si no hay lugar, sigo abajo con el 2do
       caja02 = new Caja(getAnchoRand(2,5), getAltoRand(1,filas-filasCounter-2), 0, caja01.alto*modulo, 2);
       filasCounter = filasCounter + caja02.alto;      
       if(caja02.ancho==4){ //S no hay lugar, sigo abajo con el 3ro //println("CAMINO 3");
         caja03 = new Caja(getAnchoRand(2,5), getAltoRand(1,filas-filasCounter-1), 0, filasCounter*modulo, 3);
         filasCounter = filasCounter + caja03.alto;
         if(caja03.ancho==4){ //Si no hay lugar, sigo abajo con el 4to   
           if((filas-filasCounter)>1)
             if(getAnchoRand(2,5)==2){//println("CAMINO 3A");
               caja04 = new Caja(2, filas-filasCounter, 0, filasCounter*modulo, 4);
               caja05 = new Caja(2, filas-filasCounter, caja04.ancho*modulo, filasCounter*modulo, 5);
             }else{//println("CAMINO 3B");
               caja04 = new Caja(4, filas-filasCounter-1, 0, filasCounter*modulo, 4);
               filasCounter = filasCounter+caja04.alto;
               caja05 = new Caja(4, filas-filasCounter, 0, filasCounter*modulo, 5);
             }
           else{//println("CAMINO 3C");
             caja04 = new Caja(2, 1, 0, filasCounter*modulo, 4);
             caja05 = new Caja(2, 1, caja04.ancho*modulo, filasCounter*modulo, 5);
           }
         }else{//println("CAMINO 3D");
           caja04 = new Caja(2, caja03.alto, caja03.ancho*modulo, caja03.y, 4);
           caja05 = new Caja(4, filas-filasCounter, 0, filasCounter*modulo, 5);
         }
       }else{//si hay a derecha lo completo //println("CAMINO 4");            
         caja03 = new Caja(4-caja02.ancho, int(random(caja02.alto,caja02.alto+2)), caja02.ancho*modulo, caja01.alto*modulo, 3);
         if(caja03.alto>caja02.alto){//Si hay lugar a izquierda, lo completo con el 4to //println("Camino 4A");
           caja04 = new Caja(2, 1, 0, filasCounter*modulo, 4);
           filasCounter = filasCounter+caja04.alto;
           caja05 = new Caja(4, filas-filasCounter, 0, filasCounter*modulo, 5);
         }else{
           if((filas-filasCounter)==1){//Si queda una sola fila, pongo 4to y 5to
             filasCounter = filasCounter+caja03.alto;
             caja04 = new Caja(2, 1, 0, filasCounter*modulo, 4);
             caja05 = new Caja(2, 1, caja04.ancho*modulo, filasCounter*modulo, 5);
           }else{
             caja04 = new Caja(4, filas-filasCounter-1, 0, filasCounter*modulo, 4);
             filasCounter = filasCounter+caja04.alto;
             caja05 = new Caja(4, filas-filasCounter, 0, filasCounter*modulo, 5);
           }
         }
       }
     }  
  }
  
  //  DETERMINA ANCHO DE LA CAJA
  private int getAnchoRand(int l, int h){
    int ancho = int(random(l,h));
    if(ancho==3)
      if(random(0,1)>0.5)
        ancho = 4;
      else
        ancho = 2;
    return ancho;
  }
 
  //  DETERMINA ALTO DE LA CAJA
  private int getAltoRand(int l, int h){
    int alto =int(random(l,h));
    return alto;
  }
  
} 
