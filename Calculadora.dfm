object btSomar: TbtSomar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Calculadora'
  ClientHeight = 406
  ClientWidth = 269
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 53
    Height = 15
    Caption = 'N'#250'mero 1'
  end
  object Label2: TLabel
    Left = 8
    Top = 112
    Width = 53
    Height = 15
    Caption = 'N'#250'mero 2'
  end
  object Label3: TLabel
    Left = 8
    Top = 226
    Width = 52
    Height = 15
    Caption = 'Resultado'
  end
  object txtNum1: TEdit
    Left = 8
    Top = 69
    Width = 198
    Height = 23
    TabOrder = 0
    OnChange = txtNum1Change
  end
  object txtNum2: TEdit
    Left = 8
    Top = 133
    Width = 198
    Height = 23
    TabOrder = 1
    OnChange = txtNum1Change
  end
  object btSomar: TButton
    Left = 20
    Top = 184
    Width = 41
    Height = 25
    Caption = '+'
    Enabled = False
    TabOrder = 2
    OnClick = btSomarClick
  end
  object btSubtrair: TButton
    Left = 67
    Top = 184
    Width = 41
    Height = 25
    Caption = '-'
    Enabled = False
    TabOrder = 3
    OnClick = btSubtrairClick
  end
  object btMultiplicar: TButton
    Left = 114
    Top = 184
    Width = 41
    Height = 25
    Caption = '*'
    Enabled = False
    TabOrder = 4
    OnClick = btMultiplicarClick
  end
  object btDividir: TButton
    Left = 161
    Top = 184
    Width = 41
    Height = 25
    Caption = '/'
    Enabled = False
    TabOrder = 5
    OnClick = btDividirClick
  end
  object txtResultado: TEdit
    Left = 8
    Top = 247
    Width = 198
    Height = 23
    TabOrder = 6
  end
  object opcVisual: TRadioGroup
    Left = 21
    Top = 276
    Width = 185
    Height = 105
    Caption = 'Alterar Visual'
    Items.Strings = (
      'Windows Classic'
      'Glow'
      'Aqua Ligth Slate')
    TabOrder = 7
    OnClick = opcVisualClick
  end
end
