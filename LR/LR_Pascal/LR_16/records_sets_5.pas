program records_sets_5;


var
  god, goda, let: set of byte;
  year: byte;
  
begin
  god := [1];
  goda := [2, 3, 4];
  let := [5, 6, 7, 8, 9, 0];
  
  writeln('Введите количество лет');
  readln(year);
  
  if year mod 100 in [11..14] then
    writeln(year, ' лет')
  
  else if year mod 10 in god then
    writeln(year, ' год')

  else if year mod 10 in goda then
    writeln(year, ' года')

  else if year mod 10 in let then
    writeln(year, ' лет')
  
end.