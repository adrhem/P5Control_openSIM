unit P5DLL;

interface
Uses Windows;

(******************************************************************************
//	File:	p5dll.hpp
//	Use:	wrapper that is exposed to the world.
//
//	Authors:	Av Utukuri, Igor Borysov
//
//
//
//	Copyright (c) 2001 Essential Reality LLC
//
//
//	Updates
//
//	Aug 24\01 - Av Utukuri - Finished V1.0, made all variables follow hungarian notation, cleaned up dead code
//  Oct 18\04 - Carl Kenner - Fixed this file up for BETA 2
******************************************************************************)

{.$DEFINE TEST_DLL}
{.$DEFINE P5DLL_DEBUG}

type
  P5BOOL = LongBool;

const
  P5HEAD_SEPARATION	= 51.2;

//fingers definitions
  P5_THUMB  = 0;
  P5_INDEX  = 1;
  P5_MIDDLE = 2;
  P5_RING   = 3;
  P5_PINKY  = 4;

//filter modes definitions
  P5_FILTER_NONE		 = 0;
  P5_FILTER_DEADBAND = 1;
  P5_FILTER_AVERAGE	 = 2;

  P5_FILTER_DEADBEND = 1; // [sic]

//Error Codes
  P5ERROR_NONE = 0;
  P5ERROR_NOP5DETECTED = 1;
  P5ERROR_P5DISCONNECTED = 2;
  P5ERROR_P5CONNECTED	= 3;
  P5ERROR_INVALID_P5ID = 4;
  P5ERROR_INVALID_P5GLOVETYPE	= 5;
  P5ERROR_WRONGFIRMWAREVER = 6;
  P5ERROR_EXCEPTION = 7;
  P5ERROR_GETTIME = 8;
  P5ERROR_PARSEBEND = 9;
  P5ERROR_PARSEBUTTONS = 10;
  P5ERROR_PARSELEDNUM = 11;
  P5ERROR_PARSELED = 12;
  P5ERROR_UNWARP = 13;
  P5ERROR_PROCESS = 14;
  P5ERROR_PROCESSROTATION = 15;
  P5ERROR_PROCESSRELATIVEPOSITION = 16;
  P5ERROR_PROCESSRELATIVEAVGPOSITION = 17;
  P5ERROR_PROCESSROTATIONREAL = 18;
  P5ERROR_PROCESSABSOLUTEPOSITION = 19;
  P5ERROR_PROCESSLEDPOSITIONS = 20;
  P5ERROR_INTERNAL = 21;


//Glove types
  P5GLOVETYPE_RIGHTHAND	= 0;
  P5GLOVETYPE_LEFTHAND	= 1;

// Glove backwards
  P5GLOVEBACKWARDS_NOT = 0;
  P5GLOVEBACKWARDS_THUMBLITTLE = 1;
  P5GLOVEBACKWARDS_NOTHUMB = 2;
  P5GLOVEBACKWARDS_UPSIDEDOWN = 3;
  P5GLOVEBACKWARDS_DONTWORRY = 4;

// Distance units
  P5_UNITS = 1;
  P5_CM = 2.54/51.2;
  P5_MM = P5_CM*10;
  P5_INCHES = 1/51.2;
  P5_FEET = 1.0/51.2/12.0;
  P5_M = P5_CM/100;
  P5_KM = P5_M/1000;
// Time Units
  P5_SECONDS = 1;
  P5_MINUTES = P5_SECONDS/60;
  P5_HOURS = P5_MINUTES/60;
  P5_FRAME = 1*P5_SECONDS/41.7;
// Velocity Units
  P5_KPH = P5_KM/P5_HOURS;
  P5_MPS = P5_M/P5_SECONDS;
// Acceleration Units
  P5_MPSPS = P5_M/P5_SECONDS/P5_SECONDS;
// Rotation Units
  P5_DEGREES = 1;
  P5_RADIANS = 3.14159/(180*P5_DEGREES);
  P5_REVOLUTIONS = P5_DEGREES/360;

