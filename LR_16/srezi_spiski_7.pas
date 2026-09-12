program srezi_spiski_7;

var 
  n, index_max_el, i, el: integer;
  
begin
  writeln('Введите размер списка');
  readln(n);
  var L := new List<integer>;
  
  writeln('Введите элементы массива в разные строки');
  for i:=1 to n do
  begin
    readln(el);
    L += el
    end;
   
  index_max_el := L.IndexMax;
   
  L.RemoveAt(index_max_el);
  
  L.Println;
   
 end. 