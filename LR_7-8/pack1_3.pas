program pack1_3;
var stroka: string;

begin
  writeln('Введите строку');
  readln(stroka);
  if Length(stroka) mod 2 <> 0 then
    begin
    writeln('Первый символ - ', stroka[1]);
    writeln('Средний символ - ', stroka[Length(stroka) div 2 + 1]);
    writeln('Последний символ - ', stroka[Length(stroka)]);
    end
  else
    begin
    writeln('Первый символ - ', stroka[1]);
    writeln('Последний символ - ', stroka[Length(stroka)]);
    end
end.