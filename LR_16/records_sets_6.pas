program records_sets_6;

type t_chs = set of Char;
const
  lett: t_chs = ['a'..'z','A'..'Z','_'];
  num: t_chs = ['0'..'9'];
var
  str: string;
  i: byte;
  flag: boolean;
  
begin
  writeln('Введите строку');
  readln(str);
  
  flag := True;
  
  if str[1] in lett then
    for i:=2 to length(str) do
      begin
      if (str[i] in lett) or (str[i] in num) then
        flag := true
      else
        flag := false
      end
      
  else
    flag := false;
  
  writeln(flag)
 
end.