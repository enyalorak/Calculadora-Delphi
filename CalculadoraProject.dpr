program CalculadoraProject;

uses
  Vcl.Forms,
  Calculadora in 'Calculadora.pas' {btSomar},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glow');
  Application.CreateForm(TbtSomar, btSomar);
  Application.Run;
end.
