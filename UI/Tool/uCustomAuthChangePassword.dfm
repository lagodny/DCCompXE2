object CustomAuthChangePassword: TCustomAuthChangePassword
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Change password'
  ClientHeight = 163
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lUser: TLabel
    Left = 16
    Top = 16
    Width = 55
    Height = 13
    Caption = 'User name:'
  end
  object lOldPassword: TLabel
    Left = 16
    Top = 43
    Width = 69
    Height = 13
    Caption = 'Old password:'
  end
  object lNewPassword: TLabel
    Left = 16
    Top = 70
    Width = 74
    Height = 13
    Caption = 'New password:'
  end
  object lConfirmation: TLabel
    Left = 16
    Top = 97
    Width = 65
    Height = 13
    Caption = 'Confirmation:'
  end
  object bOk: TButton
    Left = 171
    Top = 127
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 4
    OnClick = bOkClick
  end
  object bCancel: TButton
    Left = 251
    Top = 127
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
  end
  object eUser: TEdit
    Left = 117
    Top = 13
    Width = 209
    Height = 21
    TabOrder = 0
    Text = 'eUser'
  end
  object eNewPassword: TMaskEdit
    Left = 117
    Top = 67
    Width = 209
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object eConfirmation: TMaskEdit
    Left = 117
    Top = 94
    Width = 209
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
  end
  object eOldPassword: TMaskEdit
    Left = 117
    Top = 40
    Width = 209
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
end
