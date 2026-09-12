program records_sets_3;

type zap2 = record
  name: string;
  price: string;
  age: string;
end;

var toys:array[1..3] of zap2;

begin
  
  with toys[1] do
  begin
    name:='Lego Technic "Lamborghini Aventador SVJ"';
    price:='400$';
    age:='16+ years';   
  end;
  
  with toys[2] do
  begin
    name:='Slime';
    price:='2$';
    age:='6-12 years';   
  end;
  
  with toys[3] do
  begin
    name:='Lego DUPLO';
    price:='100$';
    age:='3-4 years';   
  end;
  
  toys.println
end.