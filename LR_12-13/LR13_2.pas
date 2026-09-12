program LR13_2;

var
  f1, f2: text;
  s: string;
  i, j, n, max_len: integer;
  arr: array of string;
    
begin
  assign(f1, 'C:LR13_2_one.txt');
  rewrite(f1); 
  
  writeln('Сколько строк будет в файле?');
  readln(n);
  
  max_len := 0;
  writeln('Введите строки');
  for i:=1 to n do
    begin
    readln(s);
    writeln(f1, s);
    if length(s) > max_len then
      max_len := length(s)
    end;
  
  close(f1);
  reset(f1);
  
  i := 0;
  while not eof(f1) do
    begin
    readln(f1, s);
    if max_len = length(s) then
      begin
      i += 1;
      SetLength(arr, i);
      arr[i-1] := s;
      end;
    end;

  close(f1);
  assign(f2, 'C:LR13_2_two.txt');
  rewrite(f2);
  
  for j:=i-1 downto 0 do
    writeln(f2, arr[j]);
    
  close(f2);
  writeln('Программа завершена')  
end.