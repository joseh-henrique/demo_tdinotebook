unit view.principal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus,
  ActnList, TDIClass;

type

  { TForm1 }

  TForm1 = class(TForm)
    actClientes: TAction;
    actFornecedores: TAction;
    actRepresentantes: TAction;
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    TabSheet1: TTabSheet;
    TDINoteBook1: TTDINoteBook;
    procedure actClientesExecute(Sender: TObject);
    procedure actFornecedoresExecute(Sender: TObject);
    procedure actRepresentantesExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses view.clientes, view.fornecedores, view.representantes;

{$R *.lfm}

{ TForm1 }

procedure TForm1.actClientesExecute(Sender: TObject);
var
  i:Integer;
begin
  // O codigo abaixo é para ser didático, você que é experiente cortará
  // metade dessas linhas
  i:=TDINoteBook1.FindFormInPages(fmClientes);
  if i<0 then  // não existe, então cria
  begin
    fmClientes:=TfmClientes.Create(Self);
    TDINoteBook1.ShowFormInPage(fmClientes, 0);
  end
  else
  begin
    // se existe, então é apenas embutir na tab 0
    TDINoteBook1.ShowFormInPage(fmClientes, 0);
  end;
end;

procedure TForm1.actFornecedoresExecute(Sender: TObject);
var
  i:Integer;
begin
  // O codigo abaixo é para ser didático, você que é experiente cortará
  // metade dessas linhas
  i:=TDINoteBook1.FindFormInPages(fmFornecedores);
  if i<0 then  // não existe, então cria
  begin
    fmFornecedores:=TfmFornecedores.Create(Self);
    TDINoteBook1.ShowFormInPage(fmFornecedores, 0);
  end
  else
  begin
    // se existe, então é apenas embutir na tab 0
    TDINoteBook1.ShowFormInPage(fmFornecedores, 0);
  end;
end;

procedure TForm1.actRepresentantesExecute(Sender: TObject);
var
  i:Integer;
begin
  // O codigo abaixo é para ser didático, você que é experiente cortará
  // metade dessas linhas
  i:=TDINoteBook1.FindFormInPages(fmRepresentantes);
  if i<0 then  // não existe, então cria
  begin
    fmRepresentantes:=TfmRepresentantes.Create(Self);
    TDINoteBook1.ShowFormInPage(fmRepresentantes, 0);
  end
  else
  begin
    // se existe, então é apenas embutir na tab 0
    TDINoteBook1.ShowFormInPage(fmRepresentantes, 0);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Ele cobrirá a área inteira
  TDINoteBook1.Align:=alClient;
  // Se as janelas suas tiver um botão de fechar ou sair então é bom
  // esconder o botão de fechar "X" na tab
  //TDINoteBook1.CloseTabButtom:=tbNone;
  // nboHidePageListPopup: Não tem popup para mostrar as tabs(paginas)
  // nboShowAddTabButton: Não mostra opção para adicionar nova tab
  // nboShowCloseButtons: Botões de fechar não serão exibidos
  TDINoteBook1.Options:=[nboHidePageListPopup, nboShowAddTabButton, nboShowCloseButtons];
  // Não mostra a orelhinha das tabs
  TDINoteBook1.ShowTabs:=false;
  // Como se trata de um aplicativo comercial e não um navegador então
  // é melhor esconder outros botões
  TDINoteBook1.TDIActions.CloseAllTabs.Visible:=false;
  TDINoteBook1.TDIActions.CloseTab.Visible:=false;
  TDINoteBook1.TDIActions.NextTab.Visible:=false;
  TDINoteBook1.TDIActions.PreviousTab.Visible:=false;
  TDINoteBook1.TDIActions.TabsMenu.Visible:=false;
  // deixa ao menos 1 tab para servir de container de outros forms
  if TDINoteBook1.PageCount<1 then
    TDINoteBook1.AddTabSheet;
  // A primeira tab nunca poderá ser fechada
  // Isso garante que sempre terá uma tab
  TDINoteBook1.FixedPages:=0;

end;

end.