// What position to return via the old interface
  P5MODE_RELATIVE = 0;
  P5MODE_ABSOLUTE = 1;
  P5MODE_RELATIVEAVG = 2;
  P5MODE_FILTERED = 3;
  P5MODE_LED0 = 4;
  P5MODE_LED1 = 5;
  P5MODE_LED2 = 6;
  P5MODE_LED3 = 7;
  P5MODE_LED4 = 8;
  P5MODE_LED5 = 9;
  P5MODE_LED6 = 10;
  P5MODE_LED7 = 11;
  P5MODE_LED8 = 12;
  P5MODE_LED9 = 13;
  P5MODE_LEDBRIGHT = 14;
  P5MODE_LEDBEST = 15;

// What rotation to return via the old interface
  P5MODE_ORIGINAL_PYR = 256*0;

  P5MODE_BETTER_PYR = 256*10;
  P5MODE_BETTER_YPR = 256*11;
  P5MODE_BETTER_RYP = 256*12;
  P5MODE_BETTER_RPY = 256*13;
  P5MODE_BETTER_PRY = 256*14;
  P5MODE_BETTER_YRP = 256*15;
  P5MODE_BETTER_MIX = 256*16;

  P5MODE_FILTERED_PYR = 256*20;
  P5MODE_FILTERED_YPR = 256*21;
  P5MODE_FILTERED_RYP = 256*22;
  P5MODE_FILTERED_RPY = 256*23;
  P5MODE_FILTERED_PRY = 256*24;
  P5MODE_FILTERED_YRP = 256*25;
  P5MODE_FILTERED_MIX = 256*26;



type
TRotMat = Array[0..2,0..2] of Single;

P5Data = record // 1004 bytes
	//Actual P5 variables
	VendorID: Array[0..49] of char;
  ProductID: Array[0..49] of char;
  Version: Array[0..49] of char;
	ProductString: Array[0..254] of char;
  ManufacturerString: Array[0..254] of char;
  SerialNumString: Array[0..254] of char;

	m_nDeviceID: Integer;
	m_nMajorRevisionNumber, m_nMinorRevisionNumber: Integer;

	m_nGloveType: Integer;

	m_fx, m_fy, m_fz: Single;					//x,y,z of the hand
	m_fyaw, m_fpitch, m_froll: Single;		//yaw\pitch\roll of the hand
	m_byBendSensor_Data: Array[0..4] of Byte;	//All the bend sensor data
	m_byButtons: Array[0..3] of Boolean;   //P5 Button data
	m_fRotMat: TRotMat; //matrix for inverse kinematics

{$ifdef P5DLL_DEBUG}
	VisLedPos: Array[0..3,0..2] of Single;		//X\Y\Z of visible LEDs
	m_fV1Angle: Array[0..3] of Single;
  m_fV2Angle: Array[0..3] of Single;
  m_fHAngle: Array[0..3] of Single;	//Angle of entry of visible LEDs
	m_byLEDNum: Array[0..3] of Byte;						//Visible LEDs
	m_nlastBrightLED: Array[0..3] of Integer;
	m_RawDistalSensor_Data: Array[0..4] of Byte;
	LED0: Array[0..2] of LongWord;
  LED1: Array[0..2] of LongWord;
  LED2: Array[0..2] of LongWord;
  LED3: Array[0..2] of LongWord;
  ActualLED_X: Array[0..9] of Single;
  ActualLED_Y: Array[0..9] of Single;
  ActualLED_Z: Array[0..9] of Single;
{$endif}

end;
PP5Data = ^P5Data;

P5State = record  // 728 bytes
// Location
	x, y, z: Single;				//x,y,z of the hand
	RelativeX, RelativeY, RelativeZ: Single;
	RelativeAvgX, RelativeAvgY, RelativeAvgZ: Single;
  FilterPos: Array[0..2] of Single;

  Velocity: Array[0..2] of Single;
  Acceleration: Array[0..2] of Single;

// Rotation
  RotMat: TRotMat; // rotation matrix [row][column] like Direct3D, premultiply by row vector
	pitch, yaw, roll: Single;
  FilterRotMat: TRotMat;
	FilterPitch, FilterYaw, FilterRoll: Single;
  AngularVelocity: Array[0..2] of Single; // around the x, y, and z axes
  AngularAcceleration: Array[0..2] of Single;

// Visibility
  Visible: LongBool;

