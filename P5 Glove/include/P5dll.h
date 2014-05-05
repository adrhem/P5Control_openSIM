/******************************************************************************
//	File:	p5dll.hpp
//	Use:	wrapper that is exposed to the world.
//	
//	Authors:	Av Utukuri, Igor Borysov, Carl Kenner
//	
//
//
//	Copyright (c) 2001-2004 Essential Reality LLC
//
//
//	Updates
//
//	Aug 24\01 - Av Utukuri - Finished V1.0, made all variables follow hungarian notation, cleaned up dead code
//  Sep 21\04 - Carl Kenner - Added non-C++ exported functions, extra features, new data structures and more constants
//  Oct 18\04 - Carl Kenner - Fixed prediction in filtered mode and set default filter mode to both filters
******************************************************************************/

#ifndef _P5DLL_H_
#define _P5DLL_H_

//#define TEST_DLL
//#define P5DLL_DEBUG

// Don't worry about these, they allow this same file to be used in my driver and your project
// You just ignore them.
#ifdef P5DLL_EXPORTS
#define P5DLL_API __declspec(dllexport)
#else
#define P5DLL_API __declspec(dllimport)
#endif

// Contrary to its name, this is NOT the head separation value
// Actually this is the fraction of an inch that all the coordinates are returned in.
// 1 inch = 51.2 units. The real head separation value is 7.9 inches.
#define P5HEAD_SEPARATION	51.2f

// true or false values are declared as type P5BOOL
#define P5BOOL	unsigned int

//fingers definitions
#define P5_THUMB   0x0
#define P5_INDEX   0x1
#define P5_MIDDLE  0x2
#define P5_RING    0x3
#define P5_PINKY   0x4

//filter modes definitions
#define P5_FILTER_NONE			0x0
#define P5_FILTER_DEADBAND		0x1
#define P5_FILTER_AVERAGE		0x2

// [sic]
#define P5_FILTER_DEADBEND		0x1


//Error Codes
#define P5ERROR_NONE					0x00
#define P5ERROR_NOP5DETECTED			0x01
#define P5ERROR_P5DISCONNECTED			0x02
#define P5ERROR_P5CONNECTED				0x03
#define P5ERROR_INVALID_P5ID			0x04
#define P5ERROR_INVALID_P5GLOVETYPE		0x05
#define P5ERROR_WRONGFIRMWAREVER		0x06
#define P5ERROR_EXCEPTION               0x07
#define P5ERROR_GETTIME 8
#define P5ERROR_PARSEBEND 9
#define P5ERROR_PARSEBUTTONS 10
#define P5ERROR_PARSELEDNUM 11
#define P5ERROR_PARSELED 12
#define P5ERROR_UNWARP 13
#define P5ERROR_PROCESS 14
#define P5ERROR_PROCESSROTATION            15
#define P5ERROR_PROCESSRELATIVEPOSITION    16
#define P5ERROR_PROCESSRELATIVEAVGPOSITION 17
#define P5ERROR_PROCESSROTATIONREAL        18
#define P5ERROR_PROCESSABSOLUTEPOSITION    19
#define P5ERROR_PROCESSLEDPOSITIONS        20
#define P5ERROR_INTERNAL                   21

//Glove types
#define P5GLOVETYPE_RIGHTHAND			0
#define P5GLOVETYPE_LEFTHAND			1

// Glove backwards
#define P5GLOVEBACKWARDS_NOT            0
#define P5GLOVEBACKWARDS_THUMBLITTLE    1
#define P5GLOVEBACKWARDS_NOTHUMB        2
#define P5GLOVEBACKWARDS_UPSIDEDOWN     3
#define P5GLOVEBACKWARDS_DONTWORRY      4

