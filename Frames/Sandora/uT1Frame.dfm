inherited frT1: TfrT1
  Width = 438
  Height = 519
  AutoScroll = False
  Color = 11249050
  ParentColor = False
  OnMouseDown = FrameMouseDown
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 438
    Height = 519
    Align = alClient
    Color = 11249050
    ParentBackground = False
    TabOrder = 0
    object T2: TaOPCGauge
      Left = 260
      Top = 244
      Width = 109
      Height = 121
      Color = clBtnFace
      ForeColor = 16777088
      Kind = gkVerticalBar
      MaxValue = 3500
      ParentColor = False
      Progress = 0
      ShowText = False
    end
    object T1: TaOPCGauge
      Left = 60
      Top = 244
      Width = 109
      Height = 121
      ForeColor = 16777088
      Kind = gkVerticalBar
      MaxValue = 3500
      Progress = 10
      ShowText = False
    end
    object aOPCPipe1: TaOPCPipe
      Left = 28
      Top = 88
      Width = 57
      GraphicOPCSource = k3
    end
    object k3: TaOPCValve
      Left = 84
      Top = 77
      OnChange = k3Change
      Kind = vkSimple
    end
    object aOPCPipe3: TaOPCPipe
      Left = 108
      Top = 96
      Width = 25
      Height = 17
      GraphicOPCSource = k3
      PipePosition = vpVertical
    end
    object k5: TaOPCValve
      Left = 114
      Top = 111
      Width = 25
      Height = 17
      Kind = vkSimple
      Direction = vdDown
    end
    object aOPCPipe4: TaOPCPipe
      Left = 112
      Top = 128
      Width = 17
      Height = 17
      GraphicOPCSource = k5
      PipePosition = vpVertical
    end
    object aOPCPipe5: TaOPCPipe
      Left = 220
      Top = 88
      Width = 113
      GraphicOPCSource = k2
    end
    object aOPCPipe6: TaOPCPipe
      Left = 300
      Top = 96
      Width = 25
      Height = 17
      GraphicOPCSource = k2
      PipePosition = vpVertical
    end
    object k4: TaOPCValve
      Left = 306
      Top = 111
      Width = 25
      Height = 17
      Kind = vkSimple
      Direction = vdDown
    end
    object aOPCPipe7: TaOPCPipe
      Left = 304
      Top = 128
      Width = 17
      Height = 17
      GraphicOPCSource = k4
      PipePosition = vpVertical
    end
    object k2: TaOPCValve
      Left = 332
      Top = 77
      OnChange = k3Change
      Kind = vkSimple
      Direction = vdRight
    end
    object aOPCPipe8: TaOPCPipe
      Left = 348
      Top = 88
      Width = 65
      GraphicOPCSource = k2
    end
    object aOPCPipe9: TaOPCPipe
      Left = 214
      Top = 93
      Width = 15
      Height = 36
      PipePosition = vpVertical
    end
    object aOPCPipe11: TaOPCPipe
      Left = 220
      Top = 120
      Width = 25
      GraphicOPCSource = aOPCPipe9
    end
    object aOPCPipe12: TaOPCPipe
      Left = 150
      Top = 120
      Width = 23
      GraphicOPCSource = k6
    end
    object aOPCPipe13: TaOPCPipe
      Left = 271
      Top = 128
      Width = 17
      Height = 65
      GraphicOPCSource = k7
      PipePosition = vpVertical
    end
    object k6: TaOPCValve
      Left = 173
      Top = 109
      Kind = vkSimple
      Direction = vdRight
    end
    object k7: TaOPCValve
      Left = 245
      Top = 109
      Kind = vkSimple
    end
    object aOPCPipe14: TaOPCPipe
      Left = 143
      Top = 128
      Width = 17
      Height = 65
      GraphicOPCSource = k6
      PipePosition = vpVertical
    end
    object aOPCPipe15: TaOPCPipe
      Left = 143
      Top = 192
      Width = 17
      Height = 25
      GraphicOPCSource = k12
      PipePosition = vpVertical
    end
    object aOPCPipe16: TaOPCPipe
      Left = 261
      Top = 119
      Width = 20
      Height = 17
      GraphicOPCSource = k7
    end
    object aOPCPipe17: TaOPCPipe
      Left = 271
      Top = 192
      Width = 17
      Height = 25
      GraphicOPCSource = k13
      PipePosition = vpVertical
    end
    object k11: TaOPCValve
      Left = 120
      Top = 173
      Kind = vkSimple
      Direction = vdRight
    end
    object aOPCPipe18: TaOPCPipe
      Left = 136
      Top = 184
      Width = 17
      GraphicOPCSource = k11
    end
    object aOPCPipe19: TaOPCPipe
      Left = 148
      Top = 184
      Width = 25
      GraphicOPCSource = k9
    end
    object aOPCPipe20: TaOPCPipe
      Left = 276
      Top = 184
      Width = 17
      GraphicOPCSource = k14
    end
    object aOPCPipe21: TaOPCPipe
      Left = 262
      Top = 184
      Width = 17
      GraphicOPCSource = k10
    end
    object k9: TaOPCValve
      Left = 173
      Top = 173
      Kind = vkSimple
      Direction = vdRight
    end
    object k10: TaOPCValve
      Left = 245
      Top = 173
      Kind = vkSimple
    end
    object k14: TaOPCValve
      Left = 292
      Top = 173
      Kind = vkSimple
    end
    object k12: TaOPCValve
      Left = 145
      Top = 215
      Width = 25
      Height = 17
      Kind = vkSimple
      Direction = vdDown
    end
    object k13: TaOPCValve
      Left = 273
      Top = 215
      Width = 25
      Height = 17
      Kind = vkSimple
      Direction = vdDown
    end
    object aOPCPipe22: TaOPCPipe
      Left = 143
      Top = 232
      Width = 17
      Height = 49
      GraphicOPCSource = k12
      PipePosition = vpVertical
    end
    object aOPCPipe23: TaOPCPipe
      Left = 271
      Top = 232
      Width = 17
      Height = 49
      GraphicOPCSource = k13
      PipePosition = vpVertical
    end
    object aOPCPipe24: TaOPCPipe
      Left = 304
      Top = 136
      Width = 17
      GraphicOPCSource = k4
    end
    object aOPCPipe25: TaOPCPipe
      Left = 112
      Top = 136
      Width = 17
      GraphicOPCSource = k5
    end
    object aOPCPipe26: TaOPCPipe
      Left = 220
      Top = 40
      Width = 57
      Height = 17
      GraphicOPCSource = k1
    end
    object aOPCPipe27: TaOPCPipe
      Left = 214
      Top = 48
      Width = 15
      Height = 49
      GraphicOPCSource = k1
      PipePosition = vpVertical
    end
    object k1: TaOPCValve
      Left = 276
      Top = 30
      OnChange = k3Change
      Kind = vkSimple
      Direction = vdRight
    end
    object aOPCPipe28: TaOPCPipe
      Left = 292
      Top = 40
      Width = 121
      Height = 17
      GraphicOPCSource = k1
    end
    object aOPCPipe29: TaOPCPipe
      Left = 190
      Top = 184
      Width = 55
      GraphicOPCSource = aOPCPipe32
    end
    object aOPCPipe30: TaOPCPipe
      Left = 214
      Top = 125
      Width = 15
      Height = 20
      GraphicOPCSource = aOPCPipe9
      PipePosition = vpVertical
    end
    object k8: TaOPCValve
      Left = 215
      Top = 143
      Width = 25
      Height = 17
      OnChange = k8Change
      Kind = vkSimple
      Direction = vdDown
    end
    object aOPCPipe31: TaOPCPipe
      Left = 214
      Top = 160
      Width = 15
      Height = 29
      GraphicOPCSource = k8
      ColorNotActive = clGray
      PipePosition = vpVertical
    end
    object aOPCPipe32: TaOPCPipe
      Left = 198
      Top = 192
      Width = 15
      Height = 205
      GraphicOPCSource = aOPCPipe42
      PipePosition = vpVertical
    end
    object aOPCPipe33: TaOPCPipe
      Left = 112
      Top = 184
      Width = 9
      GraphicOPCSource = k11
    end
    object aOPCPipe34: TaOPCPipe
      Left = 308
      Top = 184
      Width = 9
      GraphicOPCSource = k14
    end
    object aOPCPipe35: TaOPCPipe
      Left = 102
      Top = 192
      Width = 21
      Height = 89
      GraphicOPCSource = k11
      PipePosition = vpVertical
    end
    object aOPCPipe36: TaOPCPipe
      Left = 306
      Top = 190
      Width = 21
      Height = 93
      GraphicOPCSource = k14
      PipePosition = vpVertical
    end
    object Label1: TLabel
      Left = 320
      Top = 28
      Width = 66
      Height = 15
      Caption = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clPurple
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 28
      Top = 76
      Width = 29
      Height = 15
      Caption = #1042#1086#1076#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 360
      Top = 76
      Width = 37
      Height = 15
      Caption = #1057#1080#1088#1086#1087
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object aOPCPipe38: TaOPCPipe
      Left = 214
      Top = 194
      Width = 15
      Height = 185
      GraphicOPCSource = k8
      ColorNotActive = clGray
      PipePosition = vpVertical
    end
    object aOPCPipe10: TaOPCPipe
      Left = 190
      Top = 120
      Width = 31
      GraphicOPCSource = aOPCPipe9
    end
    object aOPCPipe2: TaOPCPipe
      Left = 101
      Top = 88
      Width = 120
      GraphicOPCSource = k3
    end
    object aOPCGauge1: TaOPCGauge
      Left = 220
      Top = 16
      Width = 49
      Height = 25
      BorderStyle = bsNone
      Kind = gkNeedle
      MaxValue = 40000
      Progress = 0
    end
    object aOPCLabel1: TaOPCLabel
      Left = 236
      Top = 56
      Width = 9
      Height = 14
      Caption = ' 0'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      DisplayFormat = '# ##0'
    end
    object aOPCGauge2: TaOPCGauge
      Left = 28
      Top = 104
      Width = 49
      Height = 25
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Kind = gkNeedle
      MaxValue = 40000
      ParentFont = False
      Progress = 0
    end
    object aOPCLabel2: TaOPCLabel
      Left = 28
      Top = 130
      Width = 9
      Height = 13
      Caption = ' 0'
      DisplayFormat = '# ##0'
    end
    object aOPCPipe39: TaOPCPipe
      Left = 150
      Top = 278
      Width = 14
      Height = 14
      GraphicOPCSource = k12
      PipePosition = vpLeftDiagonal
    end
    object aOPCPipe40: TaOPCPipe
      Left = 267
      Top = 278
      Width = 14
      Height = 14
      GraphicOPCSource = k13
      PipePosition = vpRightDiagonal
    end
    object aOPCGauge3: TaOPCGauge
      Left = 356
      Top = 100
      Width = 49
      Height = 25
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Kind = gkNeedle
      MaxValue = 40000
      ParentFont = False
      Progress = 0
    end
    object aOPCLabel3: TaOPCLabel
      Left = 356
      Top = 126
      Width = 9
      Height = 13
      Caption = ' 0'
      DisplayFormat = '# ##0'
    end
    object Label4: TLabel
      Left = 210
      Top = 476
      Width = 103
      Height = 30
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1087#1088#1086#1076#1091#1082#1090#1072' '#13#10#1086#1090' '#1089#1090#1077#1088#1080#1083#1080#1079#1072#1090#1086#1088#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 20
      Top = 434
      Width = 36
      Height = 15
      Caption = #1052#1086#1081#1082#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 136
      Top = 304
      Width = 38
      Height = 73
      Caption = '1'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 328
      Top = 304
      Width = 38
      Height = 73
      Caption = '2'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object pd1: TaOPCPipe
      Left = 103
      Top = 364
      Width = 21
      Height = 39
      PipePosition = vpVertical
    end
    object pd2: TaOPCPipe
      Left = 304
      Top = 364
      Width = 21
      Height = 39
      PipePosition = vpVertical
    end
    object aOPCPipe48: TaOPCPipe
      Left = 156
      Top = 394
      Width = 114
    end
    object aOPCPipe49: TaOPCPipe
      Left = 198
      Top = 404
      Width = 15
      Height = 51
      GraphicOPCSource = aOPCPipe42
      PipePosition = vpVertical
    end
    object aOPCPipe51: TaOPCPipe
      Left = 254
      Top = 451
      Width = 91
    end
    object aOPCPipe52: TaOPCPipe
      Left = 237
      Top = 406
      Width = 15
      Height = 21
      GraphicOPCSource = k8
      ColorNotActive = clGray
      PipePosition = vpVertical
    end
    object p1: TaOPCPump
      Left = 344
      Top = 450
      Direction = vdRight
    end
    object aOPCPipe44: TaOPCPipe
      Left = 359
      Top = 451
      Width = 73
      GraphicOPCSource = p1
    end
    object aOPCPipe59: TaOPCPipe
      Left = 153
      Top = 489
      Width = 21
      Height = 12
      GraphicOPCSource = k20
      PipePosition = vpVertical
    end
    object aOPCPipe61: TaOPCPipe
      Left = 18
      Top = 451
      Width = 115
      GraphicOPCSource = k17
    end
    object Label10: TLabel
      Left = 332
      Top = 416
      Width = 100
      Height = 30
      Caption = #1055#1086#1076#1072#1095#1072' '#1087#1088#1086#1076#1091#1082#1090#1072' '#13#10#1085#1072' '#1089#1090#1077#1088#1080#1083#1080#1079#1072#1090#1086#1088
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object OPCGifAnimator1: TaOPCGifAnimator
      Left = 67
      Top = 280
      Width = 32
      Height = 21
      AsyncDrawing = True
      AutoSize = False
      Image.Data = {
        A60A000047494638396120001500D50000000000330000003300333300006600
        33660000990033990000CC0033CC0000FF000000333333333366336666336699
        3300006633336666666666996699996699CC6600009933339966669999999999
        CC99CCCC99CCFF990000CC9999CCCCCCCCCCFFCCFFFFCC0000FFCCCCFFFFFFFF
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000021FF0B4E45545343415045322E3003
        0100000021FE1D4275696C74207769746820474946204D6F7669652047656172
        20332E300021F90409080024002C010000001E0015000006A940927048243218
        C5A4722994389850A64412AD169DD62C69AAB572BBD12F58FA1C4BA9E6A5387D
        45B3AFE537716DA5488E03C640F269524319120D790C0D0E7D43190C161D228E
        8E1D104853140C06080A99990804482419178FA2A20B7A069AA8A8021B0CA3AE
        8E0B02A9B39947AFAE0000B4B303240C8DB7220B19190298BB080D421F110310
        8C1D1D1616797D211F0D0D0408DC08069D0388431F8153191B4AE413531219E2
        24410021F90409080024002C030000001900150000069840927048143218C5A4
        B228712C9F4989044A1536AB542916AADD2EBBDEA8331C9D9299E6F310AC265D
        DBD6343584390E18928F7BFA91D8190E7A43191016221D22870B52120D04080A
        910A080D207A1288899A891D0C039092A10219240C9BA7220B02A1AC0A0C1FA6
        A89A0000ADA148230BB2A91912ABAD080242211F03851DC8100CA41BC5040608
        080607CB451FBD5282447D5219DA410021F90409080024002C06000000130015
        0000067D40927038643088C8A450E2503A9792A79329554AA255E435ABC57297
        CD2F543C266FCD61F1F9291918259BEDC3C8707C8A1D91BE13B932100A810613
        4B167A871D0C00818C0A084D0C87920B028D8C0C2191927A008B960A47190B9B
        890D06960220241F19101D1D161718241B0D0208B805191B431F571277BDBFC1
        410021F90409080024002C090000000D001500000663409270C8600C8F478903
        C9944898482534F99C0A9DD66BD52ACD62BDDBE997BB0433439FE2C62919303E
        C2D142D4594818090542201C88FE220B010A84060D1F1180810284846F0C8A00
        008D0A46111D7F1D458D08550C1D1D00420208080354A824410021F904090800
        24002C0C00000007001500000644409290C1101A250EA350225192904E66B4A9
        94569355EA51BBE43EB15BE5005924453A0C0162128A88000005E3E35E08E4F4
        777C406288EC724F1D1205060F4B421924410021F90409080024002C0D000000
        0600150000063F401289C1100A250E23492251229D4D2313EA4C4AA347EC52FB
        BC1A1F8C41542058403E9F8200D0717C0CE58EE44300B0E784B225430210CF24
        13151F1E24410021F90409080024002C0A0000000C001500000665409250C860
        0C8F43890389944898472534F99C929CD66B752AB562BD5BE897BB0443278C90
        D333606C880805A168E98816A40D41C117044480161219067C0A020B80800C14
        857C00008A2211240286020C8A0B1F241A020802420B1D1D189C420DA75A4241
        0021F90409080024002C070000001300150000068040927028643088C8A450E2
        503A9792A79329554AA255E435ABC57297CD2F543C266FCD61F1F9F92918259B
        ADC4C8707C86990242A14034AE0C1D2283161843077C890A0200838E221D4D19
        068A7C020B8F8E4793950A008D992200770C95080C1116990B23421B0C060808
        064D1B110B1DB90C191B44195719441F57127742410021F90409080024002C04
        0000001900150000069440927048243118C5A4B228712C9F4989044A1536AB54
        2916AADD2EBBDEA8331C9D9299E6F310AC265DDBD63435946930060CC9C73DFD
        488E787A441F0C060A870A0804521211111D2291221D0B690D8898897790929D
        1D182419869988020B9DA822111FA2A4880000A99D486E08AE021912A7B20B43
        1F050D0608C3040C19241B1F0310161DCE0B0CC983B9527B457E8CD642410021
        F90409080024002C010000001F0015000006AA40927048243218C5A472399438
        9850A84412AD269DD6AC70AACD72BBD52F58FA1C4BA966A6387D45B3AFE57771
        9DFD480A8C415E92D952431912117A0C110E7D450D0D080A8D8D080603531214
        0C161D2299991D160B6E038C8EA28D0479169AA8A81D182412A1A3A3020BA9B4
        99111F1904B0B00000B5B40B7D1302BB8E0219190B98BF220B431F1F030D0608
        D590781B24211F111110971D9C10791F2145B8937C4AB88153191F45410021F9
        0409080024002C040000001900150000069440927048243118C5A4B228712C9F
        4989044A1536AB542916AADD2EBBDEA8331C9D9299E6F310AC265DDBD6343594
        6930060CC9C73DFD488E787A441F0C060A870A0804527F111D2290221D0B690D
        889789778F919C1D186E089897020B9CA622111F1986A2870000A79C0C7B0DA1
        A2021912A5B10B23421F050D0608C4040C19241B1F0310161DCF0BC77B43AA8C
        D3838C8243410021F90409080024002C070000001200150000067C4092702864
        3088C82449E2503A9792A792294D4AA255E235ABC57297CD2F543C166FCDE1EF
        D9F92918259BADC4C8707C84190242A14034AE0C1D2283161842077C89080C00
        838E221D0E0F7B897C020B8F8E0C1906957C008D9922470C9E8B1116991D511B
        0D06080806AC110B1DB61119431F1957B9BA57127724410021F9040908002400
        2C0A0000000C001500000663409250C8600C8F43890389944898472534F99C92
        9CD66B752AB562BD5BE897BB04333F1346C8E919303E44848250BC74440BD287
        A0E80B0222811D1219067D0A020B81810C14867D00008B22467C7E0C8B164F19
        020802420B1D1D46421F0D70425F410021F90409080024002C0D000000060015
        0000063E401289C1100A250E23492251229D4D2313EA4C4AA347EC52FBBC1A1D
        C408E943102C20998C4100E848D4E64E440D683328EB859B04205A364B1F1F1E
        24410021F90409080024002C0D0000000600150000063F401289C1100A250E23
        492251229D4D2313EA4C4AA347EC52FBBC4A8913E1622100903E8C05A0F1F958
        C886360400206C3E1032E143023006452418198424410021F90409080024002C
        0A0000000C001500000665409250C8600C8F43890389944898472534F99C929C
        D66B752AB562BD5BE897BB0443318C903333606C881D11A488A84F481B8868BF
        0828FE021F19167B220B027F0A061914847B0000898B240B8587890D1F241E0B
        1D0B24210208021C47119A4212159A410021F90409080024002C070000001200
        150000067C40927028643088C82449E2503A9792A792294D4AA255E235ABC572
        97CD2F543C166FCDE1EFD9F93132249BEBC7616C6C8619464724EA44AE0C080A
        0A08021F42117C8A1D0C01838F0A041B19168A8A0B029083081294967C00009A
        0A0619240C9F8C0D829002421B0C161D1D16610D0408080603877857A6BE9D43
        410021F90409080024002C040000001800150000069240927048243118C5A492
        28712C9F4589044A2535AB5029F6A9DD2ABBDEA8331C9D9299E6B310ACBEAAD7
        69682813610C18928F75FA911C070D0E7A421F0C162288221D1052120D04080A
        9208080D431189998A7691929E92001F19879A890B029FA90812A3A5890000A9
        9FAB561DAE0B1912A8B295840C11161DC2100C19241B1F0306069406050C8384
        B952D143D3ACD141003B}
      Stretch = True
      ActiveValue = '1'
      Value = '0'
    end
    object aOPCPipe62: TaOPCPipe
      Left = 67
      Top = 196
      Width = 33
      Height = 85
      PipeWidth = 2
      PipePosition = vpVertical
    end
    object Shape1: TShape
      Left = 71
      Top = 172
      Width = 25
      Height = 25
      Shape = stEllipse
    end
    object aOPCPipe63: TaOPCPipe
      Left = 323
      Top = 200
      Width = 33
      Height = 85
      PipeWidth = 2
      PipePosition = vpVertical
    end
    object Shape2: TShape
      Left = 327
      Top = 176
      Width = 25
      Height = 25
      Shape = stEllipse
    end
    object OPCGifAnimator2: TaOPCGifAnimator
      Left = 323
      Top = 284
      Width = 32
      Height = 21
      AsyncDrawing = True
      AutoSize = False
      Image.Data = {
        A60A000047494638396120001500D50000000000330000003300333300006600
        33660000990033990000CC0033CC0000FF000000333333333366336666336699
        3300006633336666666666996699996699CC6600009933339966669999999999
        CC99CCCC99CCFF990000CC9999CCCCCCCCCCFFCCFFFFCC0000FFCCCCFFFFFFFF
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000021FF0B4E45545343415045322E3003
        0100000021FE1D4275696C74207769746820474946204D6F7669652047656172
        20332E300021F90409080024002C010000001E0015000006A940927048243218
        C5A4722994389850A64412AD169DD62C69AAB572BBD12F58FA1C4BA9E6A5387D
        45B3AFE537716DA5488E03C640F269524319120D790C0D0E7D43190C161D228E
        8E1D104853140C06080A99990804482419178FA2A20B7A069AA8A8021B0CA3AE
        8E0B02A9B39947AFAE0000B4B303240C8DB7220B19190298BB080D421F110310
        8C1D1D1616797D211F0D0D0408DC08069D0388431F8153191B4AE413531219E2
        24410021F90409080024002C030000001900150000069840927048143218C5A4
        B228712C9F4989044A1536AB542916AADD2EBBDEA8331C9D9299E6F310AC265D
        DBD6343584390E18928F7BFA91D8190E7A43191016221D22870B52120D04080A
        910A080D207A1288899A891D0C039092A10219240C9BA7220B02A1AC0A0C1FA6
        A89A0000ADA148230BB2A91912ABAD080242211F03851DC8100CA41BC5040608
        080607CB451FBD5282447D5219DA410021F90409080024002C06000000130015
        0000067D40927038643088C8A450E2503A9792A79329554AA255E435ABC57297
        CD2F543C266FCD61F1F9291918259BEDC3C8707C8A1D91BE13B932100A810613
        4B167A871D0C00818C0A084D0C87920B028D8C0C2191927A008B960A47190B9B
        890D06960220241F19101D1D161718241B0D0208B805191B431F571277BDBFC1
        410021F90409080024002C090000000D001500000663409270C8600C8F478903
        C9944898482534F99C0A9DD66BD52ACD62BDDBE997BB0433439FE2C62919303E
        C2D142D4594818090542201C88FE220B010A84060D1F1180810284846F0C8A00
        008D0A46111D7F1D458D08550C1D1D00420208080354A824410021F904090800
        24002C0C00000007001500000644409290C1101A250EA350225192904E66B4A9
        94569355EA51BBE43EB15BE5005924453A0C0162128A88000005E3E35E08E4F4
        777C406288EC724F1D1205060F4B421924410021F90409080024002C0D000000
        0600150000063F401289C1100A250E23492251229D4D2313EA4C4AA347EC52FB
        BC1A1F8C41542058403E9F8200D0717C0CE58EE44300B0E784B225430210CF24
        13151F1E24410021F90409080024002C0A0000000C001500000665409250C860
        0C8F43890389944898472534F99C929CD66B752AB562BD5BE897BB0443278C90
        D333606C880805A168E98816A40D41C117044480161219067C0A020B80800C14
        857C00008A2211240286020C8A0B1F241A020802420B1D1D189C420DA75A4241
        0021F90409080024002C070000001300150000068040927028643088C8A450E2
        503A9792A79329554AA255E435ABC57297CD2F543C266FCD61F1F9F92918259B
        ADC4C8707C86990242A14034AE0C1D2283161843077C890A0200838E221D4D19
        068A7C020B8F8E4793950A008D992200770C95080C1116990B23421B0C060808
        064D1B110B1DB90C191B44195719441F57127742410021F90409080024002C04
        0000001900150000069440927048243118C5A4B228712C9F4989044A1536AB54
        2916AADD2EBBDEA8331C9D9299E6F310AC265DDBD63435946930060CC9C73DFD
        488E787A441F0C060A870A0804521211111D2291221D0B690D8898897790929D
        1D182419869988020B9DA822111FA2A4880000A99D486E08AE021912A7B20B43
        1F050D0608C3040C19241B1F0310161DCE0B0CC983B9527B457E8CD642410021
        F90409080024002C010000001F0015000006AA40927048243218C5A472399438
        9850A84412AD269DD6AC70AACD72BBD52F58FA1C4BA966A6387D45B3AFE57771
        9DFD480A8C415E92D952431912117A0C110E7D450D0D080A8D8D080603531214
        0C161D2299991D160B6E038C8EA28D0479169AA8A81D182412A1A3A3020BA9B4
        99111F1904B0B00000B5B40B7D1302BB8E0219190B98BF220B431F1F030D0608
        D590781B24211F111110971D9C10791F2145B8937C4AB88153191F45410021F9
        0409080024002C040000001900150000069440927048243118C5A4B228712C9F
        4989044A1536AB542916AADD2EBBDEA8331C9D9299E6F310AC265DDBD6343594
        6930060CC9C73DFD488E787A441F0C060A870A0804527F111D2290221D0B690D
        889789778F919C1D186E089897020B9CA622111F1986A2870000A79C0C7B0DA1
        A2021912A5B10B23421F050D0608C4040C19241B1F0310161DCF0BC77B43AA8C
        D3838C8243410021F90409080024002C070000001200150000067C4092702864
        3088C82449E2503A9792A792294D4AA255E235ABC57297CD2F543C166FCDE1EF
        D9F92918259BADC4C8707C84190242A14034AE0C1D2283161842077C89080C00
        838E221D0E0F7B897C020B8F8E0C1906957C008D9922470C9E8B1116991D511B
        0D06080806AC110B1DB61119431F1957B9BA57127724410021F9040908002400
        2C0A0000000C001500000663409250C8600C8F43890389944898472534F99C92
        9CD66B752AB562BD5BE897BB04333F1346C8E919303E44848250BC74440BD287
        A0E80B0222811D1219067D0A020B81810C14867D00008B22467C7E0C8B164F19
        020802420B1D1D46421F0D70425F410021F90409080024002C0D000000060015
        0000063E401289C1100A250E23492251229D4D2313EA4C4AA347EC52FBBC1A1D
        C408E943102C20998C4100E848D4E64E440D683328EB859B04205A364B1F1F1E
        24410021F90409080024002C0D0000000600150000063F401289C1100A250E23
        492251229D4D2313EA4C4AA347EC52FBBC4A8913E1622100903E8C05A0F1F958
        C886360400206C3E1032E143023006452418198424410021F90409080024002C
        0A0000000C001500000665409250C8600C8F43890389944898472534F99C929C
        D66B752AB562BD5BE897BB0443318C903333606C881D11A488A84F481B8868BF
        0828FE021F19167B220B027F0A061914847B0000898B240B8587890D1F241E0B
        1D0B24210208021C47119A4212159A410021F90409080024002C070000001200
        150000067C40927028643088C82449E2503A9792A792294D4AA255E235ABC572
        97CD2F543C166FCDE1EFD9F93132249BEBC7616C6C8619464724EA44AE0C080A
        0A08021F42117C8A1D0C01838F0A041B19168A8A0B029083081294967C00009A
        0A0619240C9F8C0D829002421B0C161D1D16610D0408080603877857A6BE9D43
        410021F90409080024002C040000001800150000069240927048243118C5A492
        28712C9F4589044A2535AB5029F6A9DD2ABBDEA8331C9D9299E6B310ACBEAAD7
        69682813610C18928F75FA911C070D0E7A421F0C162288221D1052120D04080A
        9208080D431189998A7691929E92001F19879A890B029FA90812A3A5890000A9
        9FAB561DAE0B1912A8B295840C11161DC2100C19241B1F0306069406050C8384
        B952D143D3ACD141003B}
      Stretch = True
      ActiveValue = '1'
      Value = '0'
    end
    object Label11: TLabel
      Left = 76
      Top = 176
      Width = 16
      Height = 15
      Caption = 'M1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label12: TLabel
      Left = 332
      Top = 180
      Width = 16
      Height = 15
      Caption = 'M2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object aOPCPipe64: TaOPCPipe
      Left = 192
      Top = 451
      Width = 47
      GraphicOPCSource = aOPCPipe74
    end
    object aOPCLabel4: TaOPCLabel
      Left = 64
      Top = 348
      Width = 6
      Height = 14
      Caption = '0'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      DisplayFormat = '# ##0'
    end
    object aOPCLabel5: TaOPCLabel
      Left = 264
      Top = 348
      Width = 6
      Height = 14
      Caption = '0'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      DisplayFormat = '# ##0'
    end
    object lMode: TaOPCLabel
      Left = 8
      Top = 20
      Width = 205
      Height = 53
      Alignment = taCenter
      AutoSize = False
      Caption = #1056#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = 89
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
      OnDblClick = lModeDblClick
      LookupList = llT1Mode
    end
    object k15: TaOPCValve
      Left = 140
      Top = 383
      OnChange = k15Change
      Kind = vkSimple
    end
    object aOPCPipe65: TaOPCPipe
      Left = 112
      Top = 394
      Width = 29
      GraphicOPCSource = pd1
    end
    object aOPCPipe66: TaOPCPipe
      Left = 286
      Top = 394
      Width = 29
      GraphicOPCSource = pd2
    end
    object k16: TaOPCValve
      Left = 270
      Top = 383
      OnChange = k15Change
      Kind = vkSimple
      Direction = vdRight
    end
    object k21: TaOPCValve
      Left = 107
      Top = 417
      Width = 25
      Height = 17
      Kind = vkHand
      Direction = vdDown
    end
    object aOPCPipe50: TaOPCPipe
      Left = 103
      Top = 402
      Width = 21
      GraphicOPCSource = pd1
      PipePosition = vpVertical
    end
    object k22: TaOPCValve
      Left = 308
      Top = 417
      Width = 25
      Height = 17
      Kind = vkHand
      Direction = vdDown
    end
    object aOPCPipe69: TaOPCPipe
      Left = 304
      Top = 401
      Width = 21
      Height = 17
      GraphicOPCSource = pd2
      PipePosition = vpVertical
    end
    object aOPCPipe70: TaOPCPipe
      Left = 103
      Top = 433
      Width = 21
      GraphicOPCSource = k21
      PipePosition = vpVertical
    end
    object aOPCPipe71: TaOPCPipe
      Left = 304
      Top = 433
      Width = 21
      GraphicOPCSource = k22
      PipePosition = vpVertical
    end
    object aOPCPipe72: TaOPCPipe
      Left = 106
      Top = 440
      Width = 15
      GraphicOPCSource = k21
    end
    object aOPCPipe73: TaOPCPipe
      Left = 307
      Top = 440
      Width = 15
      GraphicOPCSource = k22
    end
    object aOPCPipe74: TaOPCPipe
      Left = 212
      Top = 400
      Width = 17
      Height = 59
      GraphicOPCSource = aOPCPipe48
      PipePosition = vpVertical
    end
    object aOPCPipe75: TaOPCPipe
      Left = 220
      Top = 371
      Width = 23
      GraphicOPCSource = k8
      ColorNotActive = clGray
    end
    object aOPCPipe76: TaOPCPipe
      Left = 236
      Top = 377
      Width = 17
      Height = 20
      GraphicOPCSource = k8
      ColorNotActive = clGray
      PipePosition = vpVertical
    end
    object aOPCPipe77: TaOPCPipe
      Left = 244
      Top = 418
      Width = 20
      GraphicOPCSource = k8
      ColorNotActive = clGray
    end
    object k19: TaOPCValve
      Left = 238
      Top = 440
      OnChange = k8Change
      Kind = vkSimple
    end
    object k18: TaOPCValve
      Left = 175
      Top = 440
      Kind = vkSimple
      Direction = vdRight
    end
    object aOPCPipe78: TaOPCPipe
      Left = 146
      Top = 451
      Width = 28
      GraphicOPCSource = k18
    end
    object k20: TaOPCValve
      Left = 157
      Top = 473
      Width = 25
      Height = 17
      Kind = vkSimple
      Direction = vdDown
    end
    object aOPCPipe79: TaOPCPipe
      Left = 153
      Top = 459
      Width = 21
      GraphicOPCSource = k18
      PipePosition = vpVertical
    end
    object aOPCPipe80: TaOPCPipe
      Left = 156
      Top = 494
      Width = 15
      GraphicOPCSource = k20
    end
    object k17: TaOPCValve
      Left = 133
      Top = 440
      Kind = vkSimple
      Direction = vdRight
    end
    object aOPCPipe41: TaOPCPipe
      Left = 255
      Top = 424
      Width = 15
      Height = 35
      GraphicOPCSource = k8
      ColorNotActive = clGray
      PipePosition = vpVertical
    end
    object aOPCPipe42: TaOPCPipe
      Left = 198
      Top = 463
      Width = 15
      Height = 43
      GraphicOPCSource = aOPCPipe44
      PipePosition = vpVertical
    end
  end
  object llT1Mode: TaOPCLookupList
    SqlCommand = 'select id, Name from T1Mode'
    Left = 24
    Top = 260
  end
end
