program LR11_0;
uses GraphABC;

begin
  SetPenColor(clMoneyGreen);
  
  // Квадрат
  MoveTo(200, 200);
  LineTo(150, 200);
  LineTo(150, 150);
  LineTo(200, 150);
  LineTo(200, 200);
  
  // Равносторонний треугольник
  MoveTo(250, 200);    
  LineTo(300, 113);  
  LineTo(350, 200);   
  LineTo(250, 200);     
end.