// Distance units
#define P5_UNITS (1.0f)
#define P5_CM (2.54f/51.2f)
#define P5_MM (P5_CM*10)
#define P5_INCHES (1.0f/51.2f)
#define P5_FEET (1.0f/51.2f/12.0f)
#define P5_M (P5_CM/100)
#define P5_KM (P5_M/1000)
// Time Units
#define P5_SECONDS (1.0f)
#define P5_MINUTES (P5_SECONDS/60)
#define P5_HOURS (P5_MINUTES/60)
#define P5_FRAME (1.0f*P5_SECONDS/41.7f)
// Velocity Units
#define P5_KPH (P5_KM/P5_HOURS)
#define P5_MPS (P5_M/P5_SECONDS)
// Acceleration Units
#define P5_MPSPS (P5_M/P5_SECONDS/P5_SECONDS)
// Rotation Units
#define P5_DEGREES (1.0f)
#define P5_RADIANS (3.14159/(180*P5_DEGREES))
#define P5_REVOLUTIONS (P5_DEGREES/360)


// What position to return via the old interface
#define P5MODE_RELATIVE 0
#define P5MODE_ABSOLUTE 1
#define P5MODE_RELATIVEAVG 2
#define P5MODE_FILTERED 3
#define P5MODE_LED0 4
#define P5MODE_LED1 5
#define P5MODE_LED2 6
#define P5MODE_LED3 7
#define P5MODE_LED4 8
#define P5MODE_LED5 9
#define P5MODE_LED6 10
#define P5MODE_LED7 11
#define P5MODE_LED8 12
#define P5MODE_LED9 13
#define P5MODE_LEDBRIGHT 14
#define P5MODE_LEDBEST 15

// What rotation to return via the old interface
#define P5MODE_ORIGINAL_PYR  (256*0)

#define P5MODE_BETTER_PYR (256*10)
#define P5MODE_BETTER_YPR (256*11)
#define P5MODE_BETTER_RYP (256*12)
#define P5MODE_BETTER_RPY (256*13)
#define P5MODE_BETTER_PRY (256*14)
#define P5MODE_BETTER_YRP (256*15)
#define P5MODE_BETTER_MIX (256*16)

#define P5MODE_FILTERED_PYR (256*20)
#define P5MODE_FILTERED_YPR (256*21)
#define P5MODE_FILTERED_RYP (256*22)
#define P5MODE_FILTERED_RPY (256*23)
#define P5MODE_FILTERED_PRY (256*24)
#define P5MODE_FILTERED_YRP (256*25)
#define P5MODE_FILTERED_MIX (256*26)



/////////////////////////////////////////////////////////////////////////////////////
// P5Data
// This is the original data structure that all the glove's information was stored in.
// It is missing a lot of information, so two new data structures were created also.
// The new data structures should be used instead of this one most of the time.
// This one is mostly for backwards compatibility
/////////////////////////////////////////////////////////////////////////////////////

typedef struct
{
	//Actual P5 variables
	char VendorID[50], ProductID[50], Version[50];
	char ProductString[255], ManufacturerString[255], SerialNumString[255];

	int m_nDeviceID;
	int m_nMajorRevisionNumber, m_nMinorRevisionNumber;

	int m_nGloveType;

	float m_fx, m_fy, m_fz;					//x,y,z of the hand
	float m_fyaw, m_fpitch, m_froll;		//yaw\pitch\roll of the hand
	unsigned char m_byBendSensor_Data[5];	//All the bend sensor data
	unsigned char m_byButtons[4];			//P5 Button data
	float m_fRotMat[3][3];						//matrix for inverse kinematics

// The fields below only exist in special debug versions of the DLL file.
// But don't worry, the same information is available in the new P5State structure.
//****************************//
// for distribution delete these lines
//****************************//
#ifdef P5DLL_DEBUG
	float VisLedPos[4][3];		//X\Y\Z of visible LEDs
	float m_fV1Angle[4], m_fV2Angle[4], m_fHAngle[4];	//Angle of entry of visible LEDs
	unsigned char m_byLEDNum[4];						//Visible LEDs
	int m_nlastBrightLED[4];
	unsigned char m_RawDistalSensor_Data[5];
	unsigned int LED0[3], LED1[3], LED2[3], LED3[3];
	float ActualLED_X[10];
	float ActualLED_Y[10];
	float ActualLED_Z[10];
#endif

}P5Data;




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
 
