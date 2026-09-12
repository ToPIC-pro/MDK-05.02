function sumTo(n: integer): integer; // параметризация
  begin
  if n = 1 then // база рекурсии
    n := 1
  else
    n := n + (sumTo(n-1)); // декомпозиция
  sumTo := n
  end;
  
var x := ReadInteger('Число?');
begin
writeln(sumTo(x));
print;
end.