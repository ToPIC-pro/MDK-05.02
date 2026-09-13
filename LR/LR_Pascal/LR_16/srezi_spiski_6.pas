program srezi_spiski_6;

var 
  arr: array of Integer;
  n: integer;
  
begin
  writeln('Введите размер массива');
  readln(n);
  SetLength(arr, n);
  arr := arrrandominteger(n, -5, 20);
  
    
  var L1 := new List<integer>;
  var L2 := new List<integer>;
  
  foreach var x in arr do
    begin
    if x >= 0 then
      L1 += x
    else
      L2 += x
    end;
   
   println(arr);
   L1.println;
   L2.println;
   
 end. 