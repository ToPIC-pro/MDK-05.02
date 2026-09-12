program pack3_1;
var
  stroka: string;
  i: integer;

begin
  writeln('Введите строку');
  readln(stroka);
  if Length(stroka) > 10 then
    Delete(stroka, 7, Length(stroka)-6)
  else
    stroka := stroka + 'o' * (12 - Length(stroka)) ;  
  writeln(stroka);
end.