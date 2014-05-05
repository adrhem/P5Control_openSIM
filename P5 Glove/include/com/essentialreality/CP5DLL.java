package com.essentialreality;

/**
 * Title:        P5 Glove Java API
 * Description:
 * Copyright:    Copyright (c) 2004
 * Company:
 * @author Carl Kenner
 * @version 1.0
 */

public class CP5DLL {

  public static final float P5HEAD_SEPARATION = 51.2f;

//fingers definitions
  public static final float P5_THUMB = 0;
  public static final float P5_INDEX = 1;
  public static final float P5_MIDDLE = 2;
  public static final float P5_RING = 3;
  public static final float P5_PINKY = 4;

  public static final float P5_FILTER_NONE = 0;
  public static final float P5_FILTER_DEADBAND = 1;
  public static final float P5_FILTER_AVERAGE = 2;

//Error Codes
  public static final float P5ERROR_NONE = 0;
  public static final float P5ERROR_NOP5DETECTED = 1;
  public static final float P5ERROR_P5DISCONNECTED = 2;
  public static final float P5ERROR_P5CONNECTED = 3;
  public static final float P5ERROR_INVALID_P5ID = 4;
  public static final float P5ERROR_INVALID_P5GLOVETYPE = 5;
  public static final float P5ERROR_WRONGFIRMWAREVER = 6;

//Glove types
  public static final float P5GLOVETYPE_RIGHTHAND = 0;
  public static final float P5GLOVETYPE_LEFTHAND = 1;

// Distance units
public static final float P5_UNITS = (1.0f);
public static final float P5_CM = (2.54f/51.2f);
public static final float P5_MM = (P5_CM*10);
public static final float P5_INCHES = (1.0f/51.2f);
public static final float P5_FEET = (1.0f/51.2f/12.0f);
public static final float P5_M = (P5_CM/100);
public static final float P5_KM = (P5_M/1000);
// Time Units
public static final float P5_SECONDS = (1.0f);
public static final float P5_MINUTES = (P5_SECONDS/60);
public static final float P5_HOURS = (P5_MINUTES/60);
public static final float P5_FRAME = (1.0f*P5_SECONDS/41.7f);
// Velocity Units
public static final float P5_KPH = (P5_KM/P5_HOURS);
public static final float P5_MPS = (P5_M/P5_SECONDS);
// Acceleration Units
public static final float P5_MPSPS = (P5_M/P5_SECONDS/P5_SECONDS);
// Rotation Units
public static final float P5_DEGREES = (1.0f);
public static final float P5_RADIANS = (3.14159f/(180*P5_DEGREES));
public static final float P5_REVOLUTIONS = (P5_DEGREES/360);

  public int m_nNumP5 = 0;
  public P5Data m_P5Devices[] = new P5Data[0];
  public P5State state[] = new P5State[0];
  public P5Info info[] = new P5Info[0];

//Error variables
  int lastErrorCode;
  int lastErrorDevice;

  int leftClickFinger, rightClickFinger, middleClickFinger;
  int leftClickSensitivity, rightClickSensitivity, middleClickSensitivity;

  public CP5DLL() {
    m_nNumP5 = 0;
  }

  static {
    System.loadLibrary("p5dll");
  }


  //Close function
  public native void P5_Close();

  //Init function - required on start of program
  native boolean P5_Doit();
  public boolean P5_Init() {
    boolean result = P5_Doit();
    m_P5Devices = new P5Data[m_nNumP5];
    for (int i=0; i<m_nNumP5; i++) {
      m_P5Devices[i] = new P5Data();
      m_P5Devices[i].m_nDeviceID = i;
      m_P5Devices[i].updateFull();
    }
    state = new P5State[m_nNumP5];
    for (int i=0; i<m_nNumP5; i++) {
      state[i] = new P5State();
      state[i].deviceID = i;
      state[i].update();
    }
    info = new P5Info[m_nNumP5];
    for (int i=0; i<m_nNumP5; i++) {
      info[i] = new P5Info();
      info[i].deviceID = i;
      info[i].update();
    }
    return result;
  }

  public int P5_GetCount() {
    return m_nNumP5;
  }

  public native void P5_SetClickSensitivity(int P5Id, byte leftvalue, byte rightvalue, byte middlevalue);
  public native void P5_GetClickSensitivity(int P5Id);

  public native void P5_SaveBendSensors(int P5Id);
  public native void P5_CalibrateBendSensors(int P5Id);
  public native void P5_CalibratePositionData(int P5Id);

  public native boolean P5_GetMouseState(int P5Id);
  public native void P5_SetMouseState(int P5Id, boolean state);
  public native void P5_SetMouseStickTime(int P5Id, byte time);
  public native int P5_GetMouseStickTime(int P5Id);
  public native void P5_GetMouseButtonAllocation(int P5Id);
  public native void P5_SetMouseButtonAllocation(int P5Id, int leftclickfinger, int rightclickfinger, int middleclickfinger);