// Fingers
	finger: Array[P5_THUMB..P5_PINKY] of Byte;	//All the bend sensor data
  FingerAbsolute: Array[P5_THUMB..P5_PINKY] of SmallInt;
  FingerVelocity: Array[P5_THUMB..P5_PINKY] of Single;
  FingerAcceleration: Array[P5_THUMB..P5_PINKY] of Single;

// Buttons
	button: Array[0..3] of Boolean;	//P5 Button data

// Leds
	LedPos: Array[0..9,0..2] of Single;		   //Position of 10 LEDs
  LedVelocity: Array[0..9,0..2] of Single;      //Velocity of 10 LEDs
  LedGeometricAccuracy: Array[0..9] of Single; //Dot product of vectors to other LEDs
  LedVisible: Array[0..9] of Boolean;  //1 if visible, 0 if not
  TrackedLed: Integer;

// Visible Leds
  VisibleLedCount: Integer;
	VisibleLedNumber: Array[0..3] of ShortInt;  //Which of the 10 LEDs is each visible one
	VisibleLedRaw: Array[0..3, 0..2] of Integer; // Raw Led values -512 to +511
	VisibleLedV1Angle: Array[0..3] of Single;
  VisibleLedV2Angle: Array[0..3] of Single;
  VisibleLedHAngle: Array[0..3] of Single;  //Angle of entry of visible LEDs
  VisibleLedPos: Array[0..3, 0..2] of Single; // debug

// Time
  TimeStamp: Double;
  FrameRate: Single;
  Frame: Int64;
end;
PP5State = ^P5State;

P5Info = record // 1488 bytes
	VendorID: Array[0..49] of char;
  ProductID: Array[0..49] of char;
  Version: Array[0..49] of char;
	ProductString: Array[0..254] of char;
  ManufacturerString: Array[0..254] of char;
  SerialNumString: Array[0..254] of char;

	DeviceID: Integer;
	MajorRevisionNumber, MinorRevisionNumber: Integer;
	GloveType: Integer;

	//Physical Led Layout
	ActualLedPos: Array[0..9, 0..2] of Single;
	LEDDistances: Array[0..9, 0..9] of Single;

	//Global tan compensation data
	Head1_VAngle, Head_HAngle, Head2_VAngle, Head2_HAngle: Single;
	HeadSeparation: Single;

	//Handles
	DeviceHandle: Pointer; // PHID_DEVICE

	ThreadId: LongWord;
	ThreadHandle: THandle;
	ThreadStatus: P5BOOL;

end;
PP5Info = ^P5Info;


//Init function - required on start of program
function P5_Init(): P5BOOL; StdCall; external 'P5DLL.DLL';
procedure P5_Close(); StdCall; external 'P5DLL.DLL';

function P5_GetCP5DLL: Pointer; StdCall; external 'P5DLL.DLL';
function P5_GetCP5: Pointer; StdCall; external 'P5DLL.DLL';
function P5_GetCount: Integer; StdCall; external 'P5DLL.DLL';
function P5_GetDataPointer(P5Id: Integer = 0): PP5Data; StdCall; external 'P5DLL.DLL';
function P5_GetStatePointer(P5Id: Integer = 0): PP5State; StdCall; external 'P5DLL.DLL';
function P5_GetInfoPointer(P5Id: Integer = 0): PP5Info; StdCall; external 'P5DLL.DLL';
function P5_GetPrivatePointer(P5Id: Integer = 0): Pointer; StdCall; external 'P5DLL.DLL';

procedure P5_SaveBendSensors(P5Id: Integer = 0); StdCall; external 'P5DLL.DLL';
procedure P5_CalibrateBendSensors(P5Id: Integer = 0); StdCall; external 'P5DLL.DLL';
procedure P5_CalibratePositionData(P5Id: Integer = 0); StdCall; external 'P5DLL.DLL';

