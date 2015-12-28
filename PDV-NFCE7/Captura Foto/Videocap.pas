unit Videocap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,stdctrls,
  ExtCtrls,vfw,mmsystem,syncobjs;

 ///////////////////////////////////////////////////////////////////////////////
// Video Capturing

type
// Types for audio-settings
  TChannel = (Stereo, Mono);
  TFrequency = (f8000Hz, f11025Hz, f22050Hz, f44100Hz);
  TResolution  = (r8Bit, r16Bit);


// Types for event-procedures
type
  TCapStatusProc = procedure(Sender: TObject) of object;
  TCapStatusCallback = procedure (Sender:TObject;nID:Integer;status:String) of object;
  TVideoStream = procedure (sender:TObject;lpVhdr:PVIDEOHDR) of object;
  TAudioStream = procedure (sender:TObject;lpWHdr:PWAVEHDR) of object;
  TError       = procedure (sender:TObject;nID:Integer; errorstr:String) of object;


// Exceptions
type
  ENoDriverException      = class(Exception)
    ;

type
  ENoCapWindowException   = class(Exception)
    ;

type
  ENotConnectException    = class(Exception)
    ;

type
  ENoOverlayException     = class(Exception)
    ;

type
  EFalseFormat            = class(Exception)
    ;

type
  ENotOpen                = class(Exception)
    ;

type
  EBufferFileError        = class(Exception)
    ;


type
  TAudioFormat = class (TPersistent)
  private
    FChannels :TChannel;
    FFrequency:TFrequency;
    FRes      :TResolution;
  private
    procedure SetAudio(handle:Thandle); // Setting Audio Data to Capture Window

  public
    constructor create;

  published
    property Channels: TChannel read FChannels write Fchannels     default Mono;
    property Frequency: TFrequency read FFrequency write fFrequency default f8000Hz;
    property Resolution : TResolution read FRes write FRes         default r8Bit;
  end;





