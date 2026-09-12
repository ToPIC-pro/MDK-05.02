unit SelectFieldUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type
  TfSelectField = class(TForm)
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    cbField: TComboBox;
    Label1: TLabel;
  private
  public
  end;

implementation

{$R *.lfm}

end.
