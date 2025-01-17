unit Calculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Styles, Vcl.Themes;

type
  TbtSomar = class(TForm)
    Label1: TLabel;
    txtNum1: TEdit;
    Label2: TLabel;
    txtNum2: TEdit;
    btSomar: TButton;
    btSubtrair: TButton;
    btMultiplicar: TButton;
    btDividir: TButton;
    Label3: TLabel;
    txtResultado: TEdit;
    opcVisual: TRadioGroup;
    procedure btSomarClick(Sender: TObject);
    procedure btSubtrairClick(Sender: TObject);
    procedure btMultiplicarClick(Sender: TObject);
    procedure btDividirClick(Sender: TObject);
    procedure opcVisualClick(Sender: TObject);
    procedure txtNum1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function calcularResultado(num1, num2: Real; operacao: String): Real;
    function validarCampos(): Boolean;
    procedure habilitarBotoes(habilitado: Boolean);
    procedure registrarLog(acao: String);
  public
    { Public declarations }
  end;

var
  btSomar: TbtSomar;

implementation

{$R *.dfm}



      //ctrl shift c - implementa a procedure ou funcao
  //    procedimento nao tem retorno
//      funcao tem retorno



//funcao geralmente n manipula elementos de tela e sim faz opera�oes
//que � enviada pra outro codigo p manipular elementos de tela


 { TbtMultiplicar }
procedure TbtSomar.btMultiplicarClick(Sender: TObject);
begin
  if validarCampos then
    begin
       txtResultado.Text := FloatToStr(calcularResultado(StrToFloat(txtNum1.Text), StrToFloat(txtNum2.Text),'multiplicar'));
       registrarLog('Multiplica��o, num1='+txtNum1.Text+', num2='+txtNum2.Text+', Resultado='+txtResultado.Text);
    end;

end;


      { TbtSomar }
procedure TbtSomar.btSomarClick(Sender: TObject);
begin
    if validarCampos then
    begin
      txtResultado.Text := FloatToStr(calcularResultado(StrToFloat(txtNum1.Text), StrToFloat(txtNum2.Text),'somar'));
      registrarLog('Soma, num1='+txtNum1.Text+', num2='+txtNum2.Text+', Resultado='+txtResultado.Text);
    end;
end;

  { TbtSubtrair }
procedure TbtSomar.btSubtrairClick(Sender: TObject);
begin
  if validarCampos then
  begin
     txtResultado.Text := FloatToStr(calcularResultado(StrToFloat(txtNum1.Text), StrToFloat(txtNum2.Text),'subtrair'));
    registrarLog('Subtrair, num1='+txtNum1.Text+', num2='+txtNum2.Text+', Resultado='+txtResultado.Text);
  end;

end;


     { TbtDividir }
procedure TbtSomar.btDividirClick(Sender: TObject);
begin
  if validarCampos then
    begin
        if txtNum2.Text = '0' then
          begin
             ShowMessage('Impossivel dividir por 0');
             registrarLog('Erro de divis�o por zero');
          end

        else
          begin
            txtResultado.Text := FloatToStr(calcularResultado(StrToFloat(txtNum1.Text), StrToFloat(txtNum2.Text),'dividir'));
            registrarLog('Dividir, num1='+txtNum1.Text+', num2='+txtNum2.Text+', Resultado='+txtResultado.Text);
          end;

    end;
end;




function TbtSomar.calcularResultado(num1, num2: Real; operacao: String): Real;
var
  resultado : Real;
begin
      if operacao = 'somar' then
        resultado := num1 + num2;

      if operacao = 'subtrair' then
        resultado := num1 - num2;

      if operacao = 'multiplicar' then
        resultado := num1 * num2;

      if operacao = 'dividir' then
        resultado := num1 / num2;

      Result := resultado;
end;

procedure TbtSomar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  registrarLog('Aplica��o Encerrada!');
  registrarLog('----------------------------');
end;

procedure TbtSomar.FormCreate(Sender: TObject);
begin
  registrarLog('----------------------------');
  registrarLog('Aplica��o Iniciada');
end;

procedure TbtSomar.habilitarBotoes(habilitado: Boolean);
begin
  btSomar.Enabled := habilitado;
  btSubtrair.Enabled := habilitado;
  btMultiplicar.Enabled := habilitado;
  btDividir.Enabled := habilitado;
end;

procedure TbtSomar.opcVisualClick(Sender: TObject);
begin
  case opcVisual.ItemIndex of
    0:
      begin
        TStyleManager.SetStyle('Windows');
        registrarLog('Visual da aplica��o alterado para Windows')
      end;

    1:
      begin
        TStyleManager.SetStyle('Glow');
        registrarLog('Visual da aplica��o alterado para Glow');
      end;

    2:
      begin
         TStyleManager.SetStyle('Aqua Light Slate');
         registrarLog('Visual da aplica��o alterado para Aqua Light Slate');
      end;

  end;

end;

procedure TbtSomar.registrarLog(acao: String);
var
  arquivo: TextFile;  //  manipula��o de arquivos de texto
begin
  try
    //associa o arquivo 'Logs.txt' � vari�vel 'arquivo', permitindo que seja manipulado
    AssignFile(arquivo, 'Logs.txt');

    // verifica se o arquivo 'Logs.txt' j� existe no diret�rio
    if FileExists('Logs.txt') then
      // Se o arquivo j� existir, abre no modo de adi��o (Append) para inserir novas linhas ao final do arquivo
      Append(arquivo)
    else
      // Caso o arquivo n�o exista, cria um novo arquivo com o nome 'Logs.txt'
      Rewrite(arquivo);

    // Escreve uma linha no arquivo de log com a data/hora atual e a a��o que est� acontecendo
    Writeln(arquivo, '['+DateTimeToStr(now()) +'] - ' + acao);
    // Grava a a��o passada como par�metro no arquivo
  finally
    //`finally` garante que o arquivo seja fechado,
    //mesmo que ocorra um erro durante a execu��o
    // se o arquivo foi aberto com sucesso, precisa ser fechado ap�s a manipula��o
    CloseFile(arquivo);
  end;
end;


procedure TbtSomar.txtNum1Change(Sender: TObject);
begin
  if validarCampos then
    habilitarBotoes(True)
  else
    habilitarBotoes(False);

end;



function TbtSomar.validarCampos: Boolean;
begin
  // Verifica se os campos de texto est�o vazios
  // Se txtNum1 ou txtNum2 estiverem vazios, retorna False
  if (txtNum1.Text = '' ) or (txtNum2.Text = '') then
    Result := False
  else
    try
      // Tenta converter o texto dos campos txtNum1 e txtNum2 para Float
      StrToFloat(txtNum1.Text);  // Se a convers�o falhar, um erro ser� levantado
      StrToFloat(txtNum2.Text);  // Mesma verifica��o para o segundo campo

      // Se a convers�o der certo  para ambos os campos, retorna True
      Result := True;
    except
      // Captura erros espec�ficos de convers�o num�rica (EConvertError)
      // Caso ocorra um erro de convers�o (valor n�o num�rico), o programa entra aqui
      on E: EConvertError do
      begin
        // Retorna False se houver erro de convers�o
        Result := False;
      end;
    end;
end;







end.




