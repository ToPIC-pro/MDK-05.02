program pack4_3;
var count, sp, i: integer;
var norma, res, res_max: real;
var familia, familia_max: string;
begin
  writeln('Введите количество участников');
  readln(sp);
  writeln('Введите норму');
  readln(norma);
  res_max := 0;
  count := 0;
  for i:=1 to sp do begin
    writeln('Введите фамилию участника');
    readln(familia);
    writeln('Введите результат');
    readln(res);
    if res > res_max then begin
      res_max := res;
      familia_max := familia
    end;
    if res >= norma then
      count := count + 1;
  end;
  writeln('Норму выполнили ', count, ' человек.');
  writeln('Максимальный результат: ', familia_max, ' с результатом ', res_max);
end.
