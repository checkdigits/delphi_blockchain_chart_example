unit blockchain_chart_test;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, REST.Types,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, VCLTee.TeEngine,
  VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, System.JSON, Vcl.DBCtrls, VCLTee.DBChart,
  VCLTee.TeeDBCrossTab, VCLTee.TeeData, Generics.Collections;

type
  TForm1 = class(TForm)
    Button1: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    FDMemTable1x: TWideStringField;
    FDMemTable1y: TWideStringField;
    DBChart1: TDBChart;
    Series1: TLineSeries;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i : integer;
begin
  FDMemTable1.Close;
  RESTRequest1.Execute;
  FDMemTable1.Open;
  FDMemTable1.First;
  for i:=0 to FDMemTable1.Table.Rows.Count - 1 do
  Begin
    With Series1 do
    begin
      AddXY(FDMemTable1x.Value.ToDouble(), FDMemTable1y.Value.ToDouble());
    end;
      FDMemTable1.Next;
  end;
end;

end.
