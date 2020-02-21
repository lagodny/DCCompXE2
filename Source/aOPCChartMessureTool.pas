unit aOPCChartMessureTool;

interface

uses
  System.Classes, System.SysUtils, System.Types,
  Winapi.Windows, Controls, 
  Series, TeEngine, TeCanvas, TeeProcs, TeeTools,
  uDCObjects;

const
  TeeMsg_OPCMessureTool = 'Messure';
  TeeMsg_OPCMessureToolDesc = 'Allow messure series values.';

  TeeMsg_OPCMessureBandTool = 'Messure Band';
  TeeMsg_OPCMessureBandToolDesc = 'Allow select and messure series values.';



type
  TaOPCMessureLine = class(TColorLineTool)

  end;

  TaOPCMessureBand = class(TColorBandTool)
  private
    IDragging: Boolean;
    FShift: Double;
    FDragRepaint: Boolean;
    FNoLimitDrag: Boolean;
    FAllowDrag: Boolean;
    function Chart: TCustomAxisPanel;
  protected
    procedure ChartMouseEvent(AEvent: TChartMouseEvent; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
    function LimitValue(const AValue: Double): Double;  // 7.0 moved from private
    function Clicked(X, Y: Integer): Boolean;  // 6.02
  published
    property AllowDrag: Boolean read FAllowDrag write FAllowDrag default True;
    property DragRepaint: Boolean read FDragRepaint write FDragRepaint default True;
    property NoLimitDrag: Boolean read FNoLimitDrag write FNoLimitDrag default False;
  end;

//  TaOPCTextShape = class(TTextShape)
//  public
//
//  end;

  TaOPCMessureTool = class(TRectangleTool)
  private
    FLine: TaOPCMessureLine;
    FAxis: TChartAxis;
    function NewColorLine: TaOPCMessureLine;
    procedure DragLine(Sender: TColorLineTool);
    procedure SetAxis(const Value: TChartAxis);
  protected
    procedure PaintLine;
    procedure SetParentChart(const Value: TCustomAxisPanel); override;
    procedure ChartEvent(AEvent: TChartToolEvent); override;

    procedure DrawText; overload; override;
    procedure ShapeDrawText(Panel:TCustomAxisPanel; R:TRect; XOffset, NumLines:Integer);

  public
    property Line: TaOPCMessureLine read FLine;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    class function Description:String; override;
    class function LongDescription:String; override;
  published
    property Axis: TChartAxis read FAxis write SetAxis stored False;

  end;

  TaOPCMessureBandTool = class(TRectangleTool)
  private
    FBand: TaOPCMessureBand;
    FAxis: TChartAxis;
    function NewBand: TaOPCMessureBand;
    procedure DragLine(Sender: TColorLineTool);
    procedure SetAxis(const Value: TChartAxis);
  protected
    //procedure PaintBand;
    procedure SetParentChart(const Value: TCustomAxisPanel); override;
    procedure ChartEvent(AEvent: TChartToolEvent); override;

    procedure DrawText; overload; override;
    procedure ShapeDrawText(Panel:TCustomAxisPanel; R:TRect; XOffset, NumLines:Integer);

  public
    property Band: TaOPCMessureBand read FBand;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    class function Description:String; override;
    class function LongDescription:String; override;
  published
    property Axis: TChartAxis read FAxis write SetAxis stored False;
  end;


implementation

uses
  aOPCUtils,
  aOPCLineSeries;

{ TaOPCMessureTool }

procedure TaOPCMessureTool.ChartEvent(AEvent: TChartToolEvent);
begin
  inherited;

  case AEvent of
   //cteBeforeDrawAxes: if DrawBehindAxes then PaintBand;
   cteBeforeDrawSeries: PaintLine;
   //cteAfterDraw: if (not DrawBehind) and (not DrawBehindAxes) then PaintBand;
  end;

end;

constructor TaOPCMessureTool.Create(AOwner: TComponent);
begin
  inherited;

  with Shape do
  begin
    Shadow.Size:=2;
    Transparency:=0;
    ShapeBounds.Left:=10;
    ShapeBounds.Top:=10;
    Width:=150;
    Height:=50;
  end;

  FLine := NewColorLine;
end;

class function TaOPCMessureTool.Description: String;
begin
  Result := TeeMsg_OPCMessureTool;
end;

destructor TaOPCMessureTool.Destroy;
begin
  FreeAndNil(FLine);
  inherited;
end;

procedure TaOPCMessureTool.DragLine(Sender: TColorLineTool);
//var
//  tmpWidth: Integer;
begin
//  tmpWidth := Shape.Width;
//  Shape.Left := Axis.CalcPosValue(Line.Value) + 5;
//  Shape.Width := tmpWidth;
end;

procedure TaOPCMessureTool.DrawText;
var
//  tmpTo     : TPoint;
//  tmpMid    : TPoint;
//  tmpFrom   : TPoint;
  tmpR      : TRect;
  tmpN,
  tmpX,
  tmpY      : Integer;
begin
  Shape.Text:=GetText;
  tmpR:=GetTextBounds(tmpN,tmpX,tmpY);
//  Shape.DrawText(ParentChart, tmpR, GetXOffset, tmpN);
  ShapeDrawText(ParentChart, tmpR, GetXOffset, tmpN);

//  with Callout do
//  if Visible or Arrow.Visible then
//  begin
//    tmpTo:=TeePoint(XPosition,YPosition);
//    tmpFrom:=CloserPoint(tmpR,tmpTo);
//
//    if Distance<>0 then
//       tmpTo:=PointAtDistance(tmpFrom,tmpTo,Distance);
//
//    tmpMid.X:=0;
//    tmpMid.Y:=0;
//
//    {$IFDEF LCL}Self.Callout.{$ENDIF}Draw(clNone,tmpTo,tmpMid,tmpFrom,ZPosition);
//  end;
end;

class function TaOPCMessureTool.LongDescription: String;
begin
  Result := TeeMsg_OPCMessureToolDesc;
end;

function TaOPCMessureTool.NewColorLine: TaOPCMessureLine;
begin
  Result := TaOPCMessureLine.Create(nil);
  result.Active := False;
  result.DragRepaint := True;
  result.OnDragLine := Self.DragLine;
  //result.Pen.OnChange := CanvasChanged;
  //Result.ParentChart := nil;
end;

procedure TaOPCMessureTool.PaintLine;
begin
  if Assigned(Axis) then
  begin
    if FLine.Active then
    begin
//      FLine.Value := StartValue;
      FLine.InternalDrawLine(False);
    end;
  end;
end;

procedure TaOPCMessureTool.SetAxis(const Value: TChartAxis);
begin
  FAxis := Value;
  FLine.Axis := Value;
end;

procedure TaOPCMessureTool.SetParentChart(const Value: TCustomAxisPanel);
begin
  inherited;

  if Assigned(FLine) then
    FLine.ParentChart := Value;
end;

procedure TaOPCMessureTool.ShapeDrawText(Panel: TCustomAxisPanel; R: TRect; XOffset, NumLines: Integer);
var x     : Integer;
    t     : Integer;
    //tmp   : String;
    tmpTop    : Integer;
    tmpHeight : Integer;
    saveColor: Integer;
    //v: Double;
    vStr: string;
begin
  OffsetRect(R,Panel.ChartBounds.Left,Panel.ChartBounds.Top);

  if Shape.Visible then
     Shape.DrawRectRotated(Panel, R);

  With Panel.Canvas do
  begin
    if Self.ClipText then
       ClipRectangle(R);

    try
      BackMode:=cbmTransparent;

      case TextAlignment of
        taLeftJustify:
          begin
            TextAlign:=TA_LEFT;
            x:=R.Left+Shape.Margins.Size.Left;

            if Self.Pen.Visible then
               Inc(x,Self.Pen.Width);
          end;
        taCenter:
          begin
            TextAlign:=ta_Center;

            with R do
                 x:=1+((Left+Shape.Margins.Size.Left+Right-Shape.Margins.Size.Right) div 2);
          end;
      else
        begin
          TextAlign:=ta_Right;
          x:=R.Right-Shape.Margins.Size.Right;
        end;
      end;

      AssignFont(Shape.Font);
      tmpHeight:=FontHeight;

      tmpTop:=R.Top+Shape.Margins.Size.Top;
      TextOut( x+XOffset,
               tmpTop,
               FormatDateTime('dd.mm.yyyy HH:MM:SS', FLine.Value),
               Shape.TextFormat=ttfHtml);

      saveColor := Font.Color;
      for t := 0 to ParentChart.SeriesCount - 1 do
      begin
        if ParentChart.Series[t] is TaOPCLineSeries then
        begin
          vStr := TaOPCLineSeries(ParentChart.Series[t]).GetSerieValueStr(FLine.Value);
          Font.Color := ParentChart.Series[t].Color;
          TextOut( x+XOffset,
                   tmpTop+(t+1)*tmpHeight,
                   vStr,
                   Shape.TextFormat=ttfHtml);

        end;
      end;
      Font.Color := saveColor;

      if (ParentChart.SeriesCount+1)*tmpHeight + 5 > Shape.Height then
        Shape.Height := (ParentChart.SeriesCount+1)*tmpHeight + 5;

    finally
      if Shape.ClipText then
         UnClipRectangle;
    end;
  end;
end;

{ TaOPCMessureBandTool }

//procedure TaOPCMessureBandTool.ChartEvent(AEvent: TChartToolEvent);
//begin
//  inherited;
//
//end;

procedure TaOPCMessureBandTool.ChartEvent(AEvent: TChartToolEvent);
begin
  inherited;

  case AEvent of
   //cteBeforeDrawAxes: if DrawBehindAxes then PaintBand;
    cteBeforeDrawSeries:
      Band.ChartEvent(cteBeforeDrawSeries); // PaintBand;
    cteAfterDraw:
      DrawText;
   //cteAfterDraw: if (not DrawBehind) and (not DrawBehindAxes) then PaintBand;
  end;
end;

constructor TaOPCMessureBandTool.Create(AOwner: TComponent);
begin
  inherited;

  with Shape do
  begin
    Shadow.Size:=2;
    Transparency:=0;
    ShapeBounds.Left:=10;
    ShapeBounds.Top:=10;
    Width:=300;
    Height:=40;
  end;

  FBand := NewBand;
end;

class function TaOPCMessureBandTool.Description: String;
begin
  Result := TeeMsg_OPCMessureBandTool;
end;

destructor TaOPCMessureBandTool.Destroy;
begin
  FreeAndNil(FBand);
  inherited;
end;

procedure TaOPCMessureBandTool.DragLine(Sender: TColorLineTool);
begin

end;

procedure TaOPCMessureBandTool.DrawText;
var
  tmpR: TRect;
  tmpN, tmpX, tmpY: Integer;
begin
  Shape.Text := GetText;
  tmpR := GetTextBounds(tmpN,tmpX,tmpY);
  ShapeDrawText(ParentChart, tmpR, GetXOffset, tmpN);
end;

class function TaOPCMessureBandTool.LongDescription: String;
begin
  Result := TeeMsg_OPCMessureBandToolDesc;
end;

function TaOPCMessureBandTool.NewBand: TaOPCMessureBand;
begin
  Result := TaOPCMessureBand.Create(nil);
  result.Active := False;

  result.StartLine.DragRepaint := True;
  //result.StartLine.OnDragLine := Self.DragLine;

  result.EndLine.DragRepaint := True;
  //result.EndLine.OnDragLine := Self.DragLine;
end;

//procedure TaOPCMessureBandTool.PaintBand;
//begin
//  if Assigned(Axis) then
//  begin
//    if FBand.Active then
//    begin
////      FLine.Value := StartValue;
//      FBand.InternalDrawBand(False);
//    end;
//  end;
//end;

procedure TaOPCMessureBandTool.SetAxis(const Value: TChartAxis);
begin
  FAxis := Value;
  Band.Axis := Value;
end;

procedure TaOPCMessureBandTool.SetParentChart(const Value: TCustomAxisPanel);
begin
  inherited;

  if Assigned(FBand) then
    FBand.ParentChart := Value;
end;

procedure TaOPCMessureBandTool.ShapeDrawText(Panel: TCustomAxisPanel; R: TRect; XOffset, NumLines: Integer);
var
  x: Integer;
  t: Integer;
  tmpTop: Integer;
  tmpHeight: Integer;
  saveColor: Integer;
  vStr: string;
  aText: string;
  xLeft, xRight, xCenter: Integer;
  v1, v2: Double;
  aSeries: TaOPCLineSeries;
  function TimeView(aTime: TDateTime): string;
  begin
    if aTime < 1 then
      Result := FormatDateTime('HH:MM:SS', aTime)
    else
      Result := FormatFloat('# ##0.## �.', aTime);
  end;
begin
  OffsetRect(R,Panel.ChartBounds.Left,Panel.ChartBounds.Top);

  if Shape.Visible then
     Shape.DrawRectRotated(Panel, R);

  With Panel.Canvas do
  begin
    if Self.ClipText then
       ClipRectangle(R);

    try
      BackMode:=cbmTransparent;

      xLeft := R.Left+Shape.Margins.Size.Left;
      if Self.Pen.Visible then
         Inc(xLeft, Self.Pen.Width);

      xRight := R.Right-Shape.Margins.Size.Right;
      xCenter := 1+((R.Left + Shape.Margins.Size.Left + R.Right - Shape.Margins.Size.Right) div 2);



      AssignFont(Shape.Font);
      tmpHeight:=FontHeight;

      tmpTop:=R.Top+Shape.Margins.Size.Top;

      TextAlign:=TA_LEFT;
      TextOut( xLeft + XOffset,
               tmpTop,
               FormatDateTime('dd.mm.yyyy HH:MM:SS', Band.StartValue),
               Shape.TextFormat=ttfHtml);

      TextAlign:=TA_CENTER;
      TextOut( XCenter,
               tmpTop,
               TimeView(Band.EndValue - Band.StartValue),
               Shape.TextFormat=ttfHtml);


      TextAlign:=ta_Right;
      TextOut( xRight,
               tmpTop,
               FormatDateTime('dd.mm.yyyy HH:MM:SS', Band.EndValue),
               Shape.TextFormat=ttfHtml);


//      aText :=
//        '<table>'+
//          '<tr>'+
//            '<td>'+FormatDateTime('dd.mm.yyyy HH:MM:SS', Band.StartValue)+'</td>'+
//            '<td>'+FormatDateTime('dd.mm.yyyy HH:MM:SS', Band.StartValue)+'</td>'+
//          '</tr>'+
//        '</table>';
//      TextOut( x+XOffset,
//               tmpTop,
//               aText,
//               True);

      saveColor := Font.Color;
      for t := 0 to ParentChart.SeriesCount - 1 do
      begin
        if ParentChart.Series[t] is TaOPCLineSeries then
        begin
          aSeries := TaOPCLineSeries(ParentChart.Series[t]);
          Font.Color := aSeries.Color;
          //Font.Color := ParentChart.Series[t].Color;

          vStr := aSeries.GetSerieValueStr(Band.StartValue);
          TextAlign := TA_LEFT;
          TextOut(xLeft + XOffset, tmpTop + (t + 1) * tmpHeight, vStr, Shape.TextFormat = ttfHtml);

          vStr := aSeries.GetSerieValueStr(Band.EndValue);
          TextAlign := TA_RIGHT;
          TextOut(xRight - XOffset, tmpTop + (t + 1) * tmpHeight, vStr, Shape.TextFormat = ttfHtml);

          if aSeries.CalcSeriesValue(Band.StartValue, v1) and aSeries.CalcSeriesValue(Band.EndValue, v2) then
          begin
            vStr := FormatFloat(aSeries.DisplayFormat, v2 - v1);
            TextAlign := TA_CENTER;
            TextOut(xCenter, tmpTop + (t + 1) * tmpHeight, vStr, Shape.TextFormat = ttfHtml);
          end

        end;
      end;
      Font.Color := saveColor;

      if (ParentChart.SeriesCount + 1) * tmpHeight + 5 > Shape.Height then
        Shape.Height := (ParentChart.SeriesCount + 1) * tmpHeight + 5;

    finally
      if Shape.ClipText then
	    UnClipRectangle;
    end;
  end;
end;

{ TaOPCMessureBand }

function TaOPCMessureBand.Chart: TCustomAxisPanel;
begin
  result := StartLine.ParentChart;
  if not Assigned(result) then
    result := ParentChart;
end;

procedure TaOPCMessureBand.ChartMouseEvent(AEvent: TChartMouseEvent; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  tmp: Integer;
  tmpNew: Double;
  tmpDoDraw: Boolean;
begin
//    inherited;
//    Exit;

  if not IDragging then
  begin
    if StartLine.Active then
      TaOPCMessureLine(StartLine).ChartMouseEvent(AEvent, Button, Shift, X, Y);

    if EndLine.Active and (not ParentChart.CancelMouse) then
      TaOPCMessureLine(EndLine).ChartMouseEvent(AEvent, Button, Shift, X, Y);
  end;

  if  ParentChart.CancelMouse then
    Exit;

  tmpDoDraw := False;

  if AllowDrag and Assigned(Axis) then
  begin
    case AEvent of
      cmeUp:
        if IDragging then  // 7.0
        begin
               { force repaint }
          if not FDragRepaint then
            Repaint;

               { call event }
          //DoEndDragLine;

          IDragging := False;
        end;
      cmeMove:
        begin
          if IDragging then
          begin
            if Axis.Horizontal then
              tmp := X
            else
              tmp := Y;

               { calculate new position }
            tmpNew := Axis.CalcPosPoint(tmp);

               { check inside axis limits }
            if not NoLimitDrag then  // (already implicit AllowDrag=True)
              tmpNew := LimitValue(tmpNew);

            tmpNew := tmpNew - FShift;

//          if FDragRepaint then { 5.02 }
            begin
            //Value := tmpNew { force repaint whole chart }
              EndValue := (tmpNew - StartValue) + EndValue;
              StartValue := tmpNew;
            end;
//          else
//          begin
//
//            tmpDoDraw := CalcValue <> tmpNew;
//
//            if tmpDoDraw then
//            begin
//                   { draw line in xor mode, to avoid repaint the whole chart }
//              with Chart.Canvas do
//              begin
//                AssignVisiblePen(Self.Pen);
//                Pen.Mode := pmNotXor;
//              end;
//
//                   { hide previous line }
//              DrawColorLine(True);
//              DrawColorLine(False);
//
//                   { set new value }
//              FStyle := clCustom;
//              FValue := tmpNew;
//            end;
//          end;

            Chart.CancelMouse := True;

               { call event, allow event to change Value }
//          if Assigned(FOnDragLine) then
//            FOnDragLine(Self);

//          if tmpDoDraw then { 5.02 }
//          begin
//                 { draw at new position }
//            DrawColorLine(True);
//            DrawColorLine(False);
//
//                 { reset pen mode }
//            Chart.Canvas.Pen.Mode := pmCopy;
//          end;
          end
          else
          begin
            // is mouse on band?
            if Clicked(X, Y) then //or StartLine.Clicked(X, Y) or EndLine.Clicked(X, Y) then
            begin
              Chart.CancelMouse := (not ParentChart.IPanning.Active) and (not ParentChart.Zoom.Active);
              if Chart.CancelMouse then
                Chart.Cursor := crHandPoint;
            end
//            else if StartLine.Clicked(X, Y) or EndLine.Clicked(X, Y) then
//            begin
//               { show appropiate cursor }
//               if Axis.Horizontal then
//                  Chart.Cursor:=crHSplit
//               else
//                  Chart.Cursor:=crVSplit;
//               Chart.CancelMouse:=True;
//              //Chart.CancelMouse := (not ParentChart.IPanning.Active) and (not ParentChart.Zoom.Active);
//            end;

        end;
      end;
      cmeDown:
        begin
          if Button = mbLeft then
          begin
               { is mouse over? }
            IDragging := Clicked(X, Y);
            Chart.CancelMouse := IDragging;

            if Axis.Horizontal then
              tmp := X
            else
              tmp := Y;

               { calculate new position }
            FShift := Axis.CalcPosPoint(tmp) - StartValue;


//          if IDragging and Assigned(FOnBeginDragLine) then // 7.0
//            FOnBeginDragLine(Self);
          end;

//          if Assigned(FOnClick) and Clicked(X, Y) then
//            FOnClick(Self, Button, Shift, X, Y);

        end;
    end;
  end;
end;

function TaOPCMessureBand.Clicked(X, Y: Integer): Boolean;
var
  r: TRect;
  P: TFourPoints;
begin
//  ParentChart.Canvas.FourPointsFromRect(BoundsRect,ZPosition,P);
//  result:=PointInPolygon(TeePoint(X,Y),P);

  r := BoundsRect;
  InflateRect(r, -StartLine.Pen.Width, 0);
  ParentChart.Canvas.FourPointsFromRect(r, ZPosition, P);
  result := PointInPolygon(TeePoint(X, Y), P);
end;

constructor TaOPCMessureBand.Create(AOwner: TComponent);
begin
  inherited;
  FAllowDrag := True;
  FNoLimitDrag := False;
  FDragRepaint := True;
    end;

function TaOPCMessureBand.LimitValue(const AValue: Double): Double;
var
  tmpLimit: Double;
  tmpStart: Integer;
  tmpEnd: Integer;
begin
  result := AValue;

  tmpStart := Axis.IEndPos; // 6.01 Fix for Inverted axes
  tmpEnd := Axis.IStartPos;
  if Axis.Horizontal then
    SwapInteger(tmpStart, tmpEnd);
  if Axis.Inverted then
    SwapInteger(tmpStart, tmpEnd);

  // do not use Axis Minimum & Maximum, we need the "real" min and max
  tmpLimit := Axis.CalcPosPoint(tmpStart);
  if result < tmpLimit then
    result := tmpLimit
  else
  begin
    tmpLimit := Axis.CalcPosPoint(tmpEnd);
    if result > tmpLimit then
      result := tmpLimit;
  end;
end;

end.

