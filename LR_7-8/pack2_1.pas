program pack2_1;
var
  stroka: string;
  i, count_plus, count_minus, count_null: integer;

begin
  writeln('Введите строку');
  readln(stroka);
  for i:=1 to Length(stroka) do
    begin
    if stroka[i] = '+' then
      count_plus := count_plus + 1;
    if stroka[i] = '-' then
      count_minus := count_minus + 1;
    if i < Length(stroka) then
      begin
      if (stroka[i]+stroka[i+1] = '+0') or (stroka[i]+stroka[i+1] = '-0') then
        count_null := count_null + 1;
      end;
    end;
    writeln('Количество + в строке: ', count_plus);
    writeln('Количество - в строке: ', count_minus);
    writeln('Количество + и -, после которых следует 0 в строке: ', count_null);
end.