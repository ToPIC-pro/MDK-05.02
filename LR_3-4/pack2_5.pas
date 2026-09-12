program pack2_5;
var N, V: real;
begin
  writeln('Количество шаров в стороне основания: ');
  readln(N);
  N := N + 1;
  while N > 1 do begin
    N := N - 1;
    V := V + N * N;
  end;
  write('Шаров нужно: ', V);
end.