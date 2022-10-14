object form_profissionais: Tform_profissionais
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'form_profissionais'
  ClientHeight = 280
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 585
    Height = 280
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 9
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitHeight = 377
    object Label1: TLabel
      Left = 27
      Top = 54
      Width = 61
      Height = 15
      Caption = 'Profissional'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 351
      Top = 111
      Width = 37
      Height = 15
      Caption = 'Celular'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 27
      Top = 111
      Width = 71
      Height = 15
      Caption = 'Especialidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 26
      Top = 14
      Width = 168
      Height = 15
      Caption = 'CADASTRO DE PROFISSIONAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape1: TShape
      Left = 27
      Top = 35
      Width = 534
      Height = 1
      Pen.Color = clGrayText
    end
    object cb_profissional: TComboBox
      Left = 23
      Top = 178
      Width = 313
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object ed_profissional: TEdit
      Left = 26
      Top = 75
      Width = 310
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object mkCelular: TMaskEdit
      Left = 351
      Top = 132
      Width = 158
      Height = 23
      EditMask = '!\(999\)0000-0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 2
      Text = '(   )    -    '
    end
    object ed_observacao: TEdit
      Left = 26
      Top = 132
      Width = 310
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object Panel5: TPanel
      Left = 153
      Top = 217
      Width = 108
      Height = 38
      Color = clHotLight
      ParentBackground = False
      TabOrder = 4
      object btn_confirmar: TSpeedButton
        Left = 1
        Top = 1
        Width = 106
        Height = 36
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Confirmar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 0
      end
    end
    object Panel6: TPanel
      Left = 304
      Top = 217
      Width = 108
      Height = 38
      Color = clAppWorkSpace
      ParentBackground = False
      TabOrder = 5
      object btn_cancelar: TSpeedButton
        Left = 1
        Top = 1
        Width = 106
        Height = 36
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Cancelar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitTop = 0
      end
    end
  end
end
