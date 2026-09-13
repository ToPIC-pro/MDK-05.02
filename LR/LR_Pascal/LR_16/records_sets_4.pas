program records_sets_4;

type zap3 = record
  name: string[50];
  price: string[20];
  age: string[20];
end;

var
  toys:array[1..3] of zap3;
  f: file of zap3;
  s: string;
  t: zap3;


begin
  assign(f, 'toys.txt');
  rewrite(f);
  
  with toys[1] do
  begin
    name:='Lego Technic "Lamborghini Aventador SVJ"';
    price:='400$';
    age:='16+ years';   
  end;
  write(f, toys[1]);
  
  with toys[2] do
  begin
    name:='Slime';
    price:='2$';
    age:='6-12 years';   
  end;
  write(f, toys[2]);
  
  with toys[3] do
  begin
    name:='Lego DUPLO';
    price:='100$';
    age:='3-4 years';   
  end;
  write(f, toys[3]);
  
  reset(f);
  
  while not Eof(f) do
    begin
    Read(f, t);
    writeln(t)
    end;
    
  close(f);
end.