class P5DLL_API CP5DLL
{
public:


	int m_nNumP5;
	P5Data *m_P5Devices;

	//Constructors and destructors
	CP5DLL();
	~CP5DLL();

	//Close function
	void P5_Close();
	//Init function - required on start of program
	P5BOOL P5_Init(void);

	void P5_SetClickSensitivity(int P5Id, unsigned char leftvalue, unsigned char rightvalue, unsigned char middlevalue);
	void P5_GetClickSensitivity(int P5Id, int *leftclick, int *rightclick, int *middleclick);

	void P5_SaveBendSensors(int P5Id);
	void P5_CalibrateBendSensors(int P5Id);
	void P5_CalibratePositionData(int P5Id);

	P5BOOL P5_GetMouseState(int P5Id);
	void P5_SetMouseState(int P5Id, P5BOOL state);
	void P5_SetMouseStickTime(int P5Id, unsigned char time);
	int P5_GetMouseStickTime(int P5Id);
	void P5_GetMouseButtonAllocation(int P5Id, int *leftclick, int *rightclick, int *middleclick);
	void P5_SetMouseButtonAllocation(int P5Id, int leftclickfinger, int rightclickfinger, int middleclickfinger);

	P5BOOL P5_GetLastError(int *P5Id, int *ErrorCode);


#ifdef TEST_DLL
	void P5_GetRawDistalSensorData(int P5Id);
#endif
};


#include <pshpack8.h>
typedef struct {
// Location
	float x, y, z;				//x,y,z of the hand
	float RelativeX, RelativeY, RelativeZ;
	float RelativeAvgX, RelativeAvgY, RelativeAvgZ;
    float FilterPos[3];

    float Velocity[3];
    float Acceleration[3];

// Rotation    
    float RotMat[3][3]; // rotation matrix [row][column] like Direct3D, premultiply by row vector
	float pitch, yaw, roll;
    float FilterRotMat[3][3];
	float FilterPitch, FilterYaw, FilterRoll;
    float AngularVelocity[3]; // around the x, y, and z axes
    float AngularAcceleration[3];

// Visibility
    int Visible;

	
// Fingers
	unsigned char finger[5];	//All the bend sensor data
    short FingerAbsolute[5];
    float FingerVelocity[5];
    float FingerAcceleration[5];

// Buttons
	unsigned char button[4];	//P5 Button data

// Leds
	float LedPos[10][3];		   //Position of 10 LEDs
    float LedVelocity[10][3];      //Velocity of 10 LEDs
    float LedGeometricAccuracy[10];//Dot product of vectors to other LEDs
    unsigned char LedVisible[10];  //1 if visible, 0 if not
    int TrackedLed;
     
// Visible Leds
    int VisibleLedCount;
	signed char VisibleLedNumber[4];  //Which of the 10 LEDs is each visible one
	int VisibleLedRaw[4][3]; // Raw Led values -512 to +511
	float VisibleLedV1Angle[4], VisibleLedV2Angle[4], VisibleLedHAngle[4];  //Angle of entry of visible LEDs
    float VisibleLedPos[4][3]; // debug
    

// Time
	double TimeStamp;
    float FrameRate;
    __int64 Frame;


} P5State;

typedef struct {
	char VendorID[52], ProductID[52], Version[52];
	char ProductString[256], ManufacturerString[256], SerialNumString[256];
	int DeviceID;
	int MajorRevisionNumber, MinorRevisionNumber;
	int GloveType;

	//Physical Led Layout
	float ActualLedPos[10][3];
	float LEDDistances[10][10];

	//Global tan compensation data
	float Head1_VAngle, Head_HAngle, Head2_VAngle, Head2_HAngle;
	float HeadSeparation;

    //AC Adaptrer Status
    P5BOOL ACAdapterStatus;

    //Finger Calibration
    int FingerStraight[5];
    int FingerBent[5];

	//Handles
	void  *DeviceHandle; // PHID_DEVICE

	unsigned int ThreadId;
	unsigned int ThreadHandle;
	P5BOOL ThreadStatus;

} P5Info;

