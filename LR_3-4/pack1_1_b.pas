program pack1_1_b;
var a, b, x, y: integer;
begin
  writeln('Введите левую границу отрезка');
  readln(a);
  writeln('Введите правую границу отрезка');
  readln(b);
  for x:=a to b do begin
    y := 2 * x + 1;
    writeln(y);
  end;
end.