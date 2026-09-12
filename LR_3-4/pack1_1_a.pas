program pack1_1_a;
var x_1: integer;
var x, y: real;
begin
  for x_1:= 25 to 0 step -5 do begin
    x := x_1 / 10;
    y := 2 * x + 1;
    writeln(y)
  end;
end.