type
  TVideoCap = class(TCustomControl)
  private

    fdriverIndex:Integer;   // Videodriver index
    fVideoDriverName     : String;  // name of videodriver
    fhCapWnd             : THandle;  // handle for CAP-Window
    fpDrivercaps         : PCapDriverCaps; // propertys of videodriver
    fpDriverStatus       : pCapStatus; // status of capdriver
    fscale               : Boolean;  // window scaling
    fprop                : Boolean;  // proportional scaling
    fpreviewrate         : Word;  // Frames p. sec during preview
    fmicrosecpframe      : Cardinal; // framerate as microsconds
    fCapVideoFileName    : String; // name of the capture file
    fTempFileName        : String; // Name of temporary avi-file
    fTempFileSize        : Word; // size of Tmp- File in MB

    fCapSingleImageFileName : String; // name of the file for a single image
    fcapAudio               :Boolean; // Capture also audio stream
    fcapTimeLimit           :Word;    // Time limit for captureing
    fIndexSize             :Cardinal; // size of the index in the capture file
    fcapToFile             : Boolean;  // Write frames to file druing capturing
    FAudioFormat           : TAudioFormat;// Audio Format
    fCapStatusProcedure     : TCapStatusProc;      // Event procedure for internal component status
    fcapStatusCallBack      : TCapStatusCallback;  // Event procedure for status of then driver
    fcapVideoStream         : TVideoStream;        // Event procedure for each Video frame during capturing
    fcapAudioStream         : TAudiostream;        // Event procedure for each Audio buffer
    fcapFrameCallback       : TVideoStream;        // Event procedure for each Video frame during preview
    fcapError               : TError;              // Event procedure for Error




    procedure setsize(var msg:TMessage); message WM_SIZE;  // Changing size of cap window
    function GetDriverCaps:Boolean;                        // get driver capitiyties
    procedure DeleteDriverProps;                           // delete driver capitilyites
    procedure CreateTmpFile(drvopn:Boolean); // Create or delete a temp avi´-file

    function GetDriverStatus(callback:Boolean):Boolean; // Getting state of driver
    procedure SetDriverOpen(value:Boolean) ;         // Open and Close the driver
    function GetDriverOpen:Boolean;                        // is Driver open ?
    function GetPreview:Boolean;   // previwe mode
    function GetOverlay:Boolean;   // overlay eode;
    procedure SizeCap;             // calc size of the Capture Window
    procedure Setprop(value:Boolean); // Stretch Picture proportional to Window Size
    procedure SetMicroSecPerFrame(value:Cardinal);    // micro seconds between two frames
    procedure setFrameRate(value:Word);               // Setting Frames p. second
    function  GetFrameRate:Word;                      // Getting Frames p. second.

  

    // Handlers for Propertys

    procedure SetDriverIndex(value:Integer);// Select Driver by setting driver index
    function CreateCapWindow:Boolean;       // Opening driver, create capture window
    procedure DestroyCapwindow;             //  Closing Driver, destrying capture window
    function GetCapWidth:Word;              // Width and Heigth of Video-Frame
    function GetCapHeight:Word;
    function  GetHasDlgVFormat  : Boolean;  // Driver has a format dialog
    function  GetHasDlgVDisplay : Boolean;  // Driver has a display dialog
    function  GetHasDlgVSource  : Boolean;  // Driver has a source dialog
    function  GetHasVideoOverlay: Boolean;  // Driver has overlay mode
    procedure Setoverlay(value:Boolean);  // Driver will use overlay mode
    procedure SetPreview(value:Boolean);  // Driver will use preview mode
    procedure SetScale(value:Boolean);   //  Stretching Frame to component size
    procedure SetpreviewRate(value:Word); // Setting preview frame rate
    function GetCapInProgress:Boolean;    // Capturing  in progress
    procedure SetIndexSize(value:Cardinal); // Setting index size in capture file
    function GetBitMapInfoNP:TBITMAPINFO; //  Bitmapinfo Without Palette
    function GetBitmapHeader:TBitmapInfoHeader; //Get only Header;
    procedure SetBitmapHeader(Header:TBitmapInfoHeader); // Set only Header
    procedure SetBufferFileSize(value:Word); // Setting of Tmp-File


  // Setting callbacks as events
    procedure SetStatCallBack(value:TCapStatusCallback);
    procedure SetCapVideoStream(value:TVideoStream);
    procedure SetCapAudioStream(value:TAudioStream);
    procedure SetCapFrameCallback(value:TVideoStream);
    procedure SetCapError(value:TError);

  public
    procedure SetDriverName(value:String); // Select Driver by setting driver name

    constructor Create(AOwner: TComponent); override;
    destructor destroy; override;

    property  HasDlgFormat:Boolean read GetHasDlgVFormat;    // Driver has a format dialog
    property  HasDlgDisplay:Boolean read GetHasDlgVDisplay;  // Driver has a display dialog
    property  HasDlgSource:Boolean read GetHasDlgVSource;    // Driver has a sourve dialog
    property  HasVideoOverlay:Boolean read GetHasVideoOverlay;  // Driver has overlay mode
    property  CapWidth: Word read GetCapWidth;                  // Width of the captured frames
    property  CapHeight: Word read GetCapHeight;                // Hight of the captured frames
    property  CapInProgess: Boolean read getCapinProgress;      /// capturing is progress
    property  BitMapInfo:TBitmapinfo read GetBitmapInfoNP;      // Get the Bitmapinfo of the frames wiht no legal palette
   //Header of the Bitmapinfo
    function DlgVFormat:Boolean;                              // Shows VideoFormat dialog of the Driver
    function DlgVDisplay:Boolean;                            // Shows VideoDisplay dialog of the Driver
    function DlgVSource:Boolean;                           // Shows   VideoSource  dialog of the Driver
    function DlgVCompression:Boolean;                      // Shows  VideoCompression dialog from VfW
    function GrabFrame:Boolean;                          // Capture one Frame and stops overlay or preview mode
    function GrabFrameNoStop:Boolean;                    // Capture one frame without stoppin overlay or preview
    function SaveAsDIB:Boolean;                          // saves actual frame as DIB
    function SaveToClipboard:Boolean;                    // Puts actual fasme to then Clipboard
    function StartCapture:Boolean;                       // Starts Capturing
    function StopCapture:Boolean;                        // Stops capturing
    function GetBitmapInfo(var p:Pointer):Integer;       // The whole Bitmap-Info with complete palette
    procedure SetBitmapInfo(p:Pointer;size:Integer);    // Setting whole Bitmap-Info with complete palette
    property  BitMapInfoHeader:TBitmapInfoHeader read GetBitmapHeader write SetBitmapHeader;
    function SaveCap:Boolean;                            // Saves Avi-File if Bufferfile is used
    function CapSingleFramesOpen:Boolean;                // Opens AVI-File for Singe Image Capturing
    function CapSingleFramesClose:Boolean;                // Close AVI-File after Singe Image Capturing
    function CapSingleFrame:Boolean;                     // Captures a Single frame to File

  published
    property align;
    property color;
    property visible;
    property DriverOpen: Boolean read getDriveropen write setDriverOpen; // Opens the Driver / or is Driver open
    property DriverIndex:Integer read fdriverindex write SetDriverIndex;  // Index of driver
    property DriverName: String read fVideoDriverName write SetDrivername;    // Name of the Driver
    property VideoOverlay:Boolean read GetOverlay write SetOverlay;   // Overlay - Mode
    property VideoPreview:Boolean read GetPreview write SetPreview;  // Preview - Mode
    property PreviewScaleToWindow:Boolean read fscale write Setscale; // Stretching Frame to component size
    property PreviewScaleProportional:Boolean read  fprop write Setprop; // Stretching Frame poportional to original size
    property PreviewRate:Word read fpreviewrate write SetpreviewRate;    //Preview frame rate
    property MicroSecPerFrame:Cardinal read  fmicrosecpframe write SetMicroSecPerFrame;  //micro seconds between two frames
    property FrameRate:Word read  getFramerate write setFrameRate; //Frames p. second
    property CapAudio:Boolean read fcapAudio write fcapAudio;  // Captue audio stream to
    property VideoFileName:String read fCapVideoFileName   write fCapVideoFileName  ; // Name of capture file
    property SingleImageFile:String read FCapSingleImageFileName write FCapSingleImageFileName;  // Name of file for single image
    property CapTimeLimit:Word read fCapTimeLimit write fCapTimeLimit; // time limit for Capturing
    property CapIndexSize:Cardinal read findexSize write setIndexSize; // Size of the index for capture file
    property CapToFile:Boolean read fcaptoFile write fcapToFile;       // Write Frames to capture file
    property CapAudioFormat:TAudioformat read FAudioformat write FAudioFormat; // Format of captuing Audiodata
    property BufferFileSize:Word read ftempfilesize write SetBufferFileSize; // Size of Bufferfile in MB
  // Internal Events and Callbacks as Events
    property OnStatus:TCapStatusProc read fCapStatusProcedure write FCapStatusProcedure;
    property OnStatusCallback:TCapStatusCallback read fcapStatuscallback write SetStatCallback;
    property OnVideoStream:TVideoStream read fcapVideoStream write SetCapVideoStream;
    property OnFrameCallback:TVideoStream read FcapFramecallback write SetCapFrameCallback;
    property OnAudioStream:TAudioStream read fcapAudioStream write SetCapAudioStream;
    property OnError:TError read fcapError write SetCapError;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseDown;
    property OnClick;
    property OnDblClick;
  end;



