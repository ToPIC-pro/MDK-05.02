function NOD(a, b: integer): integer; // параметризация
begin
  if b = 0 then // база рекурсии
   NOD:= a
  else
    NOD:=NOD(b, a mod b); // декомпозиция
end;
begin
  print('НОД(3430, 1365) = ', NOD(3430, 1365));
end.