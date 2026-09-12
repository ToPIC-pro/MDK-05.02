program LR11_4;
uses GraphABC;
var i: integer;

begin
  for i:=0 to 125  step 5 do 
    begin
    Circle(200, 200, 130-i);
    end;
end.