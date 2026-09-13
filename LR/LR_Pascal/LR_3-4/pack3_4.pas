program pack3_4;
var d, t: real;
var N, count, i, N_1: integer;
begin
  writeln('Введите количество деталей');
  readln(N);
  N_1 := N;
  repeat
    N := N - 1;
    writeln('Введите диаметр детали: ');
    readln(d);
    if (d > 4) and (d < 5) then
      count := count + 1 ; 
  until N = 0;
  t := (count / N_1) * 100;
  writeln('Процент брака равен ', t, '%');
end.