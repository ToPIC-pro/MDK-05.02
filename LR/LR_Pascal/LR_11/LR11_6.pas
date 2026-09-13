program LR11_6;
uses GraphABC;
var
  i, j: integer;
  h: real;

begin
  h := (400 - 200) / 9;

  for i := 0 to 8 do
  begin
    Line(round(200 + h * i), 100, round(200 + h * i), 277);
    Line(200, round(100 + h * i), 377, round(100 + h * i));
  end;

  for i := 0 to 7 do
    for j := 0 to 7 do
      if (i + j) mod 2 = 1 then 
        FloodFill(round(200 + h * i + h / 2), round(100 + h * j + h / 2), clblack);
end.