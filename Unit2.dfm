object Form2: TForm2
  Left = 351
  Top = 208
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 190
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 120
    Top = 160
    Width = 57
    Height = 25
    Caption = 'OK'
    OnClick = SpeedButton1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 137
    Height = 145
    Caption = #1042#1077#1088#1096#1080#1085#1099
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 26
      Width = 86
      Height = 13
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1074#1077#1088#1096#1080#1085':'
    end
    object Label2: TLabel
      Left = 8
      Top = 54
      Width = 114
      Height = 13
      Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1074#1077#1088#1096#1080#1085#1099':'
    end
    object Label3: TLabel
      Left = 8
      Top = 74
      Width = 16
      Height = 13
      Caption = 'X ='
    end
    object Label4: TLabel
      Left = 72
      Top = 74
      Width = 16
      Height = 13
      Caption = 'Y ='
    end
    object Edit1: TEdit
      Left = 96
      Top = 24
      Width = 33
      Height = 21
      TabOrder = 0
      Text = '1'
    end
    object Edit2: TEdit
      Left = 32
      Top = 72
      Width = 33
      Height = 21
      TabOrder = 1
      Text = '50'
    end
    object Edit3: TEdit
      Left = 96
      Top = 72
      Width = 33
      Height = 21
      TabOrder = 2
      Text = '50'
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 120
      Width = 121
      Height = 17
      Caption = #1057#1083#1091#1095#1072#1081#1085#1072#1103' '#1087#1086#1079#1080#1094#1080#1103
      TabOrder = 3
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 98
      Width = 121
      Height = 17
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1080#1084#1077#1085#1072
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = CheckBox2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 152
    Top = 8
    Width = 137
    Height = 145
    Caption = #1056#1077#1073#1088#1072
    TabOrder = 1
    object Label5: TLabel
      Left = 14
      Top = 24
      Width = 109
      Height = 13
      Caption = #1060#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1074#1077#1089':'
    end
    object SpeedButton2: TSpeedButton
      Left = 8
      Top = 112
      Width = 121
      Height = 25
      Caption = #1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1074#1077#1089#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object Edit4: TEdit
      Left = 48
      Top = 40
      Width = 33
      Height = 21
      TabOrder = 0
      Text = '1'
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 74
      Width = 113
      Height = 17
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074#1077#1089#1072
      TabOrder = 1
      OnClick = CheckBox3Click
    end
  end
end
