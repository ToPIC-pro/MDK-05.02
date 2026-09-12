program dkr1_2;
var x, y: real;
var x_1: integer;

begin
  writeln('y на участке [-9;2] с шагом 0.1: ');
  for x_1:=-90 to 20 do begin
    x := x_1 / 10;
    if x < 0 then begin
      if (-7 <= x) and (x < 0) then begin
        if (x > 0) and (sin(x) <> 0) then begin
          y := log10(x) * cos(2 * x) + log10(x) / sin(x);
          writeln('При x=', x, ' y равен ', y:0:2);
        end
        else
          writeln('При x=', x, ' y не существует');
      end
      else
      begin
        y := 2 - cos(2 * x);
        writeln('При x=', x, ' y равен ', y:0:2);
      end;
    end
    else
    begin
      if (x <> 0) and (tan(x) <> 0) then
      begin
        y := (x ** 3 / x ** (1 / 3)) * (x / tan(x));
        writeln('При x=', x, ' y равен ', y:0:2);
      end
      else
        writeln('При x=', x, ' y не существует');
    end;
  end;
end.