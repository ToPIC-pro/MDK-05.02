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
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var a, b:integer;
f:real;
begin
  a:=strtoint(edit1.text);
  b:=strtoint(edit2.text);
  f:=sqrt(Pi/8)*sqrt(sqrt(a+b)/(a*a+b*b))-a*power(b,3);
  edit3.text:=floattostr(f);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  edit1.text:='';
  edit2.text:='';
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.