function GetDriverList:TStringList;  // Fill stringlist with names and versioninfo of all installed capture drivers
procedure FrameToBitmap(Bitmap:TBitmap;FrameBuffer:pointer; BitmapInfo:TBitmapInfo);  // Make a TBitmap from a Frame
procedure BitmapToFrame(Bitmap:TBitmap; FrameBuffer:pointer; BitmapInfo:TBitmapInfo); // Make a Frame form a Bitmap


procedure Register;

implementation

 // Callback for status of video captures
function StatusCallbackProc(hWnd : HWND; nID : Integer; lpsz : Pchar): Longint; stdcall;
var
  Control:TVideoCap;
begin
  control:=TVideoCap(capGetUserData(hwnd));
  if assigned(control) then
    if assigned(control.fcapStatusCallBack) then
      control.fcapStatusCallBack(control,nId,strPas(lpsz));
  result:= 1;
end;

// Callback for video stream
function VideoStreamCallbackProc(hWnd:Hwnd; lpVHdr:PVIDEOHDR):Longint; stdcall;
var
  Control:TVideoCap;
begin
  control:= TVideoCap(capGetUserData(hwnd));
  if assigned(control) then
    if assigned(control.fcapVideoStream ) then
      control.fcapVideoStream(control,lpvHdr);
  result:= 1;
end;

//Callback for Frames during Preview
function FrameCallbackProc(hwnd:Hwnd; lpvhdr:PVideoHdr):Longint;stdcall;
var
  Control:TVideoCap;

begin
  control:= TVideoCap(capGetUserData(hwnd));
  if assigned(control) then
    if assigned(control.fcapFrameCallback ) then
      control.fcapFrameCallback(control,lpvHdr);
  result:= 1;
end;


// Callback for audio stream
function AudioStreamCallbackProc(hwnd:HWND;lpWHdr:PWaveHdr):Longint; stdcall;
var
  control:TVideoCap;
begin
  control:= TVideoCap(capGetUserData(hwnd));
  if assigned(control) then
    if assigned(control.fcapAudioStream) then
      control.fcapAudioStream(control,lpwhdr);
  result:= 1;
end;

// Callback for Error
function ErrorCallbackProc(hwnd:HWND;nId:Integer;lzError:Pchar):Longint;stdcall;

var
  Control:TVideoCap;

begin
  control:= TVideoCap(capGetUserData(hwnd));
  if assigned(control) then
    if assigned(control.fcaperror) then
      control.fcapError(control,nId,StrPas(lzError));
  result:= 1;
end;







// New Window-Procedure for CaputreWindow to post messages like WM_MouseMove to Component

function WCapproc(hw:THandle;messa:DWord; w:wParam; l:lParam):Integer;stdcall;
var
  oldwndProc:Pointer;
  parentWnd:Thandle;
begin
  oldwndproc:=Pointer(GetWindowLong(hw,GWL_USERDATA));
  case Messa of
    WM_MOUSEMOVE,
    WM_LBUTTONDBLCLK,
    WM_LBUTTONDOWN,WM_RBUTTONDOWN,WM_MBUTTONDOWN ,
    WM_LBUTTONUP,WM_RBUTTONUP,WM_MBUTTONUP: begin
      ParentWnd:=Thandle(GetWindowLong(hw,GWL_HWNDPARENT));
      sendMessage(ParentWnd,messa,w,l);
      result := Integer(true);
    end
  else result:= callWindowProc(oldwndproc,hw,messa,w,l);
  end;

end;

(*---------------------------------------------------------------*)
// constructor and Destructor
constructor TVideoCap.Create(aowner:TComponent);

begin
  inherited create(aowner);
  height                  := 100;
  width                   := 100;
  Color                   :=clblack;
  fVideoDriverName        := '';
  fdriverindex            := -1 ;
  fhCapWnd                := 0;
  fCapVideoFileName       := 'Video.avi';
  fCapSingleImageFileName := 'Capture.bmp';
  fscale                  := false;
  fprop                   := false;
  fpreviewrate            := 30;
  fmicrosecpframe         := 66667;
  fpDrivercaps            := nil;
  fpDriverStatus          := nil;
  fcapToFile              := true;
  findexSize              := 0;
  ftempFileSize           := 0;
  fCapStatusProcedure     := nil;
  fcapStatusCallBack      := nil;
  fcapVideoStream         := nil;
  fcapAudioStream         := nil;

  FAudioformat:=TAudioFormat.Create;

end;

destructor TVideoCap.destroy;
begin
  DestroyCapWindow;
  deleteDriverProps;
  fAudioformat.free;
  inherited destroy;
end;




(*---------------------------------------------------------------*)
// Messagehandler for sizing the capture window
procedure TVideoCap.SetSize(var msg:TMessage);
begin
  if (fhCapWnd <> 0) and (Fscale) then
    if msg.msg = WM_SIZE then
      SizeCap;
end;


// Sizing capture window
procedure TVideoCap.SizeCap;
var
  h,w:Integer;
  f,cf:Single;
