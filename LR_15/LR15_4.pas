procedure LoopFor(i, n: integer); // параметризация
begin
  if i < n + 1 then begin // база рекурсии
    write('Привет ');
    println()(i);
    LoopFor(i + 1, n) // декомпозиция
  end;
end;
begin
  LoopFor(1,10);                    
end.