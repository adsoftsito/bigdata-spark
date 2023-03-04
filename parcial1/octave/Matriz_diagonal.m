A = [0, 1, 2, 3;
     4, 5, 6, 7;
     8, 9, 10, 11;
     12, 13, 14, 15];

renglones = 4;
columnas = 4;

% impresion de matrix con for

for ren=1:renglones;
  for col=1:columnas;
    if (col==ren)
      diagonal= A(ren,col);
    fprintf('%d\t', diagonal)
    endif
  endfor
  fprintf('\n')
endfor
