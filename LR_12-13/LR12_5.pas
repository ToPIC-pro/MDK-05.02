program LR12_5;

var
   inputtext, outputtext: text;
   arr: array of Integer;
   i: integer;
   
begin
  assign(inputtext,'C:input.txt');
  rewrite(inputtext);

  for i:=1 to 80 do
    writeln(inputtext, random(100));
  
  close(inputtext);   
  reset(inputtext);
  
  SetLength(arr, 80);
  
  for i:=0 to 79 do
    begin
    readln(inputtext, arr[i])
    end;
  
  close(inputtext);
  
  assign(outputtext,'C:output.txt');
  rewrite(outputtext);
  
  writeln(outputtext, 'Минимальное: ', Min(arr));
  writeln(outputtext, 'Максимальное: ', Max(arr));
  
  close(outputtext);
  
  writeln('Программа выполнена!')
end.