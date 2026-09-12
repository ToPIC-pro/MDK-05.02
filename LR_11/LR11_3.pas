program LR11_3;
uses GraphABC;
var i: integer;

begin
  i := 0;
  while i <= 290 do
    begin
    Circle(50+i, 100, 10);
    FloodFill(50+i, 100, rgb(random(256), random(256), random(256)));
    i += 30;
    end;
end.