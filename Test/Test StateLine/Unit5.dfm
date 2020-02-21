object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 354
  ClientWidth = 831
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object aOPCStateLine1: TaOPCStateLine
    Left = 0
    Top = 0
    Width = 831
    Height = 25
    UpdateOnChangeMoment = True
    Align = alTop
    StateColors.Strings = (
      '0=clWhite'
      '1=clGreen')
    Interval.Kind = ikInterval
    Interval.ShiftKind = skNone
    Interval.Date1 = 42219.613177233800000000
    Interval.Date2 = 42220.613177233800000000
    Interval.TimeShift = 1.000000000000000000
    Interval.TimeShiftUnit = tsuDay
    Interval.EnableTime = True
    ExplicitWidth = 635
  end
  object aOPCGauge1: TaOPCGauge
    Left = 272
    Top = 120
    Width = 100
    Height = 65
    Value = '70'
    BorderStyle = bsNone
    ForeColor = clBlue
    Kind = gkNeedle
    Progress = 70
  end
  object aOPCImage1: TaOPCImage
    Left = 72
    Top = 85
    Width = 100
    Height = 100
    OPCSource = aOPCTCPSource_V301
    PhysID = '32'
    OPCImageList = aOPCImageList1
    States.Strings = (
      '120=0')
    ErrorImageIndex = 1
  end
  object Button1: TButton
    Left = 32
    Top = 31
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 336
    Top = 40
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 1
    OnClick = CheckBox1Click
  end
  object BoilerFrame1: TBoilerFrame
    Left = 400
    Top = 176
    Width = 307
    Height = 158
    AutoScroll = True
    TabOrder = 2
    TabStop = True
    AllowClick = False
    BoilerNo = 0
    AllowAnimate = True
  end
  object aOPCImageList1: TaOPCImageList
    Items = <
      item
        Name = 'Alarm - OK.bmp'
        Picture.Data = {
          07544269746D617076010000424D760100000000000036000000280000000A00
          00000A000000010018000000000040010000C40E0000C40E0000000000000000
          0000577AB9577AB9577AB9577AB9000000000000577AB9577AB9577AB9577AB9
          0000577AB9577AB90000000000008CE2678CE267000000000000577AB9577AB9
          0000577AB90000008CE2678CE2678CE2678CE2678CE2678CE267000000577AB9
          0000577AB90000008CE2678CE2678CE2678CE2678CE2678CE267000000577AB9
          00000000008CE2678CE2678CE2678CE2678CE2678CE2678CE2678CE267000000
          00000000008CE2678CE2678CE2678CE2678CE2678CE2678CE2678CE267000000
          0000577AB90000008CE2678CE2678CE2678CE2678CE2678CE267000000577AB9
          0000577AB90000008CE2678CE2678CE2678CE2678CE2678CE267000000577AB9
          0000577AB9577AB90000000000008CE2678CE267000000000000577AB9577AB9
          0000577AB9577AB9577AB9577AB9000000000000577AB9577AB9577AB9577AB9
          0000}
        Transparent = True
        TransparentColor = 39287481
      end
      item
        Name = 'Arrow-Down.bmp'
        Picture.Data = {
          07544269746D6170C6000000424DC60000000000000036000000280000000700
          0000060000000100180000000000900000000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFF0000FFC4C4FFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFF0000FF1515FFFFFFFFFFFFFF000000FFFFFFFFFFFF5050FF0000FF0000
          FF9292FFFFFFFF000000FFFFFFEFEFFF0707FF0000FF0000FF1616FFFFFFFF00
          0000FFFFFF2727FF0000FF0000FF0000FF0000FF5959FF000000C4C4FF0202FF
          0000FF0000FF0000FF0000FF0808FF000000}
        Transparent = True
        TransparentColor = 50331647
      end>
    Left = 448
    Top = 96
  end
  object aOPCTCPSource_V301: TaOPCTCPSource_V30
    RemoteMachine = 'duakhed0023'
    User = #1051#1072#1075#1086#1076#1085#1099#1081
    Password = '314'
    PacketUpdate = True
    UpdateMode = umStreamPacket
    Connected = True
    MainHost = 'duakhed0023'
    Left = 272
    Top = 48
  end
end
