unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TSelectFiledUnit }

  TSelectFiledUnit = class(TForm)
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    cbField: TComboBox;
    LSort: TLabel;
  private

  public

  end;

var
  SelectFiledUnit: TSelectFiledUnit;

implementation

{$R *.lfm}

end.

