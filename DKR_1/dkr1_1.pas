program dkr1_1;
var x, y: real;

begin
  writeln('Введите x: ');
  readln(x);
  if x < 0 then begin
    if (-7 <= x) and (x < 0) then begin
      if (x > 0) and (sin(x) <> 0) then begin
        y := log10(x) * cos(2 * x) + log10(x) / sin(x);
        writeln(y:0:2);
      end
      else
        writeln('y не существует');
    end
    else
    begin
      y := 2 - cos(2 * x);
      writeln(y:0:2);
    end;
  end
  else
  begin
    if (x <> 0) and (tan(x) <> 0) then
    begin
      y := (x ** 3 / x ** (1 / 3)) * (x / tan(x));
      writeln(y:0:2);
    end
    else
      writeln('y не существует');
  end;
end.