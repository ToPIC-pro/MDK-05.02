program LR13_3;

var
  f_start, f_even, f_odd: file of real;
  n, i: integer;
  r: real;
  
begin
  assign(f_start, 'C:LR13_3_start.txt');
  rewrite(f_start); 

  
  writeln('Сколько чисел будет в файле?');
  readln(n);
  
  for i:=1 to n do
    begin
    read(r);
    write(f_start, r);
    end;
    
  close(f_start);
  reset(f_start);
  
  assign(f_even, 'C:LR13_3_even.txt');
  rewrite(f_even); 
  assign(f_odd, 'C:LR13_3_odd.txt');
  rewrite(f_odd);
  
  i := 1;
  while not Eof(f_start) do
    begin
    if i mod 2 = 0 then
      begin
      read(f_start, r);
      write(f_even, r)
      end
    else
      begin
      read(f_start, r);
      write(f_odd, r);
      end; 
    i += 1;
    end;
  
  close(f_even);
  close(f_odd);
  writeln();
  
 
  writeln('Содержимое файла с нечетными номерами:');
  reset(f_odd);
  while not Eof(f_odd) do
  begin
    read(f_odd, r);
    write(r:0:2, ' ');
  end;
  writeln;
  
  writeln('Содержимое файла с четными номерами:');
  reset(f_even);
  while not Eof(f_even) do
  begin
    read(f_even, r);
    write(r:0:2, ' ');
  end;
  writeln;
  
end.