  public native boolean P5_GetLastError();

    // AC Adaptor
  public native boolean P5_GetACAdaptorStatus(int P5Id);

    // Bend Sensors
/*extern "C" P5DLL_API void __stdcall P5_GetBendCalibration(int P5Id, int &ThumbStraight, int &ThumbBent,
                             int &IndexStraight, int &IndexBent,
                             int &MiddleStraight, int &MiddleBent,
                             int &RingStraight, int &RingBent,
                             int &PinkyStraight, int &PinkyBent);
*/
/*
extern "C" P5DLL_API void __stdcall P5_GetRawFingerBends(int P5Id, int &thumb, int &index, int &middle, int &ring, int &pinky);
*/
/*
extern "C" P5DLL_API void __stdcall P5_GetCalibrationData(int P5Id, unsigned char data[]);
*/

    // Space Warp
  public native void P5_SetUnits(float units);
  public native void P5_SetForwardZ(int z);
  public native void P5_SetTowerPos(int P5Id, float x, float y, float z);
//extern "C" P5DLL_API void __stdcall P5_SetTowerRotMat(int P5Id, float RotMat[][3]);
  public native void P5_TiltTowerForward(int P5Id, float degrees);
  public native void P5_SpinTowerRight(int P5Id, float degrees);
  public native void P5_TiltTowerRight(int P5Id, float degrees);
  public native void P5_SetSensitivity(int P5Id, float multiplier);

    // Glove configuration
  public native void P5_SetLedPos(int P5Id, int led, float x, float y, float z);
  public native void P5_SetGlovePos(int P5Id, float x, float y, float z);
//extern "C" P5DLL_API void __stdcall P5_SetGloveRotMat(int P5Id, float RotMat[][3]);
  public native void P5_PitchGlove(int P5Id, float theta);
  public native void P5_YawGlove(int P5Id, float theta);
  public native void P5_RollGlove(int P5Id, float theta);

    // Filters
  public native void P5_SetInterfaceMode(int mode);
  public native void P5_SetFilterMode(int filters);
  public native void P5_SetFilterAmount(int ExtraFrames, float DeadDistance);
  public native void P5_ClearArchive(int P5Id);
  public native void P5_SetRequiredAccuracy(float accuracy);
  public native void P5_SetPrediction(int prediction);

    // Mouse
  public native void P5_RestoreMouse(int P5Id);
  public native void P5_UnRestoreMouse(int P5Id);

    // Low level hardware control
//extern "C" P5DLL_API void __stdcall P5_SetFeature(int P5Id, unsigned char usage, unsigned char numvalues, unsigned char *reportdata);
//extern "C" P5DLL_API void __stdcall P5_SetFeatureReport(int P5Id, unsigned char report, unsigned char numvalues, unsigned char *reportdata);
//extern "C" P5DLL_API int __stdcall P5_GetFeature(int P5Id, unsigned char usage, unsigned char numvalues, unsigned char *reportdata);
//extern "C" P5DLL_API int __stdcall P5_GetFeatureReport(int P5Id, unsigned char report, unsigned char numvalues, unsigned char *reportdata);

// Copy structures
//extern "C" P5DLL_API void __stdcall P5_GetData(int P5Id, P5Data &data);
//extern "C" P5DLL_API void __stdcall P5_GetState(int P5Id, int frame, P5State &state);
//extern "C" P5DLL_API void __stdcall P5_GetInfo(int P5Id, P5Info &info);


// Get values stored in structures
//extern "C" P5DLL_API void __stdcall P5_GetAbsolutePos(int P5Id, float *x, float *y, float *z);
//extern "C" P5DLL_API void __stdcall P5_GetRelativePos(int P5Id, float *x, float *y, float *z);
//extern "C" P5DLL_API void __stdcall P5_GetRelativeAvgPos(int P5Id, float *x, float *y, float *z);
//extern "C" P5DLL_API void __stdcall P5_GetRotation(int P5Id, float *yaw, float *pitch, float *roll);
//extern "C" P5DLL_API void __stdcall P5_GetFingerBends(int P5Id, float *thumb, float *index, float *middle, float *ring, float *pinky);
//extern "C" P5DLL_API void __stdcall P5_GetButtons(int P5Id, float *A, float *B, float *C, float *D);
//extern "C" P5DLL_API P5BOOL __stdcall P5_GetThreadStatus(int P5Id);



  public P5Data P5_GetDataPointer(int P5Id) {
    P5Data result = m_P5Devices[P5Id];
    result.update();
    return result;
  }

  public P5State P5_GetStatePointer(int P5Id) {
    P5State result = state[P5Id];
    result.update();
    return result;
  }

  public P5Info P5_GetInfoPointer(int P5Id) {
    P5Info result = info[P5Id];
    result.update();
    return result;
  }

  class P5Data {
        //Actual P5 variables
        public String VendorID, ProductID, Version;
        public String ProductString, ManufacturerString, SerialNumString;