begin
  if not fscale then
    MoveWindow(fhcapWnd,0,0,Capwidth,capheight,true)
  else
  begin
    if fprop then
    begin
      f:= Width/height;
      cf:= CapWidth/CapHeight;
      if f >  cf then
      begin
        h:= height;
        w:= round(h*cf);
      end
      else
      begin
        w:= width;
        h:= round(w*1/cf);
      end
    end
    else
    begin
      h:= height;
      w:= Width;
    end;
    MoveWindow(fhcapWnd,0,0,w, h,true);
  end;
end;


  (*---------------------------------------------------------------*)
// Delete driver infos
procedure TVideoCap.DeleteDriverProps;
begin
  if assigned(fpDrivercaps) then
  begin
    dispose(fpDrivercaps);
    fpDriverCaps:= nil;
  end;
  if assigned(fpDriverStatus) then
  begin
    dispose(fpDriverStatus);
    fpDriverStatus:= nil;
  end;

end;


(*---------------------------------------------------------------*)
// Buffer File
procedure TVideoCap.CreateTmpFile(drvOpn:Boolean);
var
  s,f:array [0..MAX_PATH] of Char;
  size:Word;
  ok:Boolean;
  e:Exception;

begin
  if (ftempFileName ='') and (ftempFileSize = 0) then
    exit;
  if drvOpn then
    Size := ftempFileSize
  else
    size:=0;
  if fTempFileName = '' then
  begin
    GetTempPath(sizeof(s),@s);
    GetTempFileName(s,'cap',0,f);
    ftempfilename := f;
  end;
  if size <> 0 then
  begin
    capFileSetCaptureFile(fhCapWnd,strpCopy(f,ftempfilename));
    ok:=capFileAlloc(fhcapWnd,1024*1024* ftempFileSize);
    if not ok then
    begin
      e:= EBufferFileError.Create('Could not create tmp file');
      raise e;
    end;
  end
  else
  begin
    capFileSetCaptureFile(fhCapWnd,strpCopy(f, fCapVideoFileName));
    DeleteFile(fTempfileName);
    fTempFileName:= '';
  end;
end;

procedure TVideoCap.SetBufferFileSize(Value:Word);

begin
  if value = fTempFilesize then
    exit;
  ftempFileSize:=value;
  if DriverOpen then
    CreateTmpFile(true);
end;




(*---------------------------------------------------------------*)
// Capitilies of the Driver

function TVideoCap.GetDriverCaps:Boolean;
var
  savestat : Integer;

begin
  result:= false;
  if assigned(fpDrivercaps) then
  begin
    result:= true;
    exit;
  end;
  if fdriverIndex = -1 then
    exit;
  savestat := fhCapwnd;  // save state of the window
  if fhCapWnd = 0 then
    CreateCapWindow;
  if fhCapWnd = 0 then
    exit;
  new(fpDrivercaps);
  if capDriverGetCaps(fhCapWnd, fpDriverCaps, sizeof(TCapDriverCaps)) then
  begin
    result:= true;
    if savestat = 0 then
      destroyCapWindow;
    exit;
  end;
  dispose(fpDriverCaps);  // Error can't open then Driver
  fpDriverCaps := nil;
  if savestat = 0 then
    destroyCapWindow;
end;

(*---------------------------------------------------------------*)
 // BitmapInfo without a Palette
function TVideoCap.GetBitMapInfoNp:TBitmapinfo;
var
  e:Exception;
begin
  if driveropen then
  begin
    capGetVideoFormat(fhcapWnd, @result,sizeof(TBitmapInfo));
    exit;
  end ;

  fillchar(result,sizeof(TBitmapInfo),0);
  e:= ENotOpen.Create('Driver not Open');
  raise e;
end;

// Whole BitmapInfo
function TVideoCap.GetBitMapInfo(var p:Pointer):Integer;
var
  size:Integer;
  e:Exception;

begin
  p:=nil;
  if driverOpen then
  begin
    size:= capGetVideoFormat(fhcapWnd,p,0);
    getmem(p,size);
    capGetVideoFormat(fhcapwnd,p,size);
    result:=size;
    exit;
  end;
  e:= ENotOpen.Create('Driver not Open');
  raise e;
end;

// Setting whole BitmapInfo
procedure TVideoCap.SetBitmapInfo(p:Pointer;size:Integer);
var
  e:Exception;
  supported:Boolean;
begin
  if driverOpen then
  begin
    supported:=capSetVideoFormat(fhcapWnd,p,size);
    if not supported then
    begin
      e:=EFalseFormat.Create('Not supported Frame Format' );
      raise e;
    end;
    exit;
  end;
  e:= ENotOpen.Create('Driver not Open');
  raise e;
end;




// Only Header of BitmapInfo

function TVideoCap.GetBitMapHeader:TBitmapinfoHeader;
var
  e:Exception;
begin
  if driveropen then
  begin
    capGetVideoFormat(fhcapWnd, @result,sizeof(TBitmapInfoHeader));
    exit;
  end ;
  fillchar(result,sizeof(TBitmapInfoHeader),0);
  e:= ENotOpen.Create('Driver not Open');
  raise e;
end;

procedure TVideoCap.SetBitMapHeader(header:TBitmapInfoHeader);
var
  e:exception;

begin
  if driveropen then
  begin
    if not capSetVideoFormat(fhcapWnd,@header,sizeof(TBitmapInfoHeader)) then
    begin
      e:= EFalseFormat.Create('Not supported Frame Format');
      raise e;
    end;
    exit;
  end
  else
  begin
    e:= ENotOpen.Create('Driver not Open');
    raise e;
  end;
end;


 (*---------------------------------------------------------------*)

