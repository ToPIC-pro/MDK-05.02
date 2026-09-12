program LR12_6;

var
  filetext, temptext: text;
  i, K, count: integer;
  line: string;
  
begin
  assign(filetext, 'C:text.txt');
  reset(filetext);
  assign(temptext, 'C:temptext.txt');
  rewrite(temptext);
  
  while not Eof(filetext) do
  begin
    readln(filetext, line);   
    if line <> '' then
      writeln(temptext, line); 
  end;
  
  close(filetext);
  close(temptext);
  erase(filetext);
  rename(temptext, 'C:text.txt');
  
  writeln('Все пустые строки успешно удалены');
end.