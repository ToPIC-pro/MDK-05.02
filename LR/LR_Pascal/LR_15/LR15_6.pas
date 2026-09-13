var count := 0;
procedure fib (i,n: integer); // параметризация
var z: integer;
  begin
       count := count + 1; 
       println(i+n,' ');
       z := i;
       i := n;
       n := z+n;
       if count < 10 then // база рекурсии
           fib(i,n) // декомпозиция
  end;
begin
  fib(0,1);
  print
end.