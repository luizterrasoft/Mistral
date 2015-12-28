unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs, Serial, StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    btnClearMemo: TSpeedButton;
    btnConnect: TButton;
    btnDisconnect: TButton;
    Panel2: TPanel;
    Edit1: TEdit;
    btnSend: TButton;
    btnFlushRX: TButton;
    btnReadResult: TButton;
    btnSetup: TButton;
    SerialPort1: TSerialPort;
    AZCheckBox1: TCheckBox;
    Timer1: TTimer;
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure btnReadResultClick(Sender: TObject);
    procedure btnClearMemoClick(Sender: TObject);
    procedure btnFlushRXClick(Sender: TObject);
    procedure btnSetupClick(Sender: TObject);
    procedure SerialPort1AfterTransmit(Sender: TObject; data: string);
    procedure SerialPort1AfterReceive(Sender: TObject; data: string);
    procedure AZCheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    Junk : shortstring;
  end;

var
  Form1: TForm1;

implementation

uses comsetup;

{$R *.DFM}

// Open the port and handle some GUI.
procedure TForm1.btnConnectClick(Sender: TObject);
begin
  if SerialPort1.OpenPort(cpCOM2) then begin
    btnConnect.enabled := false;
    btnDisconnect.enabled := true;
    btnReadResult.enabled := true;
    btnSend.enabled := true;
    btnFlushRX.enabled := true;
    btnSetup.enabled := false;
    beep;
  end else begin
    showmessage('Couldn''t open port');
  end;
end;

// Disconnect the port and handle some GUI.
procedure TForm1.btnDisconnectClick(Sender: TObject);
begin
  if SerialPort1.ClosePort then begin
    btnConnect.enabled := true;
    btnDisconnect.enabled := false;
    btnReadResult.enabled := false;
    btnSend.enabled := false;
    btnFlushRX.enabled := false;
    btnSetup.enabled := true;
  end else begin
    showmessage('Couldn''t close port');
  end;
end;

// Send the contents of the edit box, with
// a carriage return to 'wake up' the modem.
procedure TForm1.btnSendClick(Sender: TObject);
var
  s: pchar;
  OldTransmitEvent : TNotifyTXEvent;
begin
  s := pchar(Edit1.Text);
  SerialPort1.SendData(s, Length(s));

  // Send in the carriage return.
  OldTransmitEvent := SerialPort1.AfterReceive;
  SerialPort1.AfterReceive := nil;
  SerialPort1.SendData((chr(13)), 1);
  SerialPort1.AfterReceive := OldTransmitEvent;
end;

// Read the data in the receive buffer.
procedure TForm1.btnReadResultClick(Sender: TObject);
begin
  SerialPort1.getdata;
  // You should consider adding a property to 'AutoFlush' on
  // getdata.
  SerialPort1.FlushRX;
end;

// Just clear the memo box.
procedure TForm1.btnClearMemoClick(Sender: TObject);
begin
  memo1.lines.clear;
end;

// Flush the Rx buffer.  Then try 'read result'.
procedure TForm1.btnFlushRXClick(Sender: TObject);
begin
  SerialPort1.FlushRX;
end;

// Setup the serial port.
procedure TForm1.btnSetupClick(Sender: TObject);
begin
  // Very cool.  I pass the serial port into
  // the setup dialog, and let the dialog
  // set up the port then pass it back.
  frmSetup.Setup(SerialPort1);
end;

// After transmitting, update the memo field.
procedure TForm1.SerialPort1AfterTransmit(Sender: TObject; data: string);
begin
  Memo1.Lines.Add(data);
  Memo1.Update;
end;

// After receive, update the memo.
procedure TForm1.SerialPort1AfterReceive(Sender: TObject; data: string);
begin
  if data <> '' then begin
    Memo1.Lines.Add(data);
    Memo1.Update;
  end;
end;

// Provide method to read from the port on a timer.
procedure TForm1.AZCheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled := AZCheckBox1.Checked;
end;

// Timer reading from port.
procedure TForm1.Timer1Timer(Sender: TObject);
begin
  btnReadResultClick(nil);
end;

end.
