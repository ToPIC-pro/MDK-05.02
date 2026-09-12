program pack3_4;
var a, b, c, D, x1, x2: real;
begin
  writeln('Введите коэффициенты a, b, c: ');
  readln(a, b, c);
  D := b ** 2 - 4 * a * c;
  if D >= 0 then
    if D > 0 then
      begin
      x1 := (-b + sqrt(D)) / (2 * a);
      x2 := (-b - sqrt(D)) / (2 * a);
      write('x1 = ', x1, ', x2 = ', x2)
      end
    else
      begin
      x1 := (-b) /(2 * a);
      write('x = ', x1);
      end
  else
    write('Корней нет')     
end.