#include <poppack.h>


//Init function - required on start of program
extern "C" P5DLL_API P5BOOL __stdcall P5_Init(void);
extern "C" P5DLL_API void __stdcall P5_Close();

extern "C" P5DLL_API CP5DLL * __stdcall P5_GetCP5DLL();
extern "C" P5DLL_API void * __stdcall P5_GetCP5();
extern "C" P5DLL_API int __stdcall P5_GetCount();
extern "C" P5DLL_API P5Data * __stdcall P5_GetDataPointer(int P5Id);
extern "C" P5DLL_API P5State * __stdcall P5_GetStatePointer(int P5Id);
extern "C" P5DLL_API P5Info * __stdcall P5_GetInfoPointer(int P5Id);
extern "C" P5DLL_API void * __stdcall P5_GetPrivatePointer(int P5Id);



extern "C" P5DLL_API void __stdcall P5_SaveBendSensors(int P5Id);
extern "C" P5DLL_API void __stdcall P5_CalibrateBendSensors(int P5Id);

extern "C" P5DLL_API void __stdcall P5_CalibratePositionData(int P5Id);

extern "C" P5DLL_API void __stdcall P5_SetClickSensitivity(int P5Id, unsigned char leftvalue, unsigned char rightvalue, unsigned char middlevalue);
extern "C" P5DLL_API void __stdcall P5_GetClickSensitivity(int P5Id, int *leftclick, int *rightclick, int *middleclick);
extern "C" P5DLL_API P5BOOL __stdcall P5_GetMouseState(int P5Id);
extern "C" P5DLL_API void __stdcall P5_SetMouseState(int P5Id, P5BOOL state);
extern "C" P5DLL_API void __stdcall P5_SetMouseStickTime(int P5Id, unsigned char time);
extern "C" P5DLL_API int __stdcall P5_GetMouseStickTime(int P5Id);
extern "C" P5DLL_API void __stdcall P5_GetMouseButtonAllocation(int P5Id, int *leftclick, int *rightclick, int *middleclick);
extern "C" P5DLL_API void __stdcall P5_SetMouseButtonAllocation(int P5Id, int leftclickfinger, int rightclickfinger, int middleclickfinger);

extern "C" P5DLL_API P5BOOL __stdcall P5_GetLastError(int *P5Id, int *ErrorCode);



    // AC Adaptor
extern "C" P5DLL_API P5BOOL __stdcall P5_GetACAdaptorStatus(int P5Id);

    // Bend Sensors
extern "C" P5DLL_API void __stdcall P5_GetBendCalibration(int P5Id, int &ThumbStraight, int &ThumbBent,
                             int &IndexStraight, int &IndexBent,
                             int &MiddleStraight, int &MiddleBent,
                             int &RingStraight, int &RingBent,
                             int &PinkyStraight, int &PinkyBent);
extern "C" P5DLL_API void __stdcall P5_GetRawFingerBends(int P5Id, int &thumb, int &index, int &middle, int &ring, int &pinky);
extern "C" P5DLL_API void __stdcall P5_GetCalibrationData(int P5Id, unsigned char data[]);

    // Space Warp
extern "C" P5DLL_API void __stdcall P5_SetUnits(float units);
extern "C" P5DLL_API void __stdcall P5_SetForwardZ(int z);

extern "C" P5DLL_API void __stdcall P5_SetTowerPos(int P5Id, float x, float y, float z);
extern "C" P5DLL_API void __stdcall P5_SetTowerRotMat(int P5Id, float RotMat[][3]);
extern "C" P5DLL_API void __stdcall P5_TiltTowerForward(int P5Id, float degrees);
extern "C" P5DLL_API void __stdcall P5_SpinTowerRight(int P5Id, float degrees);
extern "C" P5DLL_API void __stdcall P5_TiltTowerRight(int P5Id, float degrees);

