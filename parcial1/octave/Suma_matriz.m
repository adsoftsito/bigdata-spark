A = [1, 2;
     1, 1];

B = [1, 1;
     1, 1];

renglones = 2;
columnas = 2;

% impresion de matrix con for

for ren=1:renglones;
  for col=1:columnas;
    C(ren, col) = A(ren, col) + B(ren, col);
    fprintf('%d\t', C(ren, col))
  endfor
  fprintf('\n')
endfor
