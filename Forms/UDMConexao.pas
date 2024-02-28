unit UDMConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.UI, UClasseConexao, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef;

type
  TfrmDados = class(TDataModule)
    FDConnection: TFDConnection;
    FBDriver: TFDPhysFBDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    MySQLDriver: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    Conexao : Tconexao;
  end;

var
  frmDados: TfrmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TfrmDados.DataModuleCreate(Sender: TObject);
begin
  Conexao := Tconexao.Create( FDConnection );
end;

procedure TfrmDados.DataModuleDestroy(Sender: TObject);
begin
  Conexao.Destroy;
end;

end.