function TVideoCap.getDriverStatus(callback:Boolean):Boolean;
begin
  result := false;
  if fhCapWnd <> 0 then
  begin
    if not assigned(fpDriverstatus) then
      new(fpDriverStatus);
    if capGetStatus(fhCapWnd,fpdriverstatus, sizeof(TCapStatus)) then
      result:= true;
  end;
  if assigned(fCapStatusProcedure)and callback then
    fcapStatusProcedure ( self);
end;



(*---------------------------------------------------------------*)
// Setting name of driver

procedure TVideoCap.SetDrivername(value:String);
var
  i:Integer;
  name:array[0..80] of Char;
  ver :array[0..80] of Char;
begin
  if fVideoDrivername = value then
    exit;
  for i:= 0 to 9 do
    if capGetDriverDescription( i,name,80,ver,80) then
      if strpas(name) = value then
      begin
        fVideoDriverName := value;
        Driverindex:= i;
        exit;
      end;
  fVideoDrivername:= '';
  DriverIndex:= -1;
end;

(*---------------------------------------------------------------*)
procedure TVideoCap.SetDriverIndex(value:Integer);
var
  name:array[0..80] of Char;
  ver :array[0..80] of Char;

begin
  if value = fdriverindex then
    exit;
  destroyCapWindow;
  deleteDriverProps;  // Alte Treiberfähigkeiten Löschen
  if value > -1 then
    if capGetDriverDescription(value,name,80,ver,80) then
      fVideoDriverName:= StrPas(name)
    else
      value:= -1;
  if value = -1 then
    fvideoDriverName:= '';
  fdriverindex:= value;
end;

(*---------------------------------------------------------------*)
function TVideoCap.CreateCapWindow;
var
  Ex:Exception;
  savewndproc:Integer;
begin
  if fhCapWnd <> 0 then
  begin
    result:= true;
    exit;
  end;

  if fdriverIndex = -1 then
  begin
    Ex := ENoDriverException.Create('No capture driver selected');
    GetDriverStatus(true);
    raise ex;
    exit;
  end;
  fhCapWnd := capCreateCaptureWindow( Pchar(Name),
    WS_CHILD or WS_VISIBLE , 0, 0,
    Width, Height,
    Handle, 5001);
  if fhCapWnd =0 then
  begin
    Ex:= ENoCapWindowException.Create('Can not create capture window');
    GetDriverStatus(true);
    raise ex;
    exit;
  end;

// Set our own Adress to the CapWindow
  capSetUserData(fhCapwnd,Integer(self));
// Set our own window procedure to Capture-Window
  savewndproc:=SetWindowLong(fhcapWnd,GWL_WNDPROC,Integer(@WCapProc));
// User Data for old WndProc adress
  SetWindowLong(fhcapWnd,GWL_USERDATA,savewndProc);
 // Setting callbacks as events
  if assigned(fcapStatusCallBack ) then
    capSetCallbackOnStatus(fhcapWnd ,StatusCallbackProc);
  if assigned(fcapFrameCallback) then
    capSetCallbackOnFrame(fhcapWnd,FrameCallbackProc);
  if assigned(fcapError) then
    capSetCallbackOnError(fhcapWnd,ErrorCallBackProc);


  if assigned(fcapVideoStream) then
    capSetCallbackOnVideoStream(fhcapwnd,VideoStreamCallbackProc);
  if assigned(fcapAudioStream) then
    capSetCallbackOnWaveStream(fhcapWnd,AudioStreamCallbackProc);

  if not capDriverConnect(fhCapWnd, fdriverIndex) then
  begin
    Ex:= ENotConnectException.Create('Can not connect capture driver with capture window');
    Destroycapwindow;
    GetDriverStatus(true);
    raise ex;
    exit;
  end;



  CreateTmpFile(true);
  capPreviewScale(fhCapWnd, fscale);
  capPreviewRate(fhCapWnd, round( 1/fpreviewrate*1000));
  GetDriverStatus(true);
  Sizecap;
  result:= true;
end;

(*------------------------------------------------------------------------*)
// Setting callbacks as events

procedure TVideoCap.SetStatCallBack(value:TCapStatusCallback);
begin
  fcapStatusCallBack := value;
  if DriverOpen then
    if assigned(fcapStatusCallBack) then
      capSetCallbackOnStatus(fhcapWnd ,StatusCallbackProc)
    else
      capSetCallbackOnStatus(fhcapWnd ,nil);
end;


procedure TVideoCap.SetCapVideoStream(value:TVideoStream);
begin
  fcapVideoStream:= value;
  if DriverOpen then
    if assigned(fcapVideoStream) then
      capSetCallbackOnVideoStream(fhcapwnd,VideoStreamCallbackProc)
    else
      capSetCallbackOnVideoStream(fhcapwnd, nil);
end;

procedure TVideoCap.SetCapFrameCallback(value:TVideoStream);
begin
  fcapframeCallback:= value;
  if DriverOpen then
    if assigned(fcapFrameCallback) then
      capSetCallbackOnFrame(fhcapwnd,FrameCallBackProc)
    else
      capSetCallbackOnFrame(fhcapwnd, nil);
end;



procedure TVideoCap.SetCapAudioStream(value:TAudioStream);
begin
  fcapAudioStream:= value;
  if DriverOpen then
    if assigned(fcapAudioStream) then
      capSetCallbackOnWaveStream(fhcapWnd,AudioStreamCallbackProc)
    else
      capSetCallbackOnWaveStream(fhcapWnd,nil);
end;


procedure TVideoCap.SetCapError(value:TError);
begin
  fcapError:= value;
  if DriverOpen then
    if assigned(fcapError) then
      capSetCallbackOnError(fhcapWnd,ErrorCallbackProc)
    else
      capSetCallbackOnError(fhcapWnd,nil);
