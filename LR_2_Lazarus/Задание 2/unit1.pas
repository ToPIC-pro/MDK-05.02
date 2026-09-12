unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  S: integer;
  a, d, S1: real;
begin
  S:=StrToInt(edit1.text);
  a:=sqrt(S);
  d:=a*sqrt(2);
  S1:=Pi*(a*a)/2;
  label2.caption:='Сторона квадрата (a) := '+FloatToStr(a);
  label3.caption:='Диагональ квадрата (d) := '+FloatToStr(d);
  label4.caption:='Площадь описанного круга (S1) := '+FloatToStr(S1);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  label2.caption:='Сторона квадрата (a) := ';
  label3.caption:='Диагональ квадрата (d) := ';
  label4.caption:='Площадь описанного круга (S1) := ';
  edit1.text:='';
end;

end.

