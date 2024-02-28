object frmMensagem: TfrmMensagem
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 280
  ClientWidth = 648
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundoMensagem: TPanel
    Left = 0
    Top = 0
    Width = 648
    Height = 280
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitHeight = 301
    object shFundoMensagem: TShape
      Left = 1
      Top = 1
      Width = 646
      Height = 278
      Align = alClient
      ExplicitHeight = 256
    end
    object lblTitulo: TLabel
      Left = 24
      Top = 16
      Width = 87
      Height = 25
      Caption = 'ATEN'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object imgMensagem: TImage
      Left = 24
      Top = 72
      Width = 169
      Height = 161
      Stretch = True
    end
    object lblSubTitulo: TLabel
      Left = 232
      Top = 96
      Width = 66
      Height = 25
      Caption = 'T'#205'TULO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMensagem: TLabel
      Left = 232
      Top = 135
      Width = 157
      Height = 17
      Caption = 'Mensagem para o Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 1
      Top = 49
      Width = 646
      Height = 1
      Color = clSilver
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 312
        Top = -8
        Width = 33
        Height = 13
        Caption = 'Label1'
      end
    end
    object pnlBtnCancelar: TPanel
      Left = 288
      Top = 208
      Width = 153
      Height = 49
      Align = alCustom
      BevelOuter = bvNone
      Color = 15921906
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -35
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object btnNao: TSpeedButton
        Left = 0
        Top = 0
        Width = 153
        Height = 49
        Align = alClient
        Caption = 'N'#195'O (ESC)'
        Flat = True
        OnClick = btnNaoClick
        ExplicitWidth = 129
      end
    end
    object pnlBtnConfirmar: TPanel
      Left = 465
      Top = 208
      Width = 153
      Height = 49
      Align = alCustom
      BevelOuter = bvNone
      Color = 15775759
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -35
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      object btnSim: TSpeedButton
        Left = 0
        Top = 0
        Width = 153
        Height = 49
        Align = alClient
        Caption = 'SIM (ENTER)'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -35
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnSimClick
        ExplicitLeft = -120
        ExplicitTop = -57
        ExplicitWidth = 257
        ExplicitHeight = 90
      end
    end
  end
end