end;



(*---------------------------------------------------------------*)
procedure TVideoCap.DestroyCapWindow;
begin
  if fhCapWnd = 0 then
    exit;
  CreateTmpFile(false);
  CapDriverDisconnect(fhCapWnd);
  SetWindowLong(fhcapWnd,GWL_WNDPROC,GetWindowLong(fhcapwnd,GWL_USERDATA)); // Old windowproc
  DestroyWindow( fhCapWnd ) ;
  fhCapWnd := 0;
end;

(*---------------------------------------------------------------*)
function  TVideoCap.GetHasVideoOverlay:Boolean;

begin
  if getDriverCaps then
    Result := fpDriverCaps^.fHasOverlay
  else
    result:= false;
end;

(*---------------------------------------------------------------*)

function  TVideoCap.GetHasDlgVFormat:Boolean;
begin
  if getDriverCaps then
    Result := fpDriverCaps^.fHasDlgVideoFormat
  else
    result:= false;
end;

(*---------------------------------------------------------------*)
function  TVideoCap.GetHasDlgVDisplay : Boolean;

begin
  if getDriverCaps then
    Result := fpDriverCaps^.fHasDlgVideoDisplay
  else
    result:= false;
end;

(*---------------------------------------------------------------*)
function  TVideoCap.GetHasDlgVSource  : Boolean;
begin
  if getDriverCaps then
    Result := fpDriverCaps^.fHasDlgVideoSource
  else
    result:= false;
end;

(*---------------------------------------------------------------*)
function TVideoCap.DlgVFormat:Boolean;
var
  savestat : Integer;
begin
  result:= false;
  if fdriverIndex = -1 then
    exit;
  savestat := fhCapwnd;
  if fhCapWnd = 0 then
    if not CreateCapWindow then
      exit;
  result :=capDlgVideoFormat(fhCapWnd);
  if result then
    GetDriverStatus(true);
  if savestat = 0 then
    destroyCapWindow;
  if result then
  begin
    Sizecap;
    Repaint;
  end;
end;

(*---------------------------------------------------------------*)
function TVideoCap.DlgVDisplay:Boolean;
var
  savestat : Integer;
begin
  result:= false;
  if fdriverIndex = -1 then
    exit;
  savestat := fhCapwnd;
  if fhCapWnd = 0 then
    if not CreateCapWindow then
      exit;
  result:=capDlgVideoDisplay(fhCapWnd) ;
  if result then
    GetDriverStatus(true);
  if savestat = 0 then
    destroyCapWindow;
  if result then
  begin
    SizeCap;
    Repaint;
  end;
end;

(*---------------------------------------------------------------*)
function TVideoCap.DlgVSource:Boolean;
var
  savestat : Integer;

begin
  result:= false;
  if fdriverIndex = -1 then
    exit;
  savestat := fhCapwnd;
  if fhCapWnd = 0 then
    if not createCapWindow then
      exit;
  result:= capDlgVideoSource(fhCapWnd);
  if result then
    GetDriverStatus(true);
  if savestat = 0 then
    destroyCapWindow;
  if result then
  begin
    SizeCap;
    Repaint;
  end;
end;

(*---------------------------------------------------------------*)
function TVideoCap.DlgVCompression;
var
  savestat : Integer;

begin
  result:= false;
  if fdriverIndex = -1 then
    exit;
  savestat := fhCapwnd;
  if fhCapWnd = 0 then
    if not createCapWindow then
      exit;
  result:=capDlgVideoCompression(fhCapWnd);
  if savestat = 0 then
    destroyCapWindow;
end;


(*---------------------------------------------------------------*)
 // Single Frame Grabbling
function TVideoCap.GrabFrame:Boolean;
begin
  result:= false;
  if not DriverOpen then
    exit;
  Result:= capGrabFrame(fhcapwnd);
  if result then
    GetDriverStatus(true);
end;

function TVideoCap.GrabFrameNoStop:Boolean;
begin
  result:= false;
  if not DriverOpen then
    exit;
  Result:= capGrabFrameNoStop(fhcapwnd);
  if result then
    GetDriverStatus(true);
end;

 (*---------------------------------------------------------------*)
// save frame as DIP
function TVideoCap.SaveAsDIB:Boolean;
var
  s:array[0..MAX_PATH] of Char;
begin
  result:= false;
  if not DriverOpen then
    exit;
  result := capFileSaveDIB(fhcapwnd,strpCopy(s,fCapSingleImageFileName));
end;

function  TVideoCap.SaveToClipboard:Boolean;
begin
  result:= false;
  if not Driveropen then
    exit;
  result:= capeditCopy(fhcapwnd);
end;


(*---------------------------------------------------------------*)

procedure TVideoCap.Setoverlay(value:Boolean);
var
  ex:Exception;
begin
  if value = GetOverlay then
    exit;
  if gethasVideoOverlay = false then
  begin
    Ex:= ENoOverlayException.Create('Driver has no overlay mode');
    raise ex;
    exit;
  end;
  if value = true then
  begin
    if fhcapWnd = 0 then
      CreateCapWindow;
    GrabFrame;
  end;

  capOverlay(fhCapWnd,value);
  GetDriverStatus(true);
  invalidate;
end;

function TVideoCap.GetOverlay:Boolean;
begin
  if fhcapWnd = 0 then
    result := false
  else
    result:= fpDriverStatus^.fOverlayWindow;
end;



(*---------------------------------------------------------------*)