        public int m_nDeviceID;
        public int m_nMajorRevisionNumber, m_nMinorRevisionNumber;

        public int m_nGloveType;

        public float m_fx, m_fy, m_fz;		  //x,y,z of the hand
        public float m_fyaw, m_fpitch, m_froll;  //yaw\pitch\roll of the hand
        public int m_byBendSensor_Data[] = new int[5];  //All the bend sensor data
        public boolean m_byButtons[] = new boolean[4];	 //P5 Button data
        public float m_fRotMat[][] = new float[3][3];        //matrix for inverse kinematics

        public native void update();
        public native void updateFull();
  }

  public class P5State {
// Java specific
    public int deviceID;

// Location
    public float x, y, z;				//x,y,z of the hand
    public float relativeX, relativeY, relativeZ;
    public float relativeAvgX, relativeAvgY, relativeAvgZ;
    public float filterPos[] = new float[3];

    public float velocity[] = new float[3];
    public float acceleration[] = new float[3];

// Rotation
    public float rotMat[][] = new float[3][3]; // rotation matrix [row][column] like Direct3D, premultiply by row vector
    public float pitch, yaw, roll;
    public float filterRotMat[][] = new float[3][3];
    public float filterPitch, filterYaw, filterRoll;
    public float angularVelocity[] = new float[3]; // around the x, y, and z axes
    public float angularAcceleration[] = new float[3];

// Visibility
    public int visible;


// Fingers
    public byte finger[] = new byte[5];	//All the bend sensor data
    public short fingerAbsolute[] = new short[5];
    public float fingerVelocity[] = new float[5];
    public float fingerAcceleration[] = new float[5];

// Buttons
    public boolean button[] = new boolean[4];	//P5 Button data

// Leds
    public float ledPos[][] = new float[10][3];		   //Position of 10 LEDs
    public float ledVelocity[][] = new float[10][3];      //Velocity of 10 LEDs
    public float ledGeometricAccuracy[] = new float[10];//Dot product of vectors to other LEDs
    public boolean ledVisible[] = new boolean[10];  //1 if visible, 0 if not
    public int trackedLed;

// Visible Leds
    public int visibleLedCount;
    public byte visibleLedNumber[] = new byte[4];  //Which of the 10 LEDs is each visible one
    public int visibleLedRaw[][] = new int[4][3]; // Raw Led values -512 to +511
    public float visibleLedV1Angle[] = new float[4];
    public float visibleLedV2Angle[] = new float[4];
    public float visibleLedHAngle[] = new float[4];  //Angle of entry of visible LEDs
    public float visibleLedPos[][] = new float[4][3]; // debug


// Time
    public double timeStamp;
    public float frameRate;
    public long frame;

    public native void update();
  }

  public class P5Info {
    public String vendorID, productID, version;
    public String productString, manufacturerString, serialNumString;
    public int deviceID;
    public int majorRevisionNumber, minorRevisionNumber;
    public int gloveType;

    //Physical Led Layout
    public float actualLedPos[][] = new float[10][3];
    public float ledDistances[][] = new float[10][10];

    //Global tan compensation data
    public float head1_VAngle, head_HAngle, head2_VAngle, head2_HAngle;
    public float headSeparation;

    //AC Adaptrer Status
    public boolean acAdapterStatus;

    //Finger Calibration
    public int fingerStraight[] = new int[5];
    public int fingerBent[] = new int[5];

    //Handles
    public int deviceHandle; // PHID_DEVICE

    public int threadId;
    public int threadHandle;
    public boolean threadStatus;

    public native void update();
  }


  public static void main(String[] args) {
    System.out.println("Hello world!");
    CP5DLL gloves = new CP5DLL();





    gloves.P5_Init();
    System.out.println(gloves.m_nNumP5);
    System.out.println("m_nNumP5='"+gloves.m_nNumP5+"'");
    System.out.println("VendorID = '" + gloves.m_P5Devices[0].VendorID + "', ProductID = '" + gloves.m_P5Devices[0].ProductID + "', Version = '" + gloves.m_P5Devices[0].Version + "'");
    System.out.println("ProductString = '" + gloves.m_P5Devices[0].ProductString + "', ProductID = '" + gloves.m_P5Devices[0].ManufacturerString + "', Version = '" + gloves.m_P5Devices[0].SerialNumString + "'");
    System.out.println("m_nDeviceID = '" + gloves.m_P5Devices[0].m_nDeviceID + "'");
    System.out.println("m_nMajorRevisionNumber = '" + gloves.m_P5Devices[0].m_nMajorRevisionNumber + "', m_nMinorRevisionNumber = '" + gloves.m_P5Devices[0].m_nMinorRevisionNumber+"'");
    System.out.println("m_nGloveType = '" + gloves.m_P5Devices[0].m_nGloveType+"'");
    System.out.println("m_fx = '"+gloves.m_P5Devices[0].m_fx+"'");
    gloves.P5_Close();
  }

}

