program LR12_3;

var
  filetext: text;
  S: string;
  i: integer;
  
begin
  assign(filetext,'C:text.txt');
  append(filetext);          
  
  writeln('Введите строку');
  readln(S);
  
  writeln(filetext, S);      
  close(filetext);
  
  writeln('Строка добавлена в конец файла');
end.
  