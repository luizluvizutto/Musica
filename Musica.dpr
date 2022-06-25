program Musica;

uses
  Vcl.Forms,
  Un_Principal in 'Un_Principal.pas' {Form1},
  Un_Notas in 'Un_Notas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