extern "C" P5DLL_API void __stdcall P5_SetSensitivity(int P5Id, float multiplier);

extern "C" P5DLL_API void __stdcall P5_SetTrackerUnwarp(int P5Id, float UnwarpX, float UnwarpY, float UnwarpZ, float UnwarpScaleX, float UnwarpScaleY, int NewUnwarp);
extern "C" P5DLL_API void __stdcall P5_GetTrackerUnwarp(int P5Id, float &UnwarpX, float &UnwarpY, float &UnwarpZ, float &UnwarpScaleX, float &UnwarpScaleY, int &NewUnwarp);


    // Glove configuration
extern "C" P5DLL_API void __stdcall P5_SetLedPos(int P5Id, int led, float x, float y, float z);
extern "C" P5DLL_API void __stdcall P5_SetGlovePos(int P5Id, float x, float y, float z);
extern "C" P5DLL_API void __stdcall P5_SetGloveRotMat(int P5Id, float RotMat[][3]);
extern "C" P5DLL_API void __stdcall P5_PitchGlove(int P5Id, float theta);
extern "C" P5DLL_API void __stdcall P5_YawGlove(int P5Id, float theta);
extern "C" P5DLL_API void __stdcall P5_RollGlove(int P5Id, float theta);


    // Filters
extern "C" P5DLL_API void __stdcall P5_SetInterfaceMode(int mode);
extern "C" P5DLL_API void __stdcall P5_SetFilterMode(int filters);
extern "C" P5DLL_API void __stdcall P5_SetFilterAmount(int ExtraFrames, float DeadDistance);
extern "C" P5DLL_API void __stdcall P5_ClearArchive(int P5Id);
extern "C" P5DLL_API void __stdcall P5_SetRequiredAccuracy(float accuracy);
extern "C" P5DLL_API void __stdcall P5_SetPrediction(int prediction);

    // Mouse
extern "C" P5DLL_API void __stdcall P5_RestoreMouse(int P5Id = -1);
extern "C" P5DLL_API void __stdcall P5_UnRestoreMouse(int P5Id = -1);


    // Low level hardware control
extern "C" P5DLL_API void __stdcall P5_SetFeature(int P5Id, unsigned char usage, unsigned char numvalues, unsigned char *reportdata);
extern "C" P5DLL_API void __stdcall P5_SetFeatureReport(int P5Id, unsigned char report, unsigned char numvalues, unsigned char *reportdata);
extern "C" P5DLL_API int __stdcall P5_GetFeature(int P5Id, unsigned char usage, unsigned char numvalues, unsigned char *reportdata);
extern "C" P5DLL_API int __stdcall P5_GetFeatureReport(int P5Id, unsigned char report, unsigned char numvalues, unsigned char *reportdata);

// Copy structures
extern "C" P5DLL_API void __stdcall P5_GetData(int P5Id, P5Data &data);
extern "C" P5DLL_API void __stdcall P5_GetState(int P5Id, int frame, P5State &state);
extern "C" P5DLL_API void __stdcall P5_GetInfo(int P5Id, P5Info &info);


// Get values stored in structures
extern "C" P5DLL_API void __stdcall P5_GetAbsolutePos(int P5Id, float *x, float *y, float *z);
extern "C" P5DLL_API void __stdcall P5_GetRelativePos(int P5Id, float *x, float *y, float *z);
extern "C" P5DLL_API void __stdcall P5_GetRelativeAvgPos(int P5Id, float *x, float *y, float *z);
extern "C" P5DLL_API void __stdcall P5_GetRotation(int P5Id, float *yaw, float *pitch, float *roll);
extern "C" P5DLL_API void __stdcall P5_GetFingerBends(int P5Id, float *thumb, float *index, float *middle, float *ring, float *pinky);
extern "C" P5DLL_API void __stdcall P5_GetButtons(int P5Id, float *A, float *B, float *C, float *D);
extern "C" P5DLL_API P5BOOL __stdcall P5_GetThreadStatus(int P5Id);



#endif