procedure P5_SetClickSensitivity(P5Id: Integer; LeftValue, RightValue, MiddleValue: Byte); StdCall; external 'P5DLL.DLL';
procedure P5_GetClickSensitivity(P5Id: Integer; out LeftClick, RightClick, MiddleClick: Integer); StdCall; external 'P5DLL.DLL';
function P5_GetMouseState(P5Id: Integer = 0): P5Bool; StdCall; external 'P5DLL.DLL';
procedure P5_SetMouseState(P5Id: Integer; state: P5Bool); StdCall; external 'P5DLL.DLL';
procedure P5_SetMouseStickTime(P5Id: Integer; time: Byte); StdCall; external 'P5DLL.DLL';
function P5_GetMouseStickTime(P5Id: Integer = 0): Integer; StdCall; external 'P5DLL.DLL';
procedure P5_GetMouseButtonAllocation(P5Id: Integer; out LeftClick, RightClick, MiddleClick: Integer); StdCall; external 'P5DLL.DLL';
procedure P5_SetMouseButtonAllocation(P5Id: Integer; LeftClickFinger, RightClickFinger, MiddleClickFinger: Integer); StdCall; external 'P5DLL.DLL';
function P5_GetThreadStatus(P5Id: Integer = 0): P5BOOL; StdCall; external 'P5DLL.DLL';
function P5_GetLastError(P5Id: Integer; out ErrorCode: Integer): P5Bool; StdCall; external 'P5DLL.DLL';

procedure P5_GetData(P5ID: Integer; out data: P5Data); StdCall; external 'P5DLL.DLL';
procedure P5_GetState(P5ID, Frame: Integer; out state: P5State); StdCall; external 'P5DLL.DLL';
procedure P5_GetInfo(P5ID: Integer; out info: P5Info); StdCall; external 'P5DLL.DLL';

procedure P5_GetAbsolutePos(P5Id: Integer; out x, y, z: Single); StdCall; external 'P5DLL.DLL';
procedure P5_GetRelativePos(P5Id: Integer; out x, y, z: Single); StdCall; external 'P5DLL.DLL';
procedure P5_GetRelativeAvgPos(P5Id: Integer; out x, y, z: Single); StdCall; external 'P5DLL.DLL';
procedure P5_GetRotation(P5Id: Integer; out yaw, pitch, roll: Single); StdCall; external 'P5DLL.DLL';
procedure P5_GetFingerBends(P5Id: Integer; out thumb, index, middle, ring, pinky: Single); StdCall; external 'P5DLL.DLL';
procedure P5_GetButtons(P5Id: Integer; out A, B, C, D: Single); StdCall; external 'P5DLL.DLL';
function P5_GetACAdaptorStatus(P5Id: Integer = 0): LongBool; StdCall; external 'P5DLL.DLL';
procedure P5_GetCalibrationData(P5Id: Integer; out data); StdCall; external 'P5DLL.DLL';
procedure P5_GetTanData(P5Id: Integer; out data); StdCall; external 'P5DLL.DLL';
procedure P5_GetBendCalibration(P5Id: Integer; out ThumbStraight, ThumbBent, IndexStraight, IndexBent, MiddleStraight, MiddleBent, RingStraight, RingBent, PinkyStraight, PinkyBent: Integer); StdCall; external 'P5DLL.DLL';
procedure P5_SetBendCalibration(P5Id: integer; ThumbStraight, ThumbBent, IndexStraight, IndexBent, MiddleStraight, MiddleBent, RingStraight, RingBent, PinkyStraight, PinkyBent: Integer); StdCall; external 'P5DLL.DLL';

procedure P5_SetUnits(units: Single = 1.0); StdCall; external 'P5DLL.DLL';
procedure P5_SetTowerPos(P5Id: Integer; x,y,z: Single); StdCall; external 'P5DLL.DLL';
procedure P5_SetTowerRotMat(P5Id: Integer; var RotMat: TRotMat); StdCall; external 'P5DLL.DLL';
procedure P5_SpinTowerRight(P5Id: Integer; degrees: Single); StdCall; external 'P5DLL.DLL';
procedure P5_TiltTowerRight(P5Id: Integer; degrees: Single); StdCall; external 'P5DLL.DLL';
procedure P5_TiltTowerForward(P5Id: Integer; degrees: Single); StdCall; external 'P5DLL.DLL';

procedure P5_SetInterfaceMode(mode: Integer); StdCall; external 'P5DLL.DLL';
procedure P5_SetFilterMode(filters: Integer); StdCall; external 'P5DLL.DLL';
procedure P5_SetFilterAmount(ExtraFrames: Integer; DeadDistance: Single); StdCall; external 'P5DLL.DLL';
procedure P5_ClearArchive(P5Id: Integer); StdCall; external 'P5DLL.DLL';
procedure P5_SetRequiredAccuracy(accuracy: Single); StdCall; external 'P5DLL.DLL';

