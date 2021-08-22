program blockchain_chart;

uses
  Vcl.Forms,
  blockchain_chart_test in 'blockchain_chart_test.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
