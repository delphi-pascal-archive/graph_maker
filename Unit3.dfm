object Form3: TForm3
  Left = 310
  Top = 224
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1058#1072#1073#1083#1080#1094#1072' '#1074#1077#1089#1086#1074
  ClientHeight = 292
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 168
    Top = 264
    Width = 81
    Height = 25
    Caption = 'OK'
    OnClick = SpeedButton1Click
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 401
    Height = 257
    DefaultColWidth = 25
    DefaultRowHeight = 25
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
    OnSetEditText = StringGrid1SetEditText
  end
end
