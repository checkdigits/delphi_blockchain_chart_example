object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 450
  ClientWidth = 801
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 710
    Top = 394
    Width = 75
    Height = 25
    Caption = 'Get Data'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBChart1: TDBChart
    Left = 8
    Top = 29
    Width = 777
    Height = 359
    Title.Text.Strings = (
      'TDBChart')
    View3D = False
    TabOrder = 1
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://api.blockchain.info/charts/transactions-per-second'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 256
    Top = 400
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 128
    Top = 400
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    RootElement = 'values'
    Left = 192
    Top = 400
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Active = True
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    NestedElements = True
    Left = 72
    Top = 400
  end
  object FDMemTable1: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'x'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'y'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 16
    Top = 400
    object FDMemTable1x: TWideStringField
      FieldName = 'x'
      Size = 255
    end
    object FDMemTable1y: TWideStringField
      FieldName = 'y'
      Size = 255
    end
  end
end
