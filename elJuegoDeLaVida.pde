int tCelula = 10;
int [][] tablero = new int [round(600/tCelula)][round(800/tCelula)];

void setup(){
  size(800,600);
  for (int i = 0 ; i < tablero.length ; i ++){
    for (int j = 0 ; j < tablero[0].length; j ++){
      tablero[i][j] = 0;
    }
  }
  print(tablero.length+" x ");
  print(tablero[0].length+" y ");
  println();
  //wikipedia
  /*
  tablero [30][40] = 1;
  tablero [30][41] = 1;
  tablero [31][41] = 1;
  tablero [31][42] = 1;
  tablero [32][41] = 1;
  */
  //Bonito
  /*
  tablero [30][40] = 1;
  tablero [31][40] = 1;
  tablero [32][40] = 1;
  tablero [33][40] = 1;
  tablero [34][40] = 1;
  */
  //Sin estado inicial
  
}

void draw(){
  background(255,255,255);
  fill(0,0,0);
  dibujar();
  modificar_tablero();
  //delay(1000);
}
void modificar_tablero(){
  int [][]aux = new int [tablero.length][tablero[0].length];
  int cuenta = 0;
  for (int i = 0 ; i < aux.length; i ++){
    for (int j = 0 ; j < aux[0].length ; j ++){
      aux[i][j] = tablero[i][j];
    }
  }
  for (int i = 0 ; i < aux.length; i ++){
    for (int j = 0 ; j < aux[0].length ; j ++){
      if (aux[i][j] == 1){
        cuenta = contar_vecinos(aux,i,j);
        if (cuenta !=2 & cuenta !=3){
          tablero[i][j] = 0;
        }
      }else{
        cuenta = contar_vecinos(aux,i,j);
        if (cuenta == 3){
          tablero[i][j] = 1;
        }
      }
    }
  }
}
int contar_vecinos(int [][] matriz,int i,int j){
  int cuenta = 0;
  try{
    cuenta = matriz[i-1][j-1]+matriz[i][j-1]+matriz[i+1][j-1]+matriz[i-1][j]+matriz[i+1][j]+matriz[i-1][j+1]+matriz[i][j+1]+matriz[i+1][j+1];
  }catch(Exception e ){
    println("LLego a un borde");
  }
  return cuenta;
}
void dibujar(){
  for (int i = 0 ; i < tablero.length; i ++){
    for (int j = 0 ; j < tablero[0].length ; j ++){
      if (tablero[i][j] == 1){
         square(j*tCelula,i*tCelula,tCelula);
      }
    }
  }
}
