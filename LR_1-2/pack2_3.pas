program pack2_3;
var a, a1, a2, a3: integer;
begin
  writeln('Введите трехзначное число: ');
  readln(a);
  a1 := a div 100;
  a2 := ((a div 10) mod 10) * 10;
  a3 := (a mod 10) * 100;
  write('Разность равна ', a - (a1 + a2 + a3));
end.