procedure P5_GetRawFingerBends(P5Id: Integer; out thumb, index, middle, ring, pinky: Integer); StdCall; external 'P5DLL.DLL';


procedure P5_SetFeature(P5Id: Integer; usage: Byte; numvalues: Byte;  out reportdata); StdCall; external 'P5DLL.DLL';
procedure P5_SetFeatureReport(P5Id: Integer; report: Byte; numvalues: Byte; out reportdata); StdCall; external 'P5DLL.DLL';
function P5_GetFeature(P5Id: Integer; usage: Byte; numvalues: Byte; var reportdata): Integer; StdCall; external 'P5DLL.DLL';
function P5_GetFeatureReport(P5Id: Integer; report: Byte; numvalues: Byte; var reportdata): Integer; StdCall; external 'P5DLL.DLL';
procedure P5_SetForwardZ(z: Integer); StdCall; external 'P5DLL.DLL';

    // Glove configuration
procedure P5_SetLedPos(P5Id: Integer; led: Integer; x, y, z: Single); StdCall; external 'P5DLL.DLL';
procedure P5_SetGlovePos(P5Id: Integer; x, y, z: Single); StdCall; external 'P5DLL.DLL';
procedure P5_SetGloveRotMat(P5Id: Integer; Var RotMat: TRotMat); StdCall; external 'P5DLL.DLL';
procedure P5_PitchGlove(P5Id: Integer; theta: Single); StdCall; external 'P5DLL.DLL';
procedure P5_YawGlove(P5Id: Integer; theta: Single); StdCall; external 'P5DLL.DLL';
procedure P5_RollGlove(P5Id: Integer; theta: Single); StdCall; external 'P5DLL.DLL';

    // Mouse
procedure P5_RestoreMouse(P5Id: Integer = -1); StdCall; external 'P5DLL.DLL';
procedure P5_UnRestoreMouse(P5Id: Integer = -1); StdCall; external 'P5DLL.DLL';


