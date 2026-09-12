program LR13_7;

var
  f: file of char;
  n, i: integer;
  c: char;
  
begin
  assign(f, 'C:LR13_7.txt');
  rewrite(f); 
  
  writeln('Сколько символов будет в файле?');
  readln(n);
  
  for i := 1 to n do
  begin
    read(c);
    write(f, c);
  end;
  
  close(f);
  reset(f);
  
  // Замена символов на четных позициях на '!'
  i := 1;
  while i < FileSize(f) do
  begin
    seek(f, i);
    write(f, '!');
    i += 2;
  end;
  
  // Вывод результата
  reset(f);
  writeln('Содержимое файла после изменений:');
  while not Eof(f) do
  begin
    read(f, c);
    write(c);
  end;
  
  close(f);
end.