unit UProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  dxGDIPlusClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmProduto = class(TForm)
    Panel1: TPanel;
    BtnIncluir: TBitBtn;
    BtnSalvar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnDeletar: TBitBtn;
    BtnPesquisar: TBitBtn;
    PgCadastroProdutos: TPageControl;
    Cadastros: TTabSheet;
    EdtCodBarras: TDBEdit;
    Label1: TLabel;
    EdtCodReferencia: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CbAtivo: TDBComboBox;
    Label5: TLabel;
    DbTipoProduto: TDBComboBox;
    Label6: TLabel;
    CbUsoConsumo: TDBComboBox;
    Label7: TLabel;
    CbPermiteVenda: TDBComboBox;
    Label8: TLabel;
    GbDetalhes: TGroupBox;
    CbGrupoProduto: TDBComboBox;
    Label9: TLabel;
    CbCategoria: TDBComboBox;
    Label10: TLabel;
    EdtFornecedor: TDBEdit;
    Label11: TLabel;
    EdtEstoque: TDBEdit;
    Label12: TLabel;
    EdtMarca: TDBEdit;
    Label13: TLabel;
    GpValoresProduto: TGroupBox;
    EdtValorCompra: TDBEdit;
    Label14: TLabel;
    EdtValorVenda: TDBEdit;
    Label15: TLabel;
    EdtLucro: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    EdtPromoAtacado: TDBEdit;
    Label19: TLabel;
    EdtQtdAtacado: TDBEdit;
    Label20: TLabel;
    EdtLucroAtacado: TDBEdit;
    Label21: TLabel;
    MObservacao: TDBMemo;
    Label22: TLabel;
    ImgLogo: TImage;
    ImgJoia: TImage;
    Conexao: TFDConnection;
    Q_Principal: TFDQuery;
    DriverPG: TFDPhysPgDriverLink;
    DsProduto: TDataSource;
    Q_Principalid_produto: TIntegerField;
    Q_Principalcod_barras: TWideStringField;
    Q_Principalcod_referencia: TWideStringField;
    Q_Principaldesc_completa: TWideStringField;
    Q_Principaldesc_resumida: TWideStringField;
    Q_Principalflg_ativo: TWideStringField;
    Q_Principaltipo_produto: TWideStringField;
    Q_Principaluso_consumo: TWideStringField;
    Q_Principalpermite_venda: TWideStringField;
    Q_Principalgrupo: TWideStringField;
    Q_Principalcategoria: TWideStringField;
    Q_Principalmarca: TWideStringField;
    Q_Principalfornecedor: TWideStringField;
    Q_Principalestoque: TFloatField;
    Q_Principalvlr_compra: TFloatField;
    Q_Principalvlr_venda: TFloatField;
    Q_Principallucro_varejo: TFloatField;
    Q_Principalqtd_atacado: TIntegerField;
    Q_Principalvlr_venda_atacado: TFloatField;
    Q_Principallucro_atacado: TFloatField;
    Q_Principalobservacao: TWideStringField;
    EdtDescCompleta: TDBEdit;
    EdtDescResumida: TDBEdit;
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProduto: TFrmProduto;

implementation

uses
  TelaPrincipal, UPesquisaProduto;

{$R *.dfm}

procedure TFrmProduto.BtnAlterarClick(Sender: TObject);
begin
  Q_Principal.Edit;
end;

procedure TFrmProduto.BtnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes   then
    begin
      Q_Principal.Cancel;
    end
    else
    Abort;
end;

procedure TFrmProduto.BtnDeletarClick(Sender: TObject);
begin
  if MessageDlg('Deseja remover o cadastro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Q_Principal.Delete;
    end
    else
    Abort;
end;

procedure TFrmProduto.BtnIncluirClick(Sender: TObject);
begin
  Q_Principal.Active := True;
  Q_Principal.Append;
end;

procedure TFrmProduto.BtnPesquisarClick(Sender: TObject);
begin
  Frm_pesquisa := Tfrm_pesquisa.Create(self);
  Frm_pesquisa.ShowModal;
  try

  finally
    Frm_Pesquisa.Free;
    Frm_Pesquisa := nil;
  end;
end;

procedure TFrmProduto.BtnSalvarClick(Sender: TObject);
begin
  try
    Q_Principal.Post;
    MessageDlg('Registro salvo com sucesso', mtInformation, [mbOk], 0);
  except on E: Exception do
    begin
    if E.message.Contains('not-null')then
      begin
         ShowMessage('Campo obrigatório');
      end
    else
      begin
        ShowMessage('Preencha os campos Obrigatorios' + sLineBreak + E.Message);
      end;

    end;
  end;
end;

end.
