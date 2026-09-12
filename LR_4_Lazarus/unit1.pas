unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TCalculator }

  TCalculator = class(TForm)
    TDisplay: TEdit;
    TBack: TButton;
    TFive: TButton;
    TFour: TButton;
    TSix: TButton;
    TMultiplication: TButton;
    TReciprocal: TButton;
    TTwo: TButton;
    TOne: TButton;
    TThree: TButton;
    TMinus: TButton;
    TClearEntry: TButton;
    TZero: TButton;
    TPlus: TButton;
    TComma: TButton;
    TResult: TButton;
    TClear: TButton;
    TSquareRoot: TButton;
    TEight: TButton;
    TSeven: TButton;
    TNine: TButton;
    TDivision: TButton;
    TSquare: TButton;
    procedure TBackClick(Sender: TObject);
    procedure TClearEntryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TClearClick(Sender: TObject);
    procedure TCommaClick(Sender: TObject);
    procedure TDivisionClick(Sender: TObject);
    procedure TEightClick(Sender: TObject);
    procedure TFiveClick(Sender: TObject);
    procedure TFourClick(Sender: TObject);
    procedure TMinusClick(Sender: TObject);
    procedure TMultiplicationClick(Sender: TObject);
    procedure TNineClick(Sender: TObject);
    procedure TOneClick(Sender: TObject);
    procedure TPlusClick(Sender: TObject);
    procedure TReciprocalClick(Sender: TObject);
    procedure TResultClick(Sender: TObject);
    procedure TSevenClick(Sender: TObject);
    procedure TSixClick(Sender: TObject);
    procedure TSquareClick(Sender: TObject);
    procedure TSquareRootClick(Sender: TObject);
    procedure TThreeClick(Sender: TObject);
    procedure TTwoClick(Sender: TObject);
    procedure TZeroClick(Sender: TObject);
  private
    FirstNumber: Double;
    Operation: Char;
    NewInput: Boolean;
    const MaxDisplayLength = 15;
  public

  end;

var
  Calculator: TCalculator;

implementation

{$R *.lfm}

{ TCalculator }

procedure TCalculator.TDivisionClick(Sender: TObject);
begin
  if not TryStrToFloat(TDisplay.Text, FirstNumber) then
  begin
    TDisplay.Text := '0';
    Exit;
  end;
  Operation := '/';
  TDisplay.Text := '0';
  NewInput := True;
end;

procedure TCalculator.TEightClick(Sender: TObject);
begin
  if NewInput or (TDisplay.Text = '0') then
    TDisplay.Text := '8'
  else if Length(TDisplay.Text) < MaxDisplayLength then
    TDisplay.Text := TDisplay.Text + '8';

  NewInput := False;
end;

procedure TCalculator.TFiveClick(Sender: TObject);
begin
  if NewInput or (TDisplay.Text = '0') then
    TDisplay.Text := '5'
  else if Length(TDisplay.Text) < MaxDisplayLength then
    TDisplay.Text := TDisplay.Text + '5';

  NewInput := False;
end;

procedure TCalculator.TFourClick(Sender: TObject);
begin
  if NewInput or (TDisplay.Text = '0') then
    TDisplay.Text := '4'
  else if Length(TDisplay.Text) < MaxDisplayLength then
    TDisplay.Text := TDisplay.Text + '4';

  NewInput := False;
end;

procedure TCalculator.TMinusClick(Sender: TObject);
begin
  if not TryStrToFloat(TDisplay.Text, FirstNumber) then
  begin
    TDisplay.Text := '0';
    Exit;
  end;
  Operation := '-';
  TDisplay.Text := '0';
  NewInput := True;
end;

procedure TCalculator.TMultiplicationClick(Sender: TObject);
begin
  if not TryStrToFloat(TDisplay.Text, FirstNumber) then
  begin
    TDisplay.Text := '0';
    Exit;
  end;
  Operation := '*';
  TDisplay.Text := '0';
  NewInput := True;
end;

procedure TCalculator.TNineClick(Sender: TObject);
begin
  if NewInput or (TDisplay.Text = '0') then
    TDisplay.Text := '9'
  else if Length(TDisplay.Text) < MaxDisplayLength then
    TDisplay.Text := TDisplay.Text + '9';

  NewInput := False;
end;

procedure TCalculator.TOneClick(Sender: TObject);
begin
  if NewInput or (TDisplay.Text = '0') then
    TDisplay.Text := '1'
  else if Length(TDisplay.Text) < MaxDisplayLength then
    TDisplay.Text := TDisplay.Text + '1';

  NewInput := False;
end;

procedure TCalculator.TPlusClick(Sender: TObject);
begin
  if not TryStrToFloat(TDisplay.Text, FirstNumber) then
  begin
    TDisplay.Text := '0';
    Exit;
  end;
  Operation := '+';
  TDisplay.Text := '0';
  NewInput := True;
end;

procedure TCalculator.TReciprocalClick(Sender: TObject);
var
  s, res: Double;
begin
  if not TryStrToFloat(TDisplay.Text, s) then
  begin
    TDisplay.Text := '0';
    Exit;
  end;

  if s = 0 then
  begin
    ShowMessage('На ноль делить нельзя');
    TDisplay.Text := '0';
    NewInput := True;
    Exit;
  end;

  res := 1 / s;

  if IsInfinite(res) or IsNan(res) then
    TDisplay.Text := 'Слишком большое число'
  else
    TDisplay.Text := FloatToStr(res);

  NewInput := True;
