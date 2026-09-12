unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ListBox1: TListBox;
    Memo1: TMemo;
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

procedure TForm1.Button1Click(Sender: TObject);
var weather, mood: String;
begin
  if (ListBox1.ItemIndex <> -1) and (ComboBox1.ItemIndex <> -1) then begin
    weather := ListBox1.Items.Strings[ListBox1.ItemIndex];
    mood := ComboBox1.Items.Strings[ComboBox1.ItemIndex];

    Memo1.Lines.Add('['+DateToStr(Date)+' '+TimeToStr(Time)+'] '+'Настроение: '+mood+' | Погода: '+weather)
  end
  else
    ShowMessage('Выберите вариант из списка!')

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.

