program pack4_5;
var l1, l2, d1, d2: real;
begin
  writeln('Введите координаты ладьи: ');
  readln(l1, l2);
  writeln('Введите координаты другой фигуры: ');
  readln(d1, d2);
  if (l1 = d1) or (l2 = d2) then 
    writeln('Бьёт')
  else
    writeln('Не бьёт')         
end.