end;

procedure TCalculator.TResultClick(Sender: TObject);
var
  SecondNumber, ResultValue: Double;
begin
  if not TryStrToFloat(TDisplay.Text, SecondNumber) then
  begin
    TDisplay.Text := '0';
    Exit;
  end;

  case Operation of
    '+': ResultValue := FirstNumber + SecondNumber;
    '-': ResultValue := FirstNumber - SecondNumber;
    '*': ResultValue := FirstNumber * SecondNumber;
    '/':
      begin
        if SecondNumber = 0 then
        begin
          ShowMessage('Деление на ноль невозможно');
          TDisplay.Text := '0';
          Operation := #0;
          NewInput := True;
          Exit;
        end;
        ResultValue := FirstNumber / SecondNumber;
      end;
    #0: Exit;
  end;

  if IsInfinite(ResultValue) or IsNan(ResultValue) then
  begin
    TDisplay.Text := 'Слишком большое число';
    FirstNumber := 0;
    Operation := #0;
    NewInput := True;
    Exit;
  end;

  TDisplay.Text := FloatToStr(ResultValue);
  FirstNumber := 0;
  Operation := #0;
  NewInput := True;
end;

procedure TCalculator.TSevenClick(Sender: TObject);
begin
  if NewInput or (TDisplay.Text = '0') then
    TDisplay.Text := '7'
  else if Length(TDisplay.Text) < MaxDisplayLength then
    TDisplay.Text := TDisplay.Text + '7';

  NewInput := False;
end;

procedure TCalculator.TSixClick(Sender: TObject);
begin
  if NewInput or (TDisplay.Text = '0') then
    TDisplay.Text := '6'
  else if Length(TDisplay.Text) < MaxDisplayLength then
    TDisplay.Text := TDisplay.Text + '6';

  NewInput := False;
end;

procedure TCalculator.TSquareClick(Sender: TObject);
var
  s, res: Double;
begin
  if not TryStrToFloat(TDisplay.Text, s) then
  begin
    TDisplay.Text := '0';
    Exit;
  end;

  res := Sqr(s);

  if IsInfinite(res) or IsNan(res) then
    TDisplay.Text := 'Слишком большое число'
  else
    TDisplay.Text := FloatToStr(res);

  NewInput := True;
end;

procedure TCalculator.TSquareRootClick(Sender: TObject);
var
  s, res: Double;
begin
  if not TryStrToFloat(TDisplay.Text, s) then
  begin
    TDisplay.Text := '0';
    Exit;
  end;

  if s < 0 then
  begin
    ShowMessage('Невозможно вычислить корень из отрицательного числа');
    TDisplay.Text := '0';
    NewInput := True;
    Exit;
  end;

  res := Sqrt(s);

  if IsInfinite(res) or IsNan(res) then
    TDisplay.Text := 'Слишком большое число'
  else
    TDisplay.Text := FloatToStr(res);

  NewInput := True;
end;

procedure TCalculator.TThreeClick(Sender: TObject);
begin
  if NewInput or (TDisplay.Text = '0') then
    TDisplay.Text := '3'
  else if Length(TDisplay.Text) < MaxDisplayLength then
    TDisplay.Text := TDisplay.Text + '3';

  NewInput := False;
end;

procedure TCalculator.TTwoClick(Sender: TObject);
begin
  if NewInput or (TDisplay.Text = '0') then
    TDisplay.Text := '2'
  else if Length(TDisplay.Text) < MaxDisplayLength then
    TDisplay.Text := TDisplay.Text + '2';

  NewInput := False;
end;

procedure TCalculator.TZeroClick(Sender: TObject);
begin
  if NewInput or (TDisplay.Text = '0') then
    TDisplay.Text := '0'
  else if Length(TDisplay.Text) < MaxDisplayLength then
    TDisplay.Text := TDisplay.Text + '0';

  NewInput := False;
end;

procedure TCalculator.FormCreate(Sender: TObject);
begin
  TDisplay.Text := '0';
  NewInput := True;
  SetExceptionMask(GetExceptionMask + [exOverflow, exInvalidOp, exZeroDivide]);
end;


procedure TCalculator.TBackClick(Sender: TObject);
var
  s: string;
begin
  s := TDisplay.Text;

  if not NewInput then
  begin
    if Length(s) > 1 then
      Delete(s, Length(s), 1)
    else
    begin
      s := '0';
      NewInput := True;
    end;
  end;

  TDisplay.Text := s;
end;

procedure TCalculator.TClearEntryClick(Sender: TObject);
begin
  TDisplay.Text := '0';
  NewInput := True;
end;

procedure TCalculator.TClearClick(Sender: TObject);
begin
  TDisplay.Text := '0';
  FirstNumber := 0;
  Operation := #0;
  NewInput := True;
end;

procedure TCalculator.TCommaClick(Sender: TObject);
begin
  if NewInput then
  begin
    TDisplay.Text := '0,';
    NewInput := False;
  end
  else if (Pos(',', TDisplay.Text) = 0) and (Length(TDisplay.Text) < MaxDisplayLength) then
    TDisplay.Text := TDisplay.Text + ',';
end;

end.
