A = [0, 1, 2, 3, 4;
     5, 6, 7, 8, 9;
     10, 11, 12, 13, 14;
     15, 16, 17, 18, 19;
     20, 21, 22, 23, 24];

renglones = 5;
columnas = 5;

% impresion de matrix con for

for ren=1:renglones;
  for col=1:columnas;
    if (col<ren)
      fprintf('%d \t', A(ren,col)*0);
    else
      fprintf('%d\t', A(ren, col));
    endif
  endfor
  fprintf('\n')
endfor