/////////////////////////////////////////////////////////////////////////////////////
// CP5DLL
// This is the original C++ class that represents all the P5 Gloves on your system.
// You just create one of these objects at the start of your C++ program,
// then call the P5_Init() method. The object will then automatically update its
// fields and structure arrays until you call the P5_Close() method.
//
// This class is missing a lot of important functionality, and is limited to Visual C++
// You are better off using the C style functions.
// This is mostly just for backwards compatibility.
/////////////////////////////////////////////////////////////////////////////////////
Type
  CP5DLL = Class
  private
    function GetP5Device(P5Id: Integer): PP5Data;
  public
    m_nNumP5: Integer;
    property m_P5Devices[P5Id: Integer]: PP5Data read GetP5Device;

    //Constructors and destructors
    Constructor Create();
    Destructor Destroy; override;

    //Close function
    procedure P5_Close; virtual;
    //Init function - required on start of program
    function P5_Init: Boolean; virtual;

    procedure P5_SetClickSensitivity(P5Id: Integer; leftvalue, rightvalue, middlevalue: Byte); virtual;
    procedure P5_GetClickSensitivity(P5Id: Integer; out leftclick, rightclick, middleclick: Integer); virtual;

    procedure P5_SaveBendSensors(P5Id: Integer = -1); virtual;
    procedure P5_CalibrateBendSensors(P5Id: Integer = -1); virtual;
    procedure P5_CalibratePositionData(P5Id: Integer = -1); virtual;

    function P5_GetMouseState(P5Id: Integer = 0): Boolean; virtual;
    procedure P5_SetMouseState(P5Id: Integer; state: Boolean); virtual;
    procedure P5_SetMouseStickTime(P5Id: Integer; time: Byte); virtual;
    function P5_GetMouseStickTime(P5Id: Integer = 0): Integer; virtual;
    procedure P5_GetMouseButtonAllocation(P5Id: Integer; out leftclick, rightclick, middleclick: Integer); virtual;
    procedure P5_SetMouseButtonAllocation(P5Id: Integer; leftclickfinger, rightclickfinger, middleclickfinger: Integer); virtual;

    function P5_GetLastError(out P5Id: Integer; out ErrorCode: Integer): Boolean; virtual;

  end;

  CP5DLL2 = Class(CP5DLL)
  private
    function GetP5State(P5Id: Integer; frame: Integer = 0): PP5State;
    function GetP5Info(P5Id: Integer): PP5Info;
  public
    property State[P5Id: Integer; frame: Integer = 0]: PP5State read GetP5State; default;
    property Info[P5Id: Integer]: PP5Info read GetP5Info;

    // AC Adaptor
    function P5_GetACAdaptorStatus(P5Id: Integer = 0): Boolean; virtual;

    // Bend Sensors
    procedure P5_GetBendCalibration(P5Id: Integer; out ThumbStraight, ThumbBent, IndexStraight, IndexBent, MiddleStraight, MiddleBent, RingStraight, RingBent, PinkyStraight, PinkyBent: Integer); virtual;
    procedure P5_GetRawFingerBends(P5Id: Integer; out thumb, index, middle, ring, pinky: Integer); virtual;
    procedure P5_GetCalibrationData(P5Id: Integer; out data); virtual;

    // Space Warp
    procedure P5_SetUnits(units: Single = 1.0); virtual;
    procedure P5_SetForwardZ(z: Integer); virtual;

    procedure P5_SetTowerPos(P5Id: Integer; x,y,z: Single); virtual;
    procedure P5_SetTowerRotMat(P5Id: Integer; var RotMat: TRotMat); virtual;
    procedure P5_TiltTowerForward(P5Id: Integer; degrees: Single); virtual;
    procedure P5_SpinTowerRight(P5Id: Integer; degrees: Single); virtual;
    procedure P5_TiltTowerRight(P5Id: Integer; degrees: Single); virtual;

    // Glove configuration
    procedure P5_SetLedPos(P5Id: Integer; led: Integer; x, y, z: Single); virtual;
    procedure P5_SetGlovePos(P5Id: Integer; x, y, z: Single); virtual;
    procedure P5_SetGloveRotMat(P5Id: Integer; Var RotMat: TRotMat); virtual;
    procedure P5_PitchGlove(P5Id: Integer; theta: Single); virtual;
    procedure P5_YawGlove(P5Id: Integer; theta: Single); virtual;
    procedure P5_RollGlove(P5Id: Integer; theta: Single); virtual;

    // Filters
    procedure P5_SetInterfaceMode(mode: Integer); virtual;
    procedure P5_SetFilterMode(filters: Integer); virtual;
    procedure P5_SetFilterAmount(ExtraFrames: Integer; DeadDistance: Single); virtual;
    procedure P5_ClearArchive(P5Id: Integer); virtual;
    procedure P5_SetRequiredAccuracy(accuracy: Single); virtual;

    // Mouse
    procedure P5_RestoreMouse(P5Id: Integer = -1); virtual;
    procedure P5_UnRestoreMouse(P5Id: Integer = -1); virtual;

    // Low level hardware control
    procedure P5_SetFeature(P5Id: Integer; usage: Byte; numvalues: Byte;  out reportdata); virtual;
    procedure P5_SetFeatureReport(P5Id: Integer; report: Byte; numvalues: Byte; out reportdata); virtual;
    function P5_GetFeature(P5Id: Integer; usage: Byte; numvalues: Byte; var reportdata): Integer; virtual;
    function P5_GetFeatureReport(P5Id: Integer; report: Byte; numvalues: Byte; var reportdata): Integer; virtual;

  end;

implementation

{ CP5DLL }

constructor CP5DLL.Create;
begin
  m_nNumP5 := 0;
end;

destructor CP5DLL.Destroy;
begin

  inherited;
end;

procedure CP5DLL.P5_CalibrateBendSensors(P5Id: Integer);
begin
  P5DLL.P5_CalibrateBendSensors(P5Id);
end;

procedure CP5DLL.P5_CalibratePositionData(P5Id: Integer);
begin
  P5DLL.P5_CalibratePositionData(P5Id);
end;

procedure CP5DLL.P5_Close;
begin
  P5DLL.P5_Close;
end;

procedure CP5DLL.P5_GetClickSensitivity(P5Id: Integer; out leftclick,
  rightclick, middleclick: Integer);
