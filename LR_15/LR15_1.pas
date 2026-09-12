program rec1;
procedure posled(n:integer); // параметризация
begin
  if n >= 0 then begin // база рекурсии
      write (n, ' ');
      posled(n-2) // декомпозиция
  end;
end;
begin
  var n := ReadInteger;
  posled(n);
end.
  



