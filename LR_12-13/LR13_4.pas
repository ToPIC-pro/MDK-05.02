program LR13_4;

var
  f: file of real;
  n, i: integer;
  r, summa: real;
  
begin
  assign(f, 'C:LR13_4.txt');
  rewrite(f); 
  
  writeln('Сколько чисел будет в файле?');
  readln(n);
  
  for i := 1 to n do
  begin
    read(r);
    write(f, r);
  end;
  
  close(f);
  reset(f);
  
  summa := 0;
  i := 1;
  while not Eof(f) do
  begin
    read(f, r);
    if i mod 2 = 0 then
      summa += r;
    i += 1;
  end;
      
  close(f);
  writeln('Сумма четных элементов равна ', summa);
end.