procedure TVideoCap.SetPreview(value:Boolean);
begin
  if value = GetPreview then
    exit;
  if value = true then
    if fhcapWnd = 0 then
      CreateCapWindow;
  capPreview(fhCapWnd,value);
  GetDriverStatus(true);
  invalidate;
end;

function TVideoCap.GetPreview:Boolean;
begin
  if fhcapWnd = 0 then
    result := false
  else
    result:= fpDriverStatus^.fLiveWindow;
end;



procedure TVideoCap.SetPreviewRate(value:Word);
begin
  if value = fpreviewrate then
    exit;
  if value < 1 then
    value := 1;
  if value > 30 then
    value := 30;
  fpreviewrate:= value;
  if DriverOpen then
    capPreviewRate(fhCapWnd, round( 1/fpreviewrate*1000));
end;

(*---------------------------------------------------------------*)

procedure TVideoCap.SetMicroSecPerFrame(value:Cardinal);
begin
  if value =  fmicrosecpframe then
    exit;
  if value < 33333 then
    value := 33333;
  fmicrosecpframe := value;
end;



procedure TVideoCap.setFrameRate(value:Word);
begin
  if value <> 0 then
    fmicrosecpframe:= round(1.0/value*1000000.0);
end;

function  TVideoCap.GetFrameRate:Word;
begin
  if fmicrosecpFrame > 0   then
    result:= round(1./ fmicrosecpframe * 1000000.0)
  else
    result:= 0;
end;


function TVideoCap.StartCapture;
var
  CapParms:TCAPTUREPARMS;
  name:array[0..MAX_PATH] of Char;

begin
  result := false;
  if not DriverOpen then
    exit;
  capCaptureGetSetup(fhCapWnd, @CapParms, sizeof(TCAPTUREPARMS));

  if ftempfilename='' then
    capFileSetCaptureFile(fhCapWnd,strpCopy(name, fCapVideoFileName));


  CapParms.dwRequestMicroSecPerFrame := fmicrosecpframe;
  CapParms.fLimitEnabled    := BOOL(FCapTimeLimit);
  CapParms.wTimeLimit       := fCapTimeLimit;
  CapParms.fCaptureAudio    := fCapAudio;
  CapParms.fMCIControl      := false;
  CapParms.fYield           := true;
  CapParms.vKeyAbort        := VK_ESCAPE;
  CapParms.fAbortLeftMouse  := false;
  CapParms.fAbortRightMouse := false;
  if CapParms.fLimitEnabled then // Calculate Indexsize
  begin
    CapParms.dwIndexSize:= frameRate*FCapTimeLimit; // For Video Frames
    if fCapAudio then
      CapParms.dwIndexSize := CapParms.dwIndexSize + 5*FCapTimeLimit; // Additional Buffer for Audio
  end
  else
  if CapParms.dwIndexSize = 0 then     // Default Value
    CapParms.DwIndexSize := 100000 // Value bigger then default for larger Videos
  else
    CapParms.dwIndexSize := findexSize// IndexSize by user
  ;
  if CapParms.dwIndexSize < 1800 then
    CapParms.dwIndexSize:= 1800;  // Limit Control
  if CapParms.dwIndexSize > 324000 then
    CapParms.dwIndexSize:= 324000;

  capCaptureSetSetup(fhCapWnd, @CapParms, sizeof(TCAPTUREPARMS));
  if fCapAudio then
    FAudioformat.SetAudio(fhcapWnd);
  if CapToFile then
    result:= capCaptureSequence(fhCapWnd)
  else
    result := capCaptureSequenceNoFile(fhCapWnd);
  GetDriverStatus(true);
end;


function TVideoCap.StopCapture;
begin
  result:=false;
  if not DriverOpen then
    exit;
  result:=CapCaptureStop(fhcapwnd);
  GetDriverStatus(true);

end;

function TVideoCap.SaveCap:Boolean;
var
  name:array[0..MAX_PATH] of Char;
begin
  result := capFileSaveAs(fhcapwnd,strPCopy(name,fCapVideoFileName)); // strpCopy(name, fCapVideoFileName));
end;


procedure TVideoCap.SetIndexSize(value:Cardinal);
begin
  if value = 0 then
  begin
    findexSize:= 0;
    exit;
  end;
  if value < 1800 then
    value := 1800;
  if value > 324000 then
    value := 324000;
  findexsize:= value;

end;


function TVideoCap.GetCapInProgress:Boolean;
begin
  result:= false;
  if not DriverOpen then
    exit;
  GetDriverStatus(false);
  result:= fpDriverStatus^.fCapturingNow ;
end;

 (*---------------------------------------------------------------*)

procedure TVideoCap.SetScale(value:Boolean);

begin
  if value = fscale then
    exit;
  fscale:= value;
  if DriverOpen then
  begin
    capPreviewScale(fhCapWnd, fscale);
    SizeCap;
  end;
  Repaint;
end;

procedure TVideoCap.Setprop(value:Boolean);
begin
  if value = fprop then
    exit;
  fprop:=value;
  if DriverOpen then
    Sizecap;
  Repaint;
end;


(*---------------------------------------------------------------*)
function TVideoCap.GetCapWidth;

begin
  if assigned(fpDriverStatus) then
    result:= fpDriverStatus^.uiImageWidth
  else
    result:= 0;
end;

function TVideoCap.GetCapHeight;

begin
  if assigned(fpDriverStatus) then
    result:= fpDriverStatus^.uiImageHeight
  else
    result:= 0;
end;



(*---------------------------------------------------------------*)
procedure TVideoCap.SetDriverOpen(value:Boolean);
begin
  if value = GetDriverOpen then
    exit;
  if value = false then
    DestroyCapWindow;
  if value = true then
    CreateCapWindow;
