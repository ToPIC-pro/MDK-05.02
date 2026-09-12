program LR12_4;

var
  filetext, temptext: text;
  i, K, count: integer;
  line: string;
  
begin
  assign(filetext, 'C:text.txt');
  reset(filetext);
  assign(temptext, 'C:temptext.txt');
  rewrite(temptext);
  
  writeln('Введите номер строки');
  readln(K);
  
  count := 0;
  while not Eof(filetext) do
  begin
    count += 1;
    readln(filetext, line);
    
    if count = K then
      writeln(temptext, ''); 
    
    writeln(temptext, line); 
  end;
  
  close(filetext);
  close(temptext);
  erase(filetext);
  rename(temptext, 'C:text.txt');
  
  writeln('Пустая строка вставлена перед строкой ', K);
end.
