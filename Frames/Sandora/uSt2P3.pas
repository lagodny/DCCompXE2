{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2005 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit uSt2P3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, aCustomOPCSource, aOPCSource, aOPCTCPSource, aOPCDataObject,
  aOPCImage, aOPCImageList, ExtCtrls, StdCtrls, aOPCLabel,
  aOPCProvider, aOPCLookupList, aOPCGauge,
  uOPCFrame, GIFImage;

type
  TSt2P3 = class(TaOPCFrame)
    Image1: TImage;
    OPCImageListPipe: TaOPCImageList;
    aOPCImage1: TaOPCImage;
    OPCImageValve: TaOPCImageList;
    V806Out2: TaOPCImage;
    aOPCImage3: TaOPCImage;
    aOPCImage4: TaOPCImage;
    aOPCImage5: TaOPCImage;
    aOPCImage6: TaOPCImage;
    aOPCImage7: TaOPCImage;
    aOPCImage8: TaOPCImage;
    Sw11: TaOPCImage;
    Sw15: TaOPCImage;
    Sw13: TaOPCImage;
    Sw21: TaOPCImage;
    aOPCImage13: TaOPCImage;
    aOPCImage14: TaOPCImage;
    aOPCImage15: TaOPCImage;
    V806Out1: TaOPCImage;
    V802Out1: TaOPCImage;
    V802Input: TaOPCImage;
    aOPCImage19: TaOPCImage;
    aOPCImage20: TaOPCImage;
    aOPCImage21: TaOPCImage;
    V864In: TaOPCImage;
    V803In: TaOPCImage;
    aOPCImage24: TaOPCImage;
    V821Out: TaOPCImage;
    aOPCImage26: TaOPCImage;
    aOPCImage27: TaOPCImage;
    Sw12: TaOPCImage;
    V806In: TaOPCImage;
    V807In: TaOPCImage;
    V801Out2: TaOPCImage;
    aOPCImage32: TaOPCImage;
    V92IN: TaOPCImage;
    V807Out: TaOPCImage;
    aOPCImage35: TaOPCImage;
    aOPCImage36: TaOPCImage;
    V802Out2: TaOPCImage;
    V828Out: TaOPCImage;
    V803Out: TaOPCImage;
    aOPCImage40: TaOPCImage;
    aOPCImage41: TaOPCImage;
    aOPCImage42: TaOPCImage;
    aOPCImage43: TaOPCImage;
    V801Out1: TaOPCImage;
    V801In: TaOPCImage;
    aOPCImage46: TaOPCImage;
    V865Out: TaOPCImage;
    V865In: TaOPCImage;
    V812Out: TaOPCImage;
    V862Out: TaOPCImage;
    V862In: TaOPCImage;
    V812In: TaOPCImage;
    Sw2: TaOPCImage;
    Sw1: TaOPCImage;
    Sw14: TaOPCImage;
    Sw16: TaOPCImage;
    Sw22: TaOPCImage;
    aOPCImage58: TaOPCImage;
    aOPCImage59: TaOPCImage;
    Input3: TaOPCImage;
    aOPCImage61: TaOPCImage;
    V801: TaOPCImage;
    V802: TaOPCImage;
    V806: TaOPCImage;
    V807: TaOPCImage;
    aOPCImage66: TaOPCImage;
    aOPCImage67: TaOPCImage;
    aOPCImage68: TaOPCImage;
    aOPCImage69: TaOPCImage;
    V827: TaOPCImage;
    V92: TaOPCImage;
    v821: TaOPCImage;
    V812: TaOPCImage;
    V862: TaOPCImage;
    V865: TaOPCImage;
    V832: TaOPCImage;
    aOPCImage77: TaOPCImage;
    V803: TaOPCImage;
    V828: TaOPCImage;
    V864: TaOPCImage;
    TT711: TaOPCLabel;
    TT815: TaOPCLabel;
    TT863: TaOPCLabel;
    TT813: TaOPCLabel;
    TT833: TaOPCLabel;
    ModeProvider: TaOPCProvider;
    VT712: TaOPCProvider;
    cbVT712: TCheckBox;
    aOPCLabel1: TaOPCLabel;
    aOPCLabel2: TaOPCLabel;
    aOPCLabel3: TaOPCLabel;
    aOPCLabel4: TaOPCLabel;
    aOPCLabel5: TaOPCLabel;
    aOPCLabel6: TaOPCLabel;
    aOPCLabel7: TaOPCLabel;
    aOPCLabel8: TaOPCLabel;
    aOPCLabel9: TaOPCLabel;
    aOPCLabel10: TaOPCLabel;
    aOPCLabel11: TaOPCLabel;
    aOPCLabel12: TaOPCLabel;
    llOperator: TaOPCLookupList;
    llProduct: TaOPCLookupList;
    Shape1: TShape;
    Shape2: TShape;
    HR7000: TaOPCProvider;
    CheckBox15: TCheckBox;
    aOPCGauge1: TaOPCGauge;
    aOPCLabel13: TaOPCLabel;
    OPCImageList: TaOPCImageList;
    T1: TaOPCImage;
    T2: TaOPCImage;
    ContFillT1: TaOPCGauge;
    ContFillT2: TaOPCGauge;
    TankFillT1: TaOPCGauge;
    TankFillT2: TaOPCGauge;
    Proizv: TaOPCProvider;
    T1Valve: TaOPCProvider;
    T2Valve: TaOPCProvider;
    Drums1: TaOPCProvider;
    Drums2: TaOPCProvider;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    Edit1: TEdit;
    aOPCLabel14: TaOPCLabel;
    Label1: TaOPCLabel;
    aOPCLabel15: TaOPCLabel;
    aOPCLabel16: TaOPCLabel;
    Bags1: TaOPCLabel;
    Bags2: TaOPCLabel;
    V864Out: TaOPCImage;
    Panel1: TPanel;
    Conts1: TaOPCLabel;
    Conts2: TaOPCLabel;
    aOPCLabel17: TaOPCLabel;
    aOPCLabel18: TaOPCLabel;
    llPriPackages: TaOPCLookupList;
    procedure aOPCLabel11DblClick(Sender: TObject);
    procedure VT712Change(Sender: TObject);
    procedure cbVT712Click(Sender: TObject);
    procedure V802Change(Sender: TObject);
    procedure V827Change(Sender: TObject);
    procedure V801Change(Sender: TObject);
    procedure V807Change(Sender: TObject);
    procedure V864Change(Sender: TObject);
    procedure V828Change(Sender: TObject);
    procedure V803Change(Sender: TObject);
    procedure HR7000Change(Sender: TObject);
    procedure V803OutChange(Sender: TObject);
    procedure ProizvChange(Sender: TObject);
    procedure CheckBox17Click(Sender: TObject);
    procedure CheckBox18Click(Sender: TObject);
    procedure CheckBox19Click(Sender: TObject);
    procedure CheckBox20Click(Sender: TObject);
    procedure CheckBox21Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure V802MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox15Click(Sender: TObject);
    procedure V864OutChange(Sender: TObject);
    procedure V865Change(Sender: TObject);
    procedure V812InChange(Sender: TObject);
    procedure V862InChange(Sender: TObject);
    procedure V806Out2Change(Sender: TObject);
  private
//    tmpV827Update:boolean;
//    tmpV802Update:boolean;
    function CheckRevers:boolean;
  protected
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    Mode:integer;
    constructor Create(AOwner: TComponent); override;
  published
    property Pin4:TaOPCImage read V806Out1 write V806Out1;
    property Pin3:TaOPCImage read Input3 write Input3;
    property Pin5:TaOPCImage read V864In write V864In;
  end;

var
  St2P3: TSt2P3;

implementation

uses StrUtils,
  UnitChoiceValue;

{$R *.dfm}

procedure TSt2P3.VT712Change(Sender: TObject);
begin
{
  mode := StrToIntDef(ModeProvider.Value,0);
  if (csLoading in ComponentState) then
    exit;

  if VT712.Value = '0' then
    Input3.Value := '0'
  else
  begin
    case mode of
      0:          Input3.Value := '0';
      1:          Input3.Value := '1';
      2,8,32,128: Input3.Value := '3';
      4:          Input3.Value := '2';
      16,64 :     Input3.Value := '4';
    end;
  end;
  V802Change(self);
  //V801Change(self);
  //V807Change(self);
  //V806Change(self);
}
end;

procedure TSt2P3.aOPCLabel11DblClick(Sender: TObject);
var
//  ChoiceValueForm:TChoiceValue;
  aLabel:TaOPCLabel;
  aNewValue:string;
begin
  if not (Sender is TaOPCLabel) then exit;

  aLabel := TaOPCLabel(Sender);
  if not (aLabel.OPCSource is TaOPCSource) then exit;
  if not Assigned(aLabel.LookupList) then exit;

  if OPCChoiceValue(aLabel.Hint,aLabel.LookupList.Items,aLabel.Value,aNewValue) then
    TaOPCSource(aLabel.OPCSource).SetSensorValue(aLabel.PhysID,aNewValue);
end;

procedure TSt2P3.cbVT712Click(Sender: TObject);
begin
  VT712.Value := IfThen((Sender as TCheckBox).Checked,'1','0');
end;

procedure TSt2P3.V802Change(Sender: TObject);
begin
  if CheckRevers then  exit;

  if V802.IsActive then
  begin
    V802Out1.Value := '0';
    V802Out2.Value := V802Input.Value;
  end
  else
  begin
    V802Out1.Value := V802Input.Value;
    V802Out2.Value := IfThen(V827.IsActive,'1','0');
  end;
end;

procedure TSt2P3.V827Change(Sender: TObject);
begin
  if CheckRevers then exit;

  if V802.IsActive then
    V802Out2.Value := V802Input.Value
  else
    V802Out2.Value := IfThen(V827.IsActive,'1','0');
end;

procedure TSt2P3.V801Change(Sender: TObject);
begin

  if V801.IsActive then
  begin
    V801Out2.Value := V801In.Value;
    if (T1Valve.Value = '1') or (T2Valve.Value = '1') then
      V801Out1.Value := '0'
    else
      V801Out1.Value := V801In.Value;
  end
  else
  begin
    V801Out1.Value := V801In.Value;
    V801Out2.Value := IfThen(not V92.IsActive,V92IN.Value,'0');
  end;
  //V807Change(self);

end;


procedure TSt2P3.V807Change(Sender: TObject);
begin
  if V807.IsActive then
  begin
    V807Out.Value := V801Out2.Value;
    V806In.Value := V807Out.Value;
  end
  else
  begin
    V807Out.Value := '0';
    V806In.Value := V807In.Value;
  end;
    
end;

procedure TSt2P3.V864Change(Sender: TObject);
begin
  V864Out.Value := IfThen(V864.IsActive,V864In.Value,'0');
  if not CheckRevers then
  begin
    V802Change(self);
    V827Change(self);
  end;
end;

procedure TSt2P3.V828Change(Sender: TObject);
begin
  V803Change(self);
  
  V828Out.Value := IfThen(V828.IsActive,V802out2.Value,'0');

  if not CheckRevers then
  begin
    V802Change(self);
    V827Change(self);
  end;

end;

procedure TSt2P3.V803Change(Sender: TObject);
begin
  if V803.IsActive then
  begin
    if V864.IsActive then
    begin
      V803Out.Value := V803In.Value;
      if V828.IsActive then
        V802Out2.Value := V803In.Value;
    end
    else
    begin
      V803Out.Value := V828Out.Value;
    end;
  end
  else
  begin
      V803Out.Value := V828Out.Value;
  end;

  if not CheckRevers then
  begin
    V802Change(self);
    V827Change(self);
  end;
end;


procedure TSt2P3.HR7000Change(Sender: TObject);
var
  v:boolean;
begin
  v:=(HR7000.Value = '1');

  Sw11.Visible := not v;
  Sw12.Visible := not v;
  Sw13.Visible := not v;
  Sw14.Visible := not v;
  Sw15.Visible := not v;
  Sw16.Visible := not v;
  Sw1.Visible := not v;
  Shape1.Visible := not v;
  Shape2.Visible := not v;

  Sw2.Visible := v;
  Sw21.Visible := v;
  Sw22.Visible := v;

  V806Out2.Value := IfThen(v,'0',V803Out.Value);
    

end;

procedure TSt2P3.V803OutChange(Sender: TObject);
begin
  Sw2.Value := V803Out.Value;
  Sw1.Value := V803Out.Value;
  HR7000Change(self);
end;

procedure TSt2P3.CheckBox15Click(Sender: TObject);
begin
  HR7000.Value := IfThen((Sender as TCheckBox).Checked,'1','0');

end;

procedure TSt2P3.ProizvChange(Sender: TObject);
begin
  if (Proizv.Value <> '1') or ((T1Valve.Value <> '1') and (T2Valve.Value <> '1')) then
  begin
    T1.Visible := false;
    T2.Visible := false;
    TankFillT1.Visible := false;
    TankFillT2.Visible := false;
    ContFillT1.Visible := false;
    ContFillT2.Visible := false;
  end
  else
  begin
    T1.Visible := (T1Valve.Value = '1');
    T2.Visible := (T2Valve.Value = '1');
    if T1Valve.Value = '1' then
    begin
      TankFillT1.Visible := (Drums1.Value = '1');
      ContFillT1.Visible := (Drums1.Value <> '1');
    end
    else
    begin
      TankFillT1.Visible := false;
      ContFillT1.Visible := false;
    end;
    if T2Valve.Value = '1' then
    begin
      TankFillT2.Visible := (Drums2.Value = '1');
      ContFillT2.Visible := (Drums2.Value <> '1');
    end
    else
    begin
      TankFillT2.Visible := false;
      ContFillT2.Visible := false;
    end;
  end;
  Bags1.Visible := (Drums1.Value = '1');
  Bags2.Visible := (Drums2.Value = '1');
  Conts1.Visible := not Bags1.Visible;
  Conts2.Visible := not Bags2.Visible;

  V801Change(sender);


end;

procedure TSt2P3.CheckBox17Click(Sender: TObject);
begin
  Proizv.Value := IfThen((Sender as TCheckBox).Checked,'1','0');

end;

procedure TSt2P3.CheckBox18Click(Sender: TObject);
begin
  T1Valve.Value := IfThen((Sender as TCheckBox).Checked,'1','0');

end;

procedure TSt2P3.CheckBox19Click(Sender: TObject);
begin
  T2Valve.Value := IfThen((Sender as TCheckBox).Checked,'1','0');

end;

procedure TSt2P3.CheckBox20Click(Sender: TObject);
begin
  Drums1.Value := IfThen((Sender as TCheckBox).Checked,'1','0');
  T1.Value := Drums1.Value;
end;

procedure TSt2P3.CheckBox21Click(Sender: TObject);
begin
  Drums2.Value := IfThen((Sender as TCheckBox).Checked,'1','0');
  T2.Value := Drums2.Value;
end;

procedure TSt2P3.Edit1Change(Sender: TObject);
begin
  ContFillT1.Progress := StrToInt(Edit1.Text);
  ContFillT2.Progress := StrToInt(Edit1.Text);
  TankFillT1.Progress := StrToInt(Edit1.Text);
  TankFillT2.Progress := StrToInt(Edit1.Text);
end;

procedure TSt2P3.V802MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Sender is TaOPCImage then
  begin
    //if ssCtrl in Shift then
    if AllowClick then
    begin
      if Button = mbLeft then
        (Sender as TaOPCImage).Value := '1'
      else
        (Sender as TaOPCImage).Value := '0';
    end;
  end;
end;

function TSt2P3.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := (V806.OPCSource as TaCustomMultiOPCSource);
end;

procedure TSt2P3.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  i: Integer;
begin
  if (OPCSource = Value) or (ComponentCount = 0) then
    exit;

  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TaCustomOPCDataObject) then
    begin
      if (TaCustomOPCDataObject(Components[i]).GraphicOPCSource = nil) and
        (TaCustomOPCDataObject(Components[i]).PhysID <> '') then
        TaCustomOPCDataObject(Components[i]).OPCSource := Value;
    end
    else if (Components[i] is TaOPCLabel) then
      TaOPCLabel(Components[i]).OPCSource := Value
