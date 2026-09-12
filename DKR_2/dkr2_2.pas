program dkr2_2;
var
  stroka, substroka, itog_stroka: string;
  i, j, index: integer;
  found: boolean;

begin
  writeln('Введите строку');
  readln(stroka);
  writeln('Введите подстроку, которую нужно инверсировать');
  readln(substroka);
  itog_stroka := '';
  index := 0;
  
  i := 1;
  while i <= Length(stroka) do
  begin
    if (Length(stroka) - i + 1) >= Length(substroka) then
    begin
      index := i;
      found := True;
      for j:=1 to Length(substroka) do
        if stroka[i + j - 1] <> substroka[j] then
          found := False;     
      if found then break;
    end;
    i := i + 1;
  end;
  
  if found then
    begin
    i := 1;
    while i <= Length(stroka) do
      begin
      if i = index then
      begin
        for j:=0 to Length(substroka) - 1 do
          begin
          itog_stroka += substroka[Length(substroka) - j];
          i += 1
          end;
      end
      else
        itog_stroka += stroka[i];
      i += 1;
      end;
    writeln(itog_stroka)
    end
  else
    writeln('Данной подстроки нет в строке');
end.