begin
  P5DLL.P5_GetClickSensitivity(P5Id, leftclick, rightclick, middleclick);
end;

function CP5DLL.P5_GetLastError(out P5Id, ErrorCode: Integer): Boolean;
begin
  Result:=P5DLL.P5_GetLastError(P5Id, ErrorCode);
end;

procedure CP5DLL.P5_GetMouseButtonAllocation(P5Id: Integer; out leftclick,
  rightclick, middleclick: Integer);
begin
  P5DLL.P5_GetMouseButtonAllocation(P5Id, leftclick, rightclick, middleclick);
end;

function CP5DLL.P5_GetMouseState(P5Id: Integer): Boolean;
begin
  Result:=P5DLL.P5_GetMouseState(P5Id);
end;

function CP5DLL.P5_GetMouseStickTime(P5Id: Integer): Integer;
begin
  Result:=P5DLL.P5_GetMouseStickTime(P5Id);
end;

function CP5DLL.P5_Init: Boolean;
begin
  Result:=P5DLL.P5_Init;
  m_nNumP5:=P5_GetCount;
end;

procedure CP5DLL.P5_SaveBendSensors(P5Id: Integer);
begin
  P5DLL.P5_SaveBendSensors(P5Id);
end;

procedure CP5DLL.P5_SetClickSensitivity(P5Id: Integer; leftvalue,
  rightvalue, middlevalue: Byte);
begin
  P5DLL.P5_SetClickSensitivity(P5Id, leftvalue, rightvalue, middlevalue);
end;

procedure CP5DLL.P5_SetMouseButtonAllocation(P5Id, leftclickfinger,
  rightclickfinger, middleclickfinger: Integer);
begin
  P5DLL.P5_SetMouseButtonAllocation(P5Id, leftclickfinger, rightclickfinger, middleclickfinger);
end;

procedure CP5DLL.P5_SetMouseState(P5Id: Integer; state: Boolean);
begin
  P5DLL.P5_SetMouseState(P5Id, state);
end;

procedure CP5DLL.P5_SetMouseStickTime(P5Id: Integer; time: Byte);
begin
  P5DLL.P5_SetMouseStickTime(P5Id, time);
end;

function CP5DLL.GetP5Device(P5Id: Integer): PP5Data;
begin
  Result:=P5DLL.P5_GetDataPointer(P5Id);
end;



{ CP5DLL2 }

function CP5DLL2.GetP5Info(P5Id: Integer): PP5Info;
begin
  Result:=P5DLL.P5_GetInfoPointer(P5Id);
end;

function CP5DLL2.GetP5State(P5Id: Integer; frame: Integer = 0): PP5State;
begin
  Result:=P5DLL.P5_GetStatePointer(P5Id);
end;

function CP5DLL2.P5_GetACAdaptorStatus(P5Id: Integer): Boolean;
begin
  Result:=P5DLL.P5_GetACAdaptorStatus(P5Id);
end;

procedure CP5DLL2.P5_GetBendCalibration(P5Id: Integer; out ThumbStraight,
  ThumbBent, IndexStraight, IndexBent, MiddleStraight, MiddleBent,
  RingStraight, RingBent, PinkyStraight, PinkyBent: Integer);
begin
  P5DLL.P5_GetBendCalibration(P5Id, ThumbStraight, ThumbBent, IndexStraight, IndexBent,
  MiddleStraight, MiddleBent, RingStraight, RingBent, PinkyStraight, PinkyBent);
end;

procedure CP5DLL2.P5_GetCalibrationData(P5Id: Integer; out data);
begin
  P5DLL.P5_GetCalibrationData(P5Id, data);
end;

function CP5DLL2.P5_GetFeature(P5Id: Integer; usage, numvalues: Byte;
  var reportdata): Integer;
begin
  Result:=P5DLL.P5_GetFeature(P5Id, usage, numvalues, reportdata);
end;

function CP5DLL2.P5_GetFeatureReport(P5Id: Integer; report,
  numvalues: Byte; var reportdata): Integer;
begin
  Result:=P5DLL.P5_GetFeatureReport(P5Id, report, numvalues, reportdata);
end;

procedure CP5DLL2.P5_GetRawFingerBends(P5Id: Integer; out thumb, index,
  middle, ring, pinky: Integer);
