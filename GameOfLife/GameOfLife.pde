int tCelula = 10;
int ANCHO = 800;
int LARGO =600;
int [][] tablero = new int [round(LARGO/tCelula)][round(ANCHO/tCelula)];
int colorMalla = #92969D;
int pausa = 0;
int velocidad = 200;

void setup() {
  background(#FAFCFF);
  stroke(colorMalla);
  size(800, 600);
  fill(0, 0, 0);
  limpiarTablero();
  dibujar();
  //Esta chevere. Tamaño 10
  /*
  tablero [3][4] = 1;
   tablero [3][5] = 1;
   tablero [3][6] = 1;
   tablero [3][7] = 1;
   tablero [3][8] = 1;
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
void draw() {
  background(255, 255, 255);
  crearEstadoInicial();
  dibujar();
  comprobarPausa();
  controlarVelocidad();
  delay(velocidad);
}
void crearEstadoInicial() {
  if (keyPressed) {
    if (key == 'q'|| key == 'Q') {
      //Bee-Hive Sacado de: https://en.wikipedia.org/wiki/Conway's_Game_of_Life#/media/File:Game_of_life_beehive.svg
      tablero[30][40] = 1;
      tablero[30][41] = 1;
      tablero[31][39] = 1;
      tablero[31][42] = 1;
      tablero[32][40] = 1;
      tablero[32][41] = 1;
    }
    if (key == 'w'|| key == 'W') {
      //Pulsar Sacado de: https://en.wikipedia.org/wiki/Conway's_Game_of_Life#/media/File:Game_of_life_pulsar.gif
      tablero[24][36] = 1;
      tablero[24][37] = 1;
      tablero[24][38] = 1;
      tablero[24][42] = 1;
      tablero[24][43] = 1;
      tablero[24][44] = 1;
      tablero[26][34] = 1;
      tablero[26][39] = 1;
      tablero[26][41] = 1;
      tablero[26][46] = 1;
      tablero[27][34] = 1;
      tablero[27][39] = 1;
      tablero[27][41] = 1;
      tablero[27][46] = 1;
      tablero[28][34] = 1;
      tablero[28][39] = 1;
      tablero[28][41] = 1;
      tablero[28][46] = 1;
      tablero[29][36] = 1;
      tablero[29][37] = 1;
      tablero[29][38] = 1;
      tablero[29][42] = 1;
      tablero[29][43] = 1;
      tablero[29][44] = 1;
      tablero[31][36] = 1;
      tablero[31][37] = 1;
      tablero[31][38] = 1;
      tablero[31][42] = 1;
      tablero[31][43] = 1;
      tablero[31][44] = 1;
      tablero[32][34] = 1;
      tablero[32][39] = 1;
      tablero[32][41] = 1;
      tablero[32][46] = 1;
      tablero[33][34] = 1;
      tablero[33][39] = 1;
      tablero[33][41] = 1;
      tablero[33][46] = 1;
      tablero[34][34] = 1;
      tablero[34][39] = 1;
      tablero[34][41] = 1;
      tablero[34][46] = 1;
      tablero[36][36] = 1;
      tablero[36][37] = 1;
      tablero[36][38] = 1;
      tablero[36][42] = 1;
      tablero[36][43] = 1;
      tablero[36][44] = 1;
    }
    if (key == 'e'|| key == 'E') {
      //Glider Sacado de: http://en.wikipedia.org/wiki/Conway's_Game_of_Life#/media/File:Game_of_life_animated_glider.gif
      tablero[29][40] = 1;
      tablero[30][38] = 1;
      tablero[30][40] = 1;
      tablero[31][39] = 1;
      tablero[31][40] = 1;
    }
    if (key == 'r'|| key == 'R') {
      //wikipedia Sacado de: https://en.wikipedia.org/wiki/Conway's_Game_of_Life#/media/File:Gospers_glider_gun.gif
      tablero [30][40] = 1;
      tablero [30][41] = 1;
      tablero [31][41] = 1;
      tablero [31][42] = 1;
      tablero [32][41] = 1;
    }
    if (key == 's'|| key == 'S') {
      //Random https://processing.org/reference/random_.html
      for (int i = 0; i<int(random(ANCHO*LARGO)); i++) {
        int x = int(random(tablero.length));
        int y = int(random(tablero[0].length));
        tablero[x][y] = 1;
      }
    }
    if (key == 'f'|| key == 'F') {
      limpiarTablero();
    }
  }
}
void limpiarTablero() {
  for (int i = 0; i < tablero.length; i ++) {
    for (int j = 0; j < tablero[0].length; j ++) {
      tablero[i][j] = 0;
    }
  }
}
//Sacado de: https://processing.org/reference/square_.html
void dibujar() {
  for (int i = 0; i < tablero.length; i ++) {
    for (int j = 0; j < tablero[0].length; j ++) {
      if (tablero[i][j] == 1) {
        square(j*tCelula, i*tCelula, tCelula);
      }
    }
  }
  cuadricula();
}
//Sacado de: https://processing.org/reference/line_.html
void cuadricula() {
  for (int i = 0; i < tablero[0].length; i++) {
    line(i*tCelula, 0, i*tCelula, LARGO);
  }
  for (int i = 0; i < tablero.length; i++) {
    line(0, i*tCelula, ANCHO, i*tCelula);
  }
}
// Sacado de: https://processing.org/reference/mouseWheel_.html
void mouseWheel(MouseEvent event) {
  pausa = event.getCount();
}
void comprobarPausa() {
  if (pausa == 1) {
    modificarTablero();
  } else {
    println("El juego esta pausado");
  }
}
void modificarTablero() {
  int [][]aux = new int [tablero.length][tablero[0].length];
  int cuenta = 0;
  for (int i = 0; i < aux.length; i ++) {
    for (int j = 0; j < aux[0].length; j ++) {
      aux[i][j] = tablero[i][j];
    }
  }
  for (int i = 0; i < aux.length; i ++) {
    for (int j = 0; j < aux[0].length; j ++) {
      if (aux[i][j] == 1) {
        cuenta = contarVecinos(aux, i, j);
        if (cuenta !=2 & cuenta !=3) {
          tablero[i][j] = 0;
        }
      } else {
        cuenta = contarVecinos(aux, i, j);
        if (cuenta == 3) {
          tablero[i][j] = 1;
        }
      }
    }
  }
}
int contarVecinos(int [][] matriz, int i, int j) {
  int cuenta = 0;
  try {
    cuenta = matriz[i-1][j-1]+matriz[i][j-1]+matriz[i+1][j-1]+matriz[i-1][j]+matriz[i+1][j]+matriz[i-1][j+1]+matriz[i][j+1]+matriz[i+1][j+1];
  }
  catch(Exception e ) {
  }
  return cuenta;
}
void controlarVelocidad() {
  //Sacado de: https://processing.org/reference/key
  if (keyPressed) {
    if ((key == 'd'|| key == 'D') && velocidad > 0) {
      velocidad-=100;
    }
    if ((key == 'a'|| key == 'A') && velocidad < 1500) {
      velocidad+=100;
    }
  }
  if (pausa == 1) {
    println("Velocidad: ", velocidad);
  }
}
//Sacado de: https://processing.org/reference/mouseClicked_.html
void mouseClicked() {
  int x = (mouseY/tCelula);
  int y = (mouseX/tCelula);
  if (tablero[x][y] == 0) {
    tablero[x][y] = 1;
  } else {
    tablero[x][y] = 0;
  }
}
