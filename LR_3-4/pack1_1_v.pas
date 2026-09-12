program pack1_1_v;
var a, b, x, y, h: integer;
begin
  writeln('Введите левую границу отрезка');
  readln(a);
  writeln('Введите правую границу отрезка');
  readln(b);
  writeln('Введите шаг');
  readln(h);  
  for x:=a to b step h do begin
    y := 2 * x + 1;
    writeln(y);
  end;
end.