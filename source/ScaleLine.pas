{
    TScaleLine - draws lines with scale indications
    Copyright (C) 2001  JWB Software

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

    Web:   http://people.zeelandnet.nl/famboek/scaleline/
    Email: jwbsoftware@zeelandnet.nl
}

unit ScaleLine;

interface

uses
  Controls,Math,Classes,Windows,Messages;

type
  TScaleLine = class(TCustomControl)
  private
    { Private declarations }
    FSteps: Integer;

    procedure SetSteps(Value: Integer);
  protected
    { Protected declarations }
    procedure Paint; override;

    procedure CreateParams(var Params: TCreateParams); override;
    procedure WM_ERASEBKGN(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
  public
    { Public declarations }
  published
    { Published declarations }
    property Align;
    property Anchors;
    property Steps: Integer read FSteps write SetSteps stored True default 10;

    constructor Create(AOwner: TComponent); override;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Custom', [TScaleLine]);
end;

procedure TScaleLine.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle + WS_EX_TRANSPARENT;
end;

procedure TScaleLine.WM_ERASEBKGN(var Message: TWMEraseBkgnd);
begin
  Message.Result := 1;
end;

constructor TScaleLine.Create(AOwner: TComponent);
begin
  inherited;

  ControlStyle := ControlStyle - [csOpaque];
  FSteps := 10;
end;

procedure TScaleLine.Paint;
var
  iLine, iStep, iPos, iLength: Integer;
begin
  Canvas.MoveTo(0,0);
  Canvas.LineTo(Self.Width,0);

  Canvas.MoveTo(0,0);
  Canvas.LineTo(0,Round(Height/2));

  Canvas.MoveTo(Width-1,0);
  Canvas.LineTo(Width-1,Round(Height/2));

  iPos := 0;
  iLength := 0;

  for iLine := 1 to FSteps-1 do
  begin
    iStep := Round((Self.Width-iLength) / ((FSteps+1)-iLine));
    iLength := iLength + iStep;

    iPos := iPos + iStep;
    Canvas.MoveTo(iPos,0);
    Canvas.LineTo(iPos,Round(Height/2));
  end;
end;

procedure TScaleLine.SetSteps(Value: Integer);
begin
  Visible := False;
  FSteps := Value;
  Refresh;
  Update;
  Canvas.Refresh;
  Visible := True;
end;

end.