//    else if (Components[i] is TaOPCGifAnimator) then
//      TaOPCGifAnimator(Components[i]).OPCSource := Value
    else if (Components[i] is TaOPCProvider) then
      TaOPCProvider(Components[i]).OPCSource := Value
    else if (Components[i] is TaOPCLookupList) then
          begin
            if Value is TaOPCSource then
              TaOPCLookupList(Components[i]).OPCSource := TaOPCSource(Value);
          end
    else if (Components[i] is TaOPCGauge) then
      TaOPCGauge(Components[i]).OPCSource := Value;


  end;

end;

constructor TSt2P3.Create(AOwner: TComponent);
begin
  inherited;
  V806Out1.SetSubComponent(true);
  V864In.SetSubComponent(true);
  Input3.SetSubComponent(true);
end;

procedure TSt2P3.V864OutChange(Sender: TObject);
begin
  v803In.Value := IfThen(V864Out.IsActive,V864Out.Value,V865Out.Value);
end;

procedure TSt2P3.V865Change(Sender: TObject);
begin
  V865Out.Value := IfThen(V865.IsActive,V865In.Value,'0');
end;

procedure TSt2P3.V812InChange(Sender: TObject);
begin
  V812Out.Value := IfThen(V812.IsActive,V812In.Value,'0');
end;

procedure TSt2P3.V862InChange(Sender: TObject);
begin
  V862Out.Value := IfThen(V862.IsActive,V862In.Value,'0');
end;

procedure TSt2P3.V806Out2Change(Sender: TObject);
begin
  V806Out1.Value := IfThen(V806.IsActive,V806Out2.Value,V806In.Value);
end;

function TSt2P3.CheckRevers: boolean;
begin
  Result :=(V864.IsActive)
      and (V828.IsActive)
      and (v803.IsActive);
end;

end.


