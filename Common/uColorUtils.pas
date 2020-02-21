unit uColorUtils;

interface

uses
  Winapi.Windows,
  Vcl.Graphics;

function Darker(Color: TColor; Percent: Byte): TColor;
function Lighter(Color: TColor; Percent: Byte): TColor;

implementation

function Darker(Color: TColor; Percent: Byte): TColor;
var
  r, g, b: Byte;
begin
  Color := ColorToRGB(Color);
  r := GetRValue(Color);
  g := GetGValue(Color);
  b := GetBValue(Color);
  //процент% уменьшени€ €ркости
  r := r - muldiv(r, Percent, 100);
  g := g - muldiv(g, Percent, 100);
  b := b - muldiv(b, Percent, 100);
  result := RGB(r, g, b);
end;

function Lighter(Color: TColor; Percent: Byte): TColor;
var
  r, g, b: Byte;
begin
  Color := ColorToRGB(Color);
  r := GetRValue(Color);
  g := GetGValue(Color);
  b := GetBValue(Color);
  //процент% увеличени€ €ркости
  r := r + muldiv(255 - r, Percent, 100);
  g := g + muldiv(255 - g, Percent, 100);
  b := b + muldiv(255 - b, Percent, 100);
  result := RGB(r, g, b);
end;

end.
