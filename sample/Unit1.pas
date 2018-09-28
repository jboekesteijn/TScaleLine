unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScaleLine;

type
  TForm1 = class(TForm)
    ScaleLine1: TScaleLine;
    ScaleLine2: TScaleLine;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ScaleLine2.Steps := ScaleLine2.Steps+ 1;
end;

end.
