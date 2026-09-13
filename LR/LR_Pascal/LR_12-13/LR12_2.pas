program LR12_2;

var
   filetext: text;
   a: string;
   i, N, K: integer;
   
begin
  assign(filetext,'C:text.txt');
  rewrite(filetext);
   
  writeln('Введите количество строк');
  readln(N);
  writeln('Введите количество символов в строке');
  readln(K);
  
  for i:=1 to N do
    begin
    writeln(filetext, '*'*K);
    end;
    
  close(filetext);   
//  reset(filetext);
//  
//  for i:=1 to N do
//    begin
//    readln(filetext, a);   // отображение на экран, но в задании не было
//    writeln(a);
//    end;
end.