end;


function TVideoCap.GetDriverOpen:Boolean;
begin
  result := fhcapWnd <> 0;
end;

(*---------------------------------------------------------------*)
// Singele frame Capturing

function TVideoCap.CapSingleFramesOpen:Boolean;
var
  name :array [0..MAX_PATH] of Char;
  CapParms:TCAPTUREPARMS;

begin
  result := false;
  if not DriverOpen then
    exit;

  capCaptureGetSetup(fhCapWnd, @CapParms, sizeof(TCAPTUREPARMS));
  if ftempfilename='' then
    capFileSetCaptureFile(fhCapWnd,strpCopy(name, fCapVideoFileName));

  CapParms.dwRequestMicroSecPerFrame := fmicrosecpframe;
  CapParms.fLimitEnabled    := BOOL(0);
  CapParms.fCaptureAudio    := false;
  CapParms.fMCIControl      := false;
  CapParms.fYield           := true;
  CapParms.vKeyAbort        := VK_ESCAPE;
  CapParms.dwIndexSize := findexSize; // IndexSize by user
  if CapParms.dwIndexSize < 1800 then
    CapParms.dwIndexSize:= 1800;  // Limit Control
  if CapParms.dwIndexSize > 324000 then
    CapParms.dwIndexSize:= 324000;
  capCaptureSetSetup(fhCapWnd, @CapParms, sizeof(TCAPTUREPARMS));

  result:= capCaptureSingleFrameOpen(fhcapWnd);
end;

function TVideoCap.CapSingleFramesClose:Boolean;
var
  E:Exception;
begin
  if not driverOpen then
  begin
    e:= ENotOpen.Create('Driver not Open');
    raise e;
    exit;
  end;
  result:= CapCaptureSingleFrameClose(fhcapWnd);
end;


function TVideoCap.CapSingleFrame:Boolean;
var
  E:Exception;
begin
  if not driverOpen then
  begin
    e:= ENotOpen.Create('Driver not Open');
    raise e;
    exit;
  end;
  result:= CapCaptureSingleFrame(fhcapWnd);
end;

///////////////////////////////////////////////////////////////////////////


constructor TAudioFormat.create;
begin
  inherited create;
  FChannels:=Mono;
  FFrequency:=f8000Hz;
  Fres:=r8Bit;
end;



procedure TAudioFormat.SetAudio(handle:Thandle);
var
  WAVEFORMATEX:TWAVEFORMATEX;

begin
  if handle= 0 then
    exit;  // No CapWindow
  capGetAudioFormat(handle,@WAVEFORMATEX, SizeOf(TWAVEFORMATEX));
  case FFrequency of
    f8000hz  :WAVEFORMATEX.nSamplesPerSec:=8000;
    f11025Hz:WAVEFORMATEX.nSamplesPerSec:=11025;
    f22050Hz:WAVEFORMATEX.nSamplesPerSec:=22050;
    f44100Hz:WAVEFORMATEX.nSamplesPerSec:=44100;
  end;
  WAVEFORMATEX.nAvgBytesPerSec:= WAVEFORMATEX.nSamplesPerSec;
  if FChannels=Mono then
    WAVEFORMATEX.nChannels:=1
  else
    WAVEFORMATEX.nChannels:=2;
  if FRes=r8Bit then
    WAVEFORMATEX.wBitsPerSample:=8
  else
    WAVEFORMATEX.wBitsPerSample:=16;
  capSetAudioFormat(handle,@WAVEFORMATEX, SizeOf(TWAVEFORMATEX));
end;


///////////////////////////////////////////////////////////////////////////


// Creating a list with capture drivers
function GetDriverList:TStringList;
var
  i:Integer;
  name:array[0..80] of Char;
  ver :array[0..80] of Char;
begin
  result:= TStringList.Create;
  result.Capacity:= 10;
  result.Sorted:= false;
  for i:= 0 to 9 do
    if capGetDriverDescription( i,name,80,ver,80) then
      result.Add(StrPas(name)+ ' '+strpas(ver))
    else
      break;
end;

procedure FrameToBitmap(Bitmap:TBitmap;FrameBuffer:pointer; BitmapInfo:TBitmapInfo);
var
  hdd:Thandle;

begin

  with Bitmap  do
  begin
    Width:= BitmapInfo.bmiHeader.biWidth;      // New size of Bitmap
    Height:=Bitmapinfo.bmiHeader.biHeight;
    hdd:= DrawDibOpen;
    DrawDibDraw(hdd,canvas.handle,0,0,BitmapInfo.BmiHeader.biwidth,BitmapInfo.bmiheader.biheight,@BitmapInfo.bmiHeader,
      frameBuffer,0,0,bitmapInfo.bmiHeader.biWidth,bitmapInfo.bmiHeader.biheight,0);
    DrawDibClose(hdd);
  end;
end;



procedure BitmapToFrame(Bitmap:TBitmap; FrameBuffer:pointer; BitmapInfo:TBitmapInfo);
var
  ex:Exception;
begin
  if bitmapInfo.bmiHeader.BiCompression <> bi_RGB then
  begin
    ex:=  EFalseFormat.Create('Not Supported DIB format');
    raise ex ;
  end;
  with Bitmap do
    GetDiBits(canvas.handle,handle,0,BitmapInfo.bmiHeader.biheight,FrameBuffer,BitmapInfo,DIB_RGB_COLORS);
end;





procedure Register;
begin
  RegisterComponents( 'Video', [TVideoCap]);
end;



end.
