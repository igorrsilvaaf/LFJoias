
program PSYMTER;

uses
  Vcl.Forms,
  TelaPrincipal in '..\DCU\TelaPrincipal.pas' {FrmTelaPrincipal},
  UClientes in '..\DCU\UClientes.pas' {FrmClientes},
  UPesquisaClientes in 'UPesquisaClientes.pas' {FrmPesquisaClientes},
  UContatos in 'UContatos.pas' {FrmContatos},
  UPesquisaContatos in 'UPesquisaContatos.pas' {FrmPesquisaContatos},
  UProduto in 'UProduto.pas' {FrmProduto},
  URelatorios in 'URelatorios.pas' {FormRelatorios},
  UPesquisaProduto in 'UPesquisaProduto.pas' {Frm_pesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmTelaPrincipal, FrmTelaPrincipal);
  Application.CreateForm(TFormRelatorios, FormRelatorios);
  Application.CreateForm(TFrm_pesquisa, Frm_pesquisa);
  Application.Run;
end.
