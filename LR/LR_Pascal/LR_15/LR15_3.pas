function stepen (a,b: integer):integer; // параметризация
  begin
  if b < 1 then // база рекурсии
    a := 1
  else
    a := a * (stepen(a, b-1)); // декомпозиция
  stepen := a
  end;
    
begin
  writeln('Число?');
  var x := ReadInteger;
  writeln('Степень?');
  var y := ReadInteger;
  writeln(stepen(x,y));
end.