begin
  P5DLL.P5_GetRawFingerBends(P5Id, thumb, index, middle, ring, pinky);
end;

procedure CP5DLL2.P5_SetFeature(P5Id: Integer; usage, numvalues: Byte;
  out reportdata);
begin
  P5DLL.P5_SetFeature(P5Id, usage, numvalues, reportdata);
end;

procedure CP5DLL2.P5_SetFeatureReport(P5Id: Integer; report,
  numvalues: Byte; out reportdata);
begin
  P5DLL.P5_SetFeatureReport(P5Id, report, numvalues, reportdata);
end;

procedure CP5DLL2.P5_SetFilterAmount(ExtraFrames: Integer;
  DeadDistance: Single);
begin
  P5DLL.P5_SetFilterAmount(ExtraFrames, DeadDistance);
end;

procedure CP5DLL2.P5_SetFilterMode(filters: Integer);
begin
  P5DLL.P5_SetFilterMode(filters);
end;

procedure CP5DLL2.P5_SetForwardZ(z: Integer);
begin
  P5DLL.P5_SetForwardZ(z);
end;

procedure CP5DLL2.P5_SetRequiredAccuracy(accuracy: Single);
begin
  P5DLL.P5_SetRequiredAccuracy(accuracy);
end;

procedure CP5DLL2.P5_SetTowerPos(P5Id: Integer; x, y, z: Single);
begin
  P5DLL.P5_SetTowerPos(P5Id, x,y,z);
end;

procedure CP5DLL2.P5_SetTowerRotMat(P5Id: Integer; var RotMat: TRotMat);
begin
  P5DLL.P5_SetTowerRotMat(P5Id, RotMat);
end;

procedure CP5DLL2.P5_SetUnits(units: Single);
begin
  P5DLL.P5_SetUnits(units);
end;

procedure CP5DLL2.P5_SpinTowerRight(P5Id: Integer; degrees: Single);
begin
  P5DLL.P5_SpinTowerRight(P5Id, degrees);
end;

procedure CP5DLL2.P5_TiltTowerForward(P5Id: Integer; degrees: Single);
begin
  P5DLL.P5_TiltTowerForward(P5Id, degrees);
end;

procedure CP5DLL2.P5_TiltTowerRight(P5Id: Integer; degrees: Single);
begin
  P5DLL.P5_TiltTowerRight(P5Id, degrees);
end;

// Mouse
procedure CP5DLL2.P5_RestoreMouse(P5Id: Integer = -1);
begin
  P5DLL.P5_RestoreMouse(P5Id);
end;

procedure CP5DLL2.P5_UnRestoreMouse(P5Id: Integer = -1);
begin
  P5DLL.P5_UnRestoreMouse(P5Id);
end;

procedure CP5DLL2.P5_SetInterfaceMode(mode: Integer);
begin
  P5DLL.P5_SetInterfaceMode(mode);
end;

procedure CP5DLL2.P5_SetLedPos(P5Id: Integer; led: Integer; x, y, z: Single);
begin
  P5DLL.P5_SetLedPos(P5Id, led, x, y, z);
end;

procedure CP5DLL2.P5_SetGlovePos(P5Id: Integer; x, y, z: Single);
begin
  P5DLL.P5_SetGlovePos(P5Id, x, y, z);
end;

procedure CP5DLL2.P5_SetGloveRotMat(P5Id: Integer; Var RotMat: TRotMat);
begin
  P5DLL.P5_SetGloveRotMat(P5Id, RotMat);
end;

procedure CP5DLL2.P5_PitchGlove(P5Id: Integer; theta: Single);
begin
  P5DLL.P5_PitchGlove(P5Id, theta);
end;

procedure CP5DLL2.P5_YawGlove(P5Id: Integer; theta: Single);
begin
  P5DLL.P5_YawGlove(P5Id, theta);
end;

procedure CP5DLL2.P5_RollGlove(P5Id: Integer; theta: Single);
begin
  P5DLL.P5_RollGlove(P5Id, theta);
end;

procedure CP5DLL2.P5_ClearArchive(P5Id: Integer);
begin
  P5DLL.P5_ClearArchive(P5Id);
end;


begin
  Assert(SizeOf(P5State)=728);
  Assert(SizeOf(P5Data)=1004);
end.
