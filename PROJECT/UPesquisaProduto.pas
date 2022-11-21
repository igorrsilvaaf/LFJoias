unit UPesquisaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrm_pesquisa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    CbFiltro: TComboBox;
    Label2: TLabel;
    EdtPesquisa: TEdit;
    BtnImprimir: TBitBtn;
    BtnLimpar: TBitBtn;
    BtnPesquisa: TBitBtn;
    GridProduto: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_pesquisa: TFrm_pesquisa;

implementation

{$R *.dfm}

end.
