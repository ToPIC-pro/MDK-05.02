program LR12_7;

var
  infiletext, outfiletext: text;
  i, j, n, summa, count: integer;
  
begin
  assign(infiletext, 'C:z3.in');
  reset(infiletext);
  assign(outfiletext, 'C:z3.out');
  rewrite(outfiletext);
  
  readln(infiletext, n);
  
  summa := 0;
  for i:=1 to n do
    begin
    count := 0;
    for j:=1 to i do
      begin
      if i mod j = 0 then
        count += 1  
      end;
    if count = 5 then
      summa += i;
    end;
  
  writeln(outfiletext, summa);
  close(infiletext);
  close(outfiletext);
  
  writeln('Программа выполнена')
end.