CERO = [0, 1, 1, 1, 0;
        0, 1, 0, 1, 0;
        0, 1, 0, 1, 0;
        0, 1, 0, 1, 0;
        0, 1, 0, 1, 0;
        0, 1, 0, 1, 0;
        0, 1, 1, 1, 0];

UNO = [0, 0, 0, 1, 0;
       0, 0, 1, 1, 0;
       0, 0, 0, 1, 0;
       0, 0, 0, 1, 0;
       0, 0, 0, 1, 0;
       0, 0, 0, 1, 0;
       0, 0, 0, 1, 0];

DOS = [0, 1, 1, 1, 0;
       0, 0, 0, 1, 0;
       0, 0, 0, 1, 0;
       0, 0, 1, 0, 0;
       0, 1, 0, 0, 0;
       0, 1, 0, 0, 0;
       0, 1, 1, 1, 0];

TRES = [0, 1, 1, 1, 0;
        0, 0, 0, 1, 0;
        0, 0, 0, 1, 0;
        0, 0, 1, 1, 0;
        0, 0, 0, 1, 0;
        0, 0, 0, 1, 0;
        0, 1, 1, 1, 0];

CUATRO = [0, 1, 0, 1, 0;
          0, 1, 0, 1, 0;
          0, 1, 0, 1, 0;
          0, 1, 1, 1, 0;
          0, 0, 0, 1, 0;
          0, 0, 0, 1, 0;
          0, 0, 0, 1, 0];

CINCO = [0, 1, 1, 1, 0;
         0, 1, 0, 0, 0;
         0, 1, 0, 0, 0;
         0, 1, 1, 1, 0;
         0, 0, 0, 1, 0;
         0, 0, 0, 1, 0;
         0, 1, 1, 1, 0];

SEIS = [0, 1, 1, 1, 0;
        0, 1, 0, 0, 0;
        0, 1, 0, 0, 0;
        0, 1, 1, 1, 0;
        0, 1, 0, 1, 0;
        0, 1, 0, 1, 0;
        0, 1, 1, 1, 0];

SIETE = [0, 1, 1, 1, 0;
         0, 0, 0, 1, 0;
         0, 0, 0, 1, 0;
         0, 0, 0, 1, 0;
         0, 0, 0, 1, 0;
         0, 0, 0, 1, 0;
         0, 0, 0, 1, 0];

OCHO = [0, 1, 1, 1, 0;
        0, 1, 0, 1, 0;
        0, 1, 0, 1, 0;
        0, 1, 1, 1, 0;
        0, 1, 0, 1, 0;
        0, 1, 0, 1, 0;
        0, 1, 1, 1, 0];

NUEVE = [0, 1, 1, 1, 0;
         0, 1, 0, 1, 0;
         0, 1, 0, 1, 0;
         0, 1, 1, 1, 0;
         0, 0, 0, 1, 0;
         0, 0, 0, 1, 0;
         0, 1, 1, 1, 0];

renglones = 7;
columnas = 5;

for ren=1:renglones;
  for col=1:columnas;
      fprintf('%d ', CERO(ren, col)
INPUT = input("Introduce la matriz de 7x5:\n");
  if (INPUT==CERO);
    fprintf('%d\t La matriz es un 0');
  endif
  endfor
  fprintf('\n')
endfor

