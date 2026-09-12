program LR11_5;
uses GraphABC;
var i: integer;

begin
  for i:=1 to 8 do
    begin
    Circle(50+i*60, 50+i*40, 10+i*10);
    FloodFill(50+i*60, 50+i*40, clRandom)
    end;
end.