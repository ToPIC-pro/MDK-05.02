program LR11_1;
uses GraphABC;

begin
  Circle(150, 200, 40);
  FloodFill(150, 200, clred);
  
  Line(190, 200, 350, 120);
  Line(350, 120, 510, 200);
  Line(510, 200, 190, 200);
  FloodFill(350, 180, clblue);
  
  Line(190, 200, 350, 280);
  Line(350, 280, 510, 200);
  FloodFill(350, 260, cllime);
  
  Circle(550, 200, 40);
  FloodFill(550, 200, clyellow); 
end.