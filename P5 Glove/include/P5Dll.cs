using System;
using System.Text;
using System.Runtime.InteropServices;

namespace                             Zion.Input
{
  #region P5Fingers: fingers definitions
  internal enum                       P5Fingers                : byte
  {
    Thumb                             = 0x00,
    Index                             = 0x01,
    Middle                            = 0x02,
    Ring                              = 0x03,
    Pinky                             = 0x04,
  }
  #endregion // P5Fingers: fingers definitions

  #region P5FilterMode: filter modes definitions
  internal enum                       P5FilterMode             : byte
  {
    None                              =   0x0,
    DeadBand                          =   0x1,
    Average                           =   0x2,
  }
  #endregion // P5FilterMode: filter modes definitions
  
  #region P5ErrorCode: Error Codes
  internal enum                       P5ErrorCode               : byte
  {
  
    None                              = 0x00,
    NoP5Detected                      = 0x01,
    P5Disconnected                    = 0x02,
    P5Connected                       = 0x03,
    InvalidP5ID                       = 0x04,
    InvalidP5GloveType                = 0x05,
    WrongFirmwareVer                  = 0x06,
    Exception                         = 0x07,
    Gettime                           = 0x08,
    ParseBend                         = 0x09,
    ParseButtons                      = 0x10,
    ParseLedNum                       = 0x11,
    ParseLed                          = 0x12,
    Unwarp                            = 0x13,
    Process                           = 0x14,
    ProcessRotation                   = 0x15,
    ProcessRelativePosition           = 0x16,
    ProcessRelativeAVGPosition        = 0x17,
    ProcessRotationReal               = 0x18,
    ProcessAbsolutePosition           = 0x19,
    ProcessLedPositions               = 0x20,
    Internal                          = 0x21,
  }
  #endregion // P5ErrorCode: Error Codes

  #region P5Glove: Glove types
  internal enum                       P5Glove                   : byte
  {
    RightHand                         = 0x00,
    LeftHand                          = 0x01,
  }
  #endregion // P5Glove: Glove types

  #region P5Data structure
  [StructLayout(LayoutKind.Sequential)]
  internal struct                     P5Data
  {
    [MarshalAs(UnmanagedType.ByValTStr, SizeConst=50)]
    public string                     VendorID; 

    [MarshalAs(UnmanagedType.ByValTStr, SizeConst=50)]
    public string                     ProductID;

    [MarshalAs(UnmanagedType.ByValTStr, SizeConst=50)]
    public string                     Version;

    [MarshalAs(UnmanagedType.ByValTStr, SizeConst=255)]
    public string                     ProductString;

    [MarshalAs(UnmanagedType.ByValTStr, SizeConst=255)]
    public string                     ManufacturerString;

    [MarshalAs(UnmanagedType.ByValTStr, SizeConst=255)]
    public string                     SerialNumString;

    public int                        DeviceID;
    public int                        MajorRevisionNumber;
    public int                        MinorRevisionNumber;
    public int                        GloveType;

    //  x, y, z of the hand
    public float                      X;
    public float                      Y;
    public float                      Z;          
    
    // yaw, pitch, roll of the hand
    public float                      Yaw;
    public float                      Pitch;
    public float                      Roll;
            
    // All the bend sensor data
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=5)]
    public byte                       BendSensor_Data;

    //P5 Button data
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=4)]
    public byte                       Buttons;
      
    // float RotMat[3][3]
    // matrix for inverse kinematics
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=9)]
    public float[]                    RotMat;           
  }
  #endregion // P5Data structure

  #region P5State structure
  [StructLayout(LayoutKind.Sequential)]
  internal struct                     P5State
  {
    // Location
    public float                      X;
    public float                      Y;
    public float                      Z;

    public float                      RelativeX;
    public float                      RelativeY;
    public float                      RelativeZ;
      
    public float                      RelativeAvgX;
    public float                      RelativeAvgY;
    public float                      RelativeAvgZ;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst=3)]
    public float[]                    FilterPos;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst=3)]
    public float[]                    Velocity;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst=3)]
    public float[]                    Acceleration;

    // Rotation
    // rotation matrix [row][column] like Direct3D, premultiply by row vector
    // RotMat[3][3]
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=9)]
    public float[]                    RotMat;
    public float                      Pitch;
    public float                      Yaw;
    public float                      Roll;

    // FilterRotMat[3][3]
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=9)]
    public float[]                    FilterRotMat;
    public float                      FilterPitch;
    public float                      FilterYaw;
    public float                      FilterRoll;

    // around the x, y, and z axes
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=3)]
    public float[]                    AngularVelocity;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst=3)]
    public float[]                    AngularAcceleration;

    // Visibility
    public int                        Visible;

    // Fingers
    // All the bend sensor data
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=5)]
    public byte[]                     Finger;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst=5)]
    public short[]                    FingerAbsolute;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst=5)]
    public Single[]                   FingerVelocity;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst=5)]
    public Single[]                   FingerAcceleration;

    // Buttons
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=4)]
    public byte[]                     Button;

    // Leds
    // LedPos[10][3]
    // Position of 10 LEDs
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=30)]
    public Single[]                   LedPos;

    // LedVelocity[10][3]
    // Velocity of 10 LEDs
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=30)]
    public Single[]                   LedVelocity;

    // Dot product of vectors to other LEDs
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=10)]
    public Single[]                   LedGeometricAccuracy;
      
    // 1 if visible, 0 if not
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=10)]
    public byte[]                     LedVisible;
    public int                        TrackedLed;

    // Visible Leds
    public int                        VisibleLedCount;

    // Which of the 10 LEDs is each visible one
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=4)]
    public byte[]                     VisibleLedNumber;

    // Raw Led values -512 to +511
    // VisibleLedRaw[4][3]
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=12)]
    public int[]                      VisibleLedRaw;

    // Angle of entry of visible LEDs
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=4)]
    public Single[]                   VisibleLedV1Angle;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst=4)]
    public Single[]                   VisibleLedV2Angle;

    [MarshalAs(UnmanagedType.ByValArray, SizeConst=4)]
    public Single[]                   VisibleLedHAngle;

    // debug
    // VisibleLedPos[4][3]
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=12)]
    public Single[]                   VisibleLedPos; 


    // Time
    public double                     TimeStamp;
    public float                      FrameRate;
    public Int64                      Frame;
  }
  #endregion // P5State structure

  #region P5Info structure
  [StructLayout(LayoutKind.Sequential)]
  internal struct                     P5Info
  {
    [ MarshalAs( UnmanagedType.ByValTStr, SizeConst=52 )]
    public string                     VendorID;

    [MarshalAs(UnmanagedType.ByValTStr, SizeConst=52)]
    public string                     ProductID;

    [MarshalAs(UnmanagedType.ByValTStr, SizeConst=52)]
    public string                     Version;

    
    [MarshalAs(UnmanagedType.ByValTStr, SizeConst=256)]
    public string                     ProductString;

    [MarshalAs(UnmanagedType.ByValTStr, SizeConst=256)]
    public string                     ManufacturerString;
    
    [MarshalAs(UnmanagedType.ByValTStr, SizeConst=256)]
    public string                     SerialNumString;

    public int                        DeviceID;
    public int                        MajorRevisionNumber;
    public int                        MinorRevisionNumber;
    public int                        GloveType;

    // Physical Led Layout
    // ActualLedPos[10][3]
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=30)]
    public float[]                    ActualLedPos;

    // ActualLedPos[10][10]
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=100)]
    public float[]                    LEDDistances;

    // Global tan compensation data
    public float                      Head1_VAngle;
    public float                      Head_HAngle;
    public float                      Head2_VAngle;
    public float                      Head2_HAngle;
    
    public float                      HeadSeparation;

    // AC Adaptrer Status (boolean)
    public uint                       ACAdapterStatus;

    // Finger Calibration
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=5)]
    public int[]                      FingerStraight;
    
    [MarshalAs(UnmanagedType.ByValArray, SizeConst=5)]
    public int[]                      FingerBent;

    // Handles
    public IntPtr                     DeviceHandle;

    public uint                       ThreadId;
    public uint                       ThreadHandle;
    public uint                       ThreadStatus; // (bool)
  }
  #endregion // P5Info structure

  #region P5Dll: P5 Class
  internal sealed class               P5Dll
  {
    #region Constants
    public const float                P5HeadSeparation  = 51.2f;
  
    // Distance units
    public const float                P5Units           = 1.0f;
    public const float                P5CMeter          = 2.54f / 51.2f;
    public const float                P5MMeter          = P5CMeter * 10.0f;
    public const float                P5Inches          = 1.0f / 51.2f;
    public const float                P5Feet            = 1.0f / 51.2f / 12.0f;
    public const float                P5Meter           = P5CMeter / 100.0f;
    public const float                P5KMeter          = P5Meter / 1000.0f;
    
    // Time Units
    public const float                P5Seconds         = 1.0f;
    public const float                P5Minutes         = P5Seconds / 60.0f;
    public const float                P5Hours           = P5Minutes / 60.0f;
    public const float                P5Frame           = 1.0f * P5Seconds / 41.7f;

    // Velocity Units
    public const float                P5KPH             = P5KMeter / P5Hours;
    public const float                P5MPS             = P5Meter / P5Seconds;
    
    // Acceleration Units
    public const float                P5MPSPS           = P5Meter / P5Seconds / P5Seconds;
    
    // Rotation Units
    public const float                P5Degrees         = 1.0f;
    public const float                P5Radians         = 3.14159f / (180.0f * P5Degrees);
    public const float                P5Revolutions     = P5Degrees / 360.0f;

    
    // What rotation to return via the old interface
    public const int                  P5modeOriginalPYR = 256 * 0;

    public const int                  P5ModeBetterPYR   = 256 * 10;
    public const int                  P5ModeBetterYPR   = 256 * 11;
    public const int                  P5ModeBetterRYP   = 256 * 12;
    public const int                  P5ModeBetterRPY   = 256 * 13;
    public const int                  P5ModeBetterMIX   = 256 * 14;

    public const int                  P5ModeFilteredPYR = 256 * 20;
    public const int                  P5ModeFilteredYPR = 256 * 21;
    public const int                  P5ModeFilteredRYP = 256 * 22;
    public const int                  P5ModeFilteredRPY = 256 * 23;
    public const int                  P5ModeFilteredMIX = 256 * 24;
    #endregion // Constants

    #region Private Membres
    private bool                      _connected = false;
    private int                       _P5id = 0;
    #endregion // Private Membres

    #region Properties
    public bool                       Connected
    {
      get { return _connected; }
    }
    #endregion // Properties

    #region Constructor
    public                            P5Dll()
    {
    }
    #endregion // Constructor

    #region Public methods
    public bool                       Connect()
    {
      _connected                      = P5_Init() == 0 ? false : true ;
      return _connected;
    }

    public void                       Close()
    {
      _connected                      = false;
      P5_Close();
    }

    public P5State                    GetState()
    {
      IntPtr intPtr                   = P5_GetStatePointer(_P5id);
      return (P5State) Marshal.PtrToStructure(intPtr, typeof(P5State));
    }

    public P5Data                     GetData()
    {
      IntPtr intPtr                   = P5_GetDataPointer(_P5id);
      return (P5Data) Marshal.PtrToStructure(intPtr, typeof(P5Data));
    }

    public P5Info                     GetInfo()
    {
      IntPtr intPtr                   = P5_GetInfoPointer(_P5id);
      return (P5Info) Marshal.PtrToStructure(intPtr, typeof(P5Info));
    }

    public void                       SetMouseState(bool state)
    {
      P5_SetMouseState(_P5id, (uint)(state ? 1 : 0));
    }

    #endregion // Public methods

    #region Static imported methods
    /// <summary>
    /// Init function - required on start of program 
    /// </summary>
    /// <returns>Connected (bool)</returns>
    [DllImport("P5Dll.dll")]
    static private extern uint        P5_Init();

    [DllImport("P5Dll.dll")]
    static private extern void        P5_Close();

    [DllImport("P5Dll.dll")]
    static private extern IntPtr      P5_GetCP5DLL();

    [DllImport("P5Dll.dll")]
    static private extern IntPtr      P5_GetCP5();

    [DllImport("P5Dll.dll")]
    static public extern int          P5_GetCount();

    /// <summary>
    /// 
    /// </summary>
    /// <param name="P5Id"></param>
    /// <returns>P5Data *</returns>
    [DllImport("P5Dll.dll")]
    static private extern IntPtr      P5_GetDataPointer(int P5Id);

    /// <summary>
    /// 
    /// </summary>
    /// <param name="P5Id"></param>
    /// <returns>P5State *</returns>
    [DllImport("P5Dll.dll")]
    static private extern IntPtr      P5_GetStatePointer(int P5Id);

    /// <summary>
    /// 
    /// </summary>
    /// <param name="P5Id"></param>
    /// <returns>P5Info *</returns>
    [DllImport("P5Dll.dll")]
    static private extern IntPtr      P5_GetInfoPointer(int P5Id);

    /// <summary>
    /// 
    /// </summary>
    /// <param name="P5Id"></param>
    /// <returns>Void *</returns>
    [DllImport("P5Dll.dll")]
    static private extern IntPtr      P5_GetPrivatePointer(int P5Id);


    [DllImport("P5Dll.dll")]
    static public extern void         P5_SaveBendSensors(int P5Id);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_CalibrateBendSensors(int P5Id);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_CalibratePositionData(int P5Id);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_SetClickSensitivity(int P5Id, byte leftvalue, byte rightvalue, byte middlevalue);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_GetClickSensitivity(int P5Id, ref int leftclick, ref int rightclick, ref int middleclick);

    [DllImport("P5Dll.dll")]
    static public extern uint         P5_GetMouseState(int P5Id);

    /// <summary>
    /// 
    /// </summary>
    /// <param name="P5Id">P5 ID (int)</param>
    /// <param name="state">(bool)</param>
    [DllImport("P5Dll.dll")]
    static private extern void        P5_SetMouseState(int P5Id, uint state);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_SetMouseStickTime(int P5Id, byte time);

    [DllImport("P5Dll.dll")]
    static public extern int          P5_GetMouseStickTime(int P5Id);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_GetMouseButtonAllocation(int P5Id, ref int leftclick, ref int rightclick, ref int middleclick);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_SetMouseButtonAllocation(int P5Id, int leftclickfinger, int rightclickfinger, int middleclickfinger);

    [DllImport("P5Dll.dll")]
    static public extern uint         P5_GetLastError(ref int P5Id, ref int ErrorCode);

    // AC Adaptor
    [DllImport("P5Dll.dll")]
    static public extern uint         P5_GetACAdaptorStatus(int P5Id);

    // Bend Sensors
    [DllImport("P5Dll.dll")]
    static public extern void         P5_GetBendCalibration(int P5Id, ref int ThumbStraight,  ref int ThumbBent,
      ref int IndexStraight,  ref int IndexBent,
      ref int MiddleStraight, ref int MiddleBent,
      ref int RingStraight,   ref int RingBent,
      ref int PinkyStraight,  ref int PinkyBent);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_GetRawFingerBends(int P5Id, ref int thumb, ref int index, ref int middle, ref int ring, ref int pinky);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_GetCalibrationData(int P5Id, byte[] data);

    // Space Warp
    [DllImport("P5Dll.dll")]
    static public extern void         P5_SetUnits(float units);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_SetForwardZ(int z);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_SetTowerPos(int P5Id, float x, float y, float z);

    /// <summary>
    /// 
    /// </summary>
    /// <param name="P5Id"></param>
    /// <param name="RotMat">(float[][3])</param>
    //    [DllImport("P5Dll.dll")]
    //    static public extern void         P5_SetTowerRotMat(int P5Id, float[] RotMat);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_TiltTowerForward(int P5Id, float degrees);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_SpinTowerRight(int P5Id, float degrees);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_TiltTowerRight(int P5Id, float degrees);

    // Glove configuration
    [DllImport("P5Dll.dll")]
    static public extern void         P5_SetLedPos(int P5Id, int led, float x, float y, float z);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_SetGlovePos(int P5Id, float x, float y, float z);

    //    [DllImport("P5Dll.dll")]
    //    static public extern void         P5_SetGloveRotMat(int P5Id, float RotMat[][3]);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_PitchGlove(int P5Id, float theta);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_YawGlove(int P5Id, float theta);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_RollGlove(int P5Id, float theta);


    // Filters
    [DllImport("P5Dll.dll")]
    static public extern void         P5_SetInterfaceMode(int mode);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_SetFilterMode(int filters);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_SetFilterAmount(int ExtraFrames, float DeadDistance);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_ClearArchive(int P5Id);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_SetRequiredAccuracy(float accuracy);

    // Mouse
    [DllImport("P5Dll.dll")]
    static public extern void         P5_RestoreMouse(int P5Id);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_UnRestoreMouse(int P5Id);


    // Low level hardware control
    [DllImport("P5Dll.dll")]
    static public extern void         P5_SetFeature(int P5Id, byte usage, byte numvalues, ref byte reportdata);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_SetFeatureReport(int P5Id, byte report, byte numvalues, ref byte reportdata);

    [DllImport("P5Dll.dll")]
    static public extern int          P5_GetFeature(int P5Id, byte usage, byte numvalues, ref byte reportdata);

    [DllImport("P5Dll.dll")]
    static public extern int          P5_GetFeatureReport(int P5Id, byte report, byte numvalues, ref byte reportdata);

    // Copy structures
    [DllImport("P5Dll.dll")]
    static public extern void         P5_GetData(int P5Id, ref P5Data data);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_GetState(int P5Id, int frame, ref P5State state);

    [DllImport("P5Dll.dll")]
    static public extern void         P5_GetInfo(int P5Id, ref P5Info info);


    // Get values stored in structures
    [DllImport("P5Dll.dll")]
    static public extern void       P5_GetAbsolutePos(int P5Id, ref float x, ref float y, ref float z);

    [DllImport("P5Dll.dll")]
    static public extern void       P5_GetRelativePos(int P5Id, ref float x, ref float y, ref float z);

    [DllImport("P5Dll.dll")]
    static public extern void       P5_GetRelativeAvgPos(int P5Id, ref float x, ref float y, ref float z);

    [DllImport("P5Dll.dll")]
    static public extern void       P5_GetRotation(int P5Id, ref float yaw, ref float pitch, ref float roll);

    [DllImport("P5Dll.dll")]
    static public extern void       P5_GetFingerBends(int P5Id, ref float thumb, ref float index, ref float middle, ref float ring, ref float pinky);

    [DllImport("P5Dll.dll")]
    static public extern void       P5_GetButtons(int P5Id, ref float A, ref float B, ref float C, ref float D);

    [DllImport("P5Dll.dll")]
    static public extern uint       P5_GetThreadStatus(int P5Id);
    #endregion // Static imported methods
  }
  #endregion // P5Dll: P5 Class
}
