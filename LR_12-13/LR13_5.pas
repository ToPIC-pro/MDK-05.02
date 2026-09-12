program LR13_4;

var
  f: file of real;
  n, i: integer;
  r, r1, r2, local_max: real;
  
begin
  assign(f, 'C:LR13_5.txt');
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

  local_max := 0;
  
  for i:=1 to filesize(f)-2 do
    begin
    seek(f, i);
    read(f, r);
    seek(f, i-1);
    read(f, r1);
    seek(f, i+1);
    read(f, r2);
    if (r < r2) and (r > r1) then
      local_max := r;
    end;
    
    close(f);
    
    if local_max <> 0 then
      writeln('Последний локальный максимум равен ', local_max)
    else
      writeln('Локальный максимум отсутствует (в файле меньше 3 элементов)')
end.