program LR11_2;
uses GraphABC;

begin
  Line(200, 250, 380, 250);
  
  // Левый треугольник
  Line(200, 250, 125, 100);
  Line(125, 100, 263, 190);
  Line(250, 250, 263, 190);
  FloodFill(240, 190, clblue);
  Circle(125, 100, 20);
  FloodFill(125, 100, clblue);
  
  
  // Правый треугольник
  Line(380, 250, 455, 100);
  Line(455, 100, 317, 190);
  Line(317, 190, 330, 250);
  FloodFill(360, 230, cllime);
  Circle(455, 100, 20);
  FloodFill(455, 100, cllime);
  
  // Центральный треугольник
  Line(250, 250, 290, 65);
  Line(290, 65, 330, 250);
  FloodFill(290, 100, clred);
  Circle(290, 65, 20);
  FloodFill(290, 65, clred);
end.