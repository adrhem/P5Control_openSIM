Attribute VB_Name = "P5DLL"
Option Explicit

'/******************************************************************************
'//  File:   p5dll.hpp
'//  Use:    wrapper that is exposed to the world.
'//
'//  Authors:    Av Utukuri, Igor Borysov, Carl Kenner
'//
'//
'//
'//  Copyright (c) 2001-2004 Essential Reality LLC
'//
'//
'//  Updates
'//
'//  Aug 24\01 - Av Utukuri - Finished V1.0, made all variables follow hungarian notation, cleaned up dead code
'//  Sep 10\04 - Carl Kenner - Added non-C++ exported functions, extra features, new data structures and more constants
'******************************************************************************/

'Actually the fraction of an inch units are measured in, not the Head Separation.
Public Const P5HEAD_SEPARATION = 51.2

'fingers definitions
Public Const P5_THUMB = 0
Public Const P5_INDEX = 1
Public Const P5_MIDDLE = 2
Public Const P5_RING = 3
Public Const P5_PINKY = 4

'filter modes definitions
Public Const P5_FILTER_NONE = 0
Public Const P5_FILTER_DEADBAND = 1
Public Const P5_FILTER_AVERAGE = 2

' [sic]
Public Const P5_FILTER_DEADBEND = 1



'Error Codes
Public Const P5ERROR_NONE = 0
Public Const P5ERROR_NOP5DETECTED = 1
Public Const P5ERROR_P5DISCONNECTED = 2
Public Const P5ERROR_P5CONNECTED = 3
Public Const P5ERROR_INVALID_P5ID = 4
Public Const P5ERROR_INVALID_P5GLOVETYPE = 5
Public Const P5ERROR_WRONGFIRMWAREVER = 6
Public Const P5ERROR_EXCEPTION = 7
Public Const P5ERROR_GETTIME = 8
Public Const P5ERROR_PARSEBEND = 9
Public Const P5ERROR_PARSEBUTTONS = 10
Public Const P5ERROR_PARSELEDNUM = 11
Public Const P5ERROR_PARSELED = 12
Public Const P5ERROR_UNWARP = 13
Public Const P5ERROR_PROCESS = 14
Public Const P5ERROR_PROCESSROTATION = 15
Public Const P5ERROR_PROCESSRELATIVEPOSITION = 16
Public Const P5ERROR_PROCESSRELATIVEAVGPOSITION = 17
Public Const P5ERROR_PROCESSROTATIONREAL = 18
Public Const P5ERROR_PROCESSABSOLUTEPOSITION = 19
Public Const P5ERROR_PROCESSLEDPOSITIONS = 20
Public Const P5ERROR_INTERNAL = 21

'Glove types
Public Const P5GLOVETYPE_RIGHTHAND = 0
Public Const P5GLOVETYPE_LEFTHAND = 1


'Glove backwards
Public Const P5GLOVEBACKWARDS_NOT = 0
Public Const P5GLOVEBACKWARDS_THUMBLITTLE = 1
Public Const P5GLOVEBACKWARDS_NOTHUMB = 2
Public Const P5GLOVEBACKWARDS_UPSIDEDOWN = 3
Public Const P5GLOVEBACKWARDS_DONTWORRY = 4


' Distance units
Public Const P5_UNITS = 1#
Public Const P5_CM = 2.54 / 51.2
Public Const P5_MM = P5_CM * 10
Public Const P5_INCHES = 1# / 51.2
Public Const P5_FEET = 1# / 51.2 / 12#
Public Const P5_M = P5_CM / 100
Public Const P5_KM = P5_M / 1000
' Time Units
Public Const P5_SECONDS = 1#
Public Const P5_MINUTES = P5_SECONDS / 60
Public Const P5_HOURS = P5_MINUTES / 60
Public Const P5_FRAME = 1# * P5_SECONDS / 41.7
' Velocity Units
Public Const P5_KPH = P5_KM / P5_HOURS
Public Const P5_MPS = P5_M / P5_SECONDS
' Acceleration Units
Public Const P5_MPSPS = P5_M / P5_SECONDS / P5_SECONDS
' Rotation Units
Public Const P5_DEGREES = 1#
Public Const P5_RADIANS = 3.14159 / (180 * P5_DEGREES)
Public Const P5_REVOLUTIONS = P5_DEGREES / 360


' What position to return via the old interface
Public Const P5MODE_RELATIVE = 0
Public Const P5MODE_ABSOLUTE = 1
Public Const P5MODE_RELATIVEAVG = 2
Public Const P5MODE_FILTERED = 3
Public Const P5MODE_LED0 = 4
Public Const P5MODE_LED1 = 5
Public Const P5MODE_LED2 = 6
Public Const P5MODE_LED3 = 7
Public Const P5MODE_LED4 = 8
Public Const P5MODE_LED5 = 9
Public Const P5MODE_LED6 = 10
Public Const P5MODE_LED7 = 11
Public Const P5MODE_LED8 = 12
Public Const P5MODE_LED9 = 13
Public Const P5MODE_LEDBRIGHT = 14
Public Const P5MODE_LEDBEST = 15

' What rotation to return via the old interface
Public Const P5MODE_ORIGINAL_PYR = 256 * 0

Public Const P5MODE_BETTER_PYR = 256 * 10
Public Const P5MODE_BETTER_YPR = 256 * 11
Public Const P5MODE_BETTER_RYP = 256 * 12
Public Const P5MODE_BETTER_RPY = 256 * 13
Public Const P5MODE_BETTER_YRP = 256 * 14
Public Const P5MODE_BETTER_PRY = 256 * 15
Public Const P5MODE_BETTER_MIX = 256 * 16

Public Const P5MODE_FILTERED_PYR = 256 * 20
Public Const P5MODE_FILTERED_YPR = 256 * 21
Public Const P5MODE_FILTERED_RYP = 256 * 22
Public Const P5MODE_FILTERED_RPY = 256 * 23
Public Const P5MODE_FILTERED_YRP = 256 * 14
Public Const P5MODE_FILTERED_PRY = 256 * 15
Public Const P5MODE_FILTERED_MIX = 256 * 24


Public Type P5Data
'Actual P5 variables
    VendorID(0 To 49) As Byte
    ProductID(0 To 49) As Byte ' As String * 50
    Version(0 To 49) As Byte ' As String * 50
    ProductString(0 To 254) As Byte ' As String * 255
    ManufacturerString(0 To 254) As Byte ' As String * 255
    SerialNumString(0 To 254) As Byte ' As String * 255

    m_nDeviceID As Long
    m_nMajorRevisionNumber As Long
    m_nMinorRevisionNumber As Long

    m_nGloveType As Long

    m_fx As Single 'x,y,z of the hand
    m_fy As Single
    m_fz As Single

    m_fyaw As Single 'yaw\pitch\roll of the hand
    m_fpitch As Single
    m_froll As Single
    m_byBendSensor_Data(0 To 4) As Byte 'All the bend sensor data
    m_byButtons(0 To 3) As Byte 'P5 Button data
    m_fRotMat(0 To 2, 0 To 2) As Single 'matrix for inverse kinematics
End Type

Public Type P5State
' Location
    x As Single
    y As Single
    z As Single
    RelativeX As Single
    RelativeY As Single
    RelativeZ As Single
    RelativeAvgX As Single
    RelativeAvgY As Single
    RelativeAvgZ As Single
    FilterPos(0 To 2) As Single
    
    Velocity(0 To 2) As Single
    Acceleration(0 To 2) As Single

' Rotation
    RotMat(0 To 2, 0 To 2) As Single
    pitch As Single
    yaw As Single
    roll As Single
    FilterRotMat(0 To 2, 0 To 2) As Single
    FilterPitch As Single
    FilterYaw As Single
    FilterRoll As Single
    AngularVelocity(0 To 2) As Single
    AngularAcceleration(0 To 2) As Single
    
' Visibility
    Visible As Long

    
' Fingers
    finger(0 To 4) As Byte
    FingerAbsolute(0 To 4) As Integer
    FingerVelocity(0 To 4) As Single
    FingerAcceleration(0 To 4) As Single

' Buttons
    button(0 To 3) As Byte

' Leds
    LedPos(0 To 9, 0 To 2) As Single
    LedVelocity(0 To 9, 0 To 2) As Single
    LedGeometricAccuracy(0 To 9) As Single
    LedVisible(0 To 9) As Byte
    TrackedLed As Long
     
' Visible Leds
    VisibleLedCount As Long
    VisibleLedNumber(0 To 3) As Byte
    VisibleLedRaw(0 To 3, 0 To 2) As Long
    VisibleLedV1Angle(0 To 3) As Single
    VisibleLedV2Angle(0 To 3) As Single
    VisibleLedHAngle(0 To 3) As Single
    VisibleLedPos(0 To 3, 0 To 2) As Single
   
' Time
    TimeStamp As Double
    FrameRate As Single
    Pad As Long
    Frame As Currency  'multiply this by 10000 to get real value
End Type



Public Type P5Info
    VendorID(0 To 51) As Byte
    ProductID(0 To 51) As Byte ' As String * 50
    Version(0 To 51) As Byte ' As String * 50
    ProductString(0 To 256) As Byte ' As String * 255
    ManufacturerString(0 To 256) As Byte ' As String * 255
    SerialNumString(0 To 256) As Byte ' As String * 255

    DeviceID As Long
    MajorRevisionNumber As Long
    MinorRevisionNumber As Long
    GloveType As Long

    'Physical Led Layout
    ActualLedPos(0 To 9, 0 To 2) As Single
    LEDDistances(0 To 9, 0 To 9) As Single

    'Global tan compensation data
    Head1_VAngle As Single
    Head_HAngle As Single
    Head2_VAngle As Single
    Head2_HAngle As Single
    HeadSeparation As Single

    'AC Adaptrer Status
    ACAdapterStatus As Long

    'Finger Calibration
    FingerStraight(0 To 4) As Long
    FingerBent(0 To 4) As Long

    'Handles
    DeviceHandle As Long ' PHID_DEVICE

    ThreadId As Long
    ThreadHandle As Long
    ThreadStatus As Long
End Type




'Close function
Public Declare Sub P5_Close Lib "P5DLL.dll" ()
'Init function - required on start of program
Public Declare Function P5_Init Lib "P5DLL.dll" () As Boolean

Public Declare Sub P5_SetClickSensitivity Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal leftvalue As Byte, ByVal rightvalue As Byte, ByVal middlevalue As Byte)
Public Declare Sub P5_GetClickSensitivity Lib "P5DLL.dll" (ByVal P5Id As Long, ByRef leftclick As Long, ByRef rightclick As Long, ByRef middleclick As Long)

Public Declare Sub P5_SaveBendSensors Lib "P5DLL.dll" (Optional ByVal P5Id As Long = -1)
Public Declare Sub P5_CalibrateBendSensors Lib "P5DLL.dll" (Optional ByVal P5Id As Long = -1)
Public Declare Sub P5_CalibratePositionData Lib "P5DLL.dll" (Optional ByVal P5Id As Long = -1)

Public Declare Function P5_GetMouseState Lib "P5DLL.dll" (Optional ByVal P5Id As Long = 0) As Boolean
Public Declare Sub P5_SetMouseState Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal state As Long)

Public Declare Sub P5_SetMouseStickTime Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal time As Byte)
Public Declare Function P5_GetMouseStickTime Lib "P5DLL.dll" (Optional ByVal P5Id As Long = 0) As Long
Public Declare Sub P5_GetMouseButtonAllocation Lib "P5DLL.dll" (ByVal P5Id As Long, ByRef leftclick As Long, ByRef rightclick As Long, ByRef middleclick As Long)
Public Declare Sub P5_SetMouseButtonAllocation Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal leftclickfinger As Long, ByVal rightclickfinger As Long, ByVal middleclickfinger As Long)

Public Declare Function P5_GetLastError Lib "P5DLL.dll" (ByRef P5Id As Long, ByRef ErrorCode As Long) As Boolean



Public Declare Function P5_GetCount Lib "P5DLL.dll" () As Long


' AC Adaptor
Public Declare Function P5_GetACAdaptorStatus Lib "P5DLL.dll" (Optional ByVal P5Id As Long = 0) As Long

' Bend Sensors
Public Declare Sub P5_GetBendCalibration Lib "P5DLL.dll" (ByVal P5Id As Long, ByRef ThumbStraight As Long, ByRef ThumbBent As Long, _
                             ByRef IndexStraight As Long, ByRef IndexBent As Long, _
                             ByRef MiddleStraight As Long, ByRef MiddleBent As Long, _
                             ByRef RingStraight As Long, ByRef RingBent As Long, _
                             ByRef PinkyStraight As Long, ByRef PinkyBent As Long)
Public Declare Sub P5_GetRawFingerBends Lib "P5DLL.dll" (ByVal P5Id As Long, ByRef thumb As Long, ByRef index As Long, ByRef middle As Long, ByRef ring As Long, ByRef pinky As Long)
Public Declare Sub P5_GetCalibrationData Lib "P5DLL.dll" (ByVal P5Id As Long, ByRef data As Any)

' Space Warp
Public Declare Sub P5_SetUnits Lib "P5DLL.dll" (Optional ByVal units As Single = 1#)
Public Declare Sub P5_SetForwardZ Lib "P5DLL.dll" (Optional ByVal z As Long = 1)

Public Declare Sub P5_SetTowerPos Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal x As Single, ByVal y As Single, ByVal z As Single)
Public Declare Sub P5_SetTowerRotMat Lib "P5DLL.dll" (ByVal P5Id As Long, RotMat() As Single)
Public Declare Sub P5_TiltTowerForward Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal degrees As Single)
Public Declare Sub P5_SplongowerRight Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal degrees As Single)
Public Declare Sub P5_TiltTowerRight Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal degrees As Single)

Public Declare Sub P5_SetSensitivity Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal multiplier As Single)

' Glove configuration
Public Declare Sub P5_SetLedPos Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal led As Long, ByVal x As Single, ByVal y As Single, ByVal z As Single)
Public Declare Sub P5_SetGlovePos Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal x As Single, ByVal y As Single, ByVal z As Single)
Public Declare Sub P5_SetGloveRotMat Lib "P5DLL.dll" (ByVal P5Id As Long, ByRef RotMat() As Single)
Public Declare Sub P5_PitchGlove Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal theta As Single)
Public Declare Sub P5_YawGlove Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal theta As Single)
Public Declare Sub P5_RollGlove Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal theta As Single)


' Filters
Public Declare Sub P5_SetInterfaceMode Lib "P5DLL.dll" (ByVal mode As Long)
Public Declare Sub P5_SetFilterMode Lib "P5DLL.dll" (ByVal filters As Long)
Public Declare Sub P5_SetFilterAmount Lib "P5DLL.dll" (ByVal ExtraFrames As Long, ByVal DeadDistance As Single)
Public Declare Sub P5_ClearArchive Lib "P5DLL.dll" (Optional ByVal P5Id As Long = -1)
Public Declare Sub P5_SetRequiredAccuracy Lib "P5DLL.dll" (Optional ByVal accuracy As Single = 10)
Public Declare Sub P5_SetPrediction Lib "P5DLL.dll" (Optional ByVal prediction As Long = 1)

' Mouse
Public Declare Sub P5_RestoreMouse Lib "P5DLL.dll" (Optional ByVal P5Id As Long = -1)
Public Declare Sub P5_UnRestoreMouse Lib "P5DLL.dll" (Optional ByVal P5Id As Long = -1)


' Low level hardware control
Public Declare Sub P5_SetFeature Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal usage As Byte, ByVal numvalues As Byte, ByRef reportdata As Any)
Public Declare Sub P5_SetFeatureReport Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal report As Byte, ByVal numvalues As Byte, ByRef reportdata As Any)
Public Declare Function P5_GetFeature Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal usage As Byte, ByVal numvalues As Byte, ByRef reportdata As Any) As Long
Public Declare Function P5_GetFeatureReport Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal report As Byte, ByVal numvalues As Byte, ByRef reportdata As Any) As Long

' Copy structures
Public Declare Sub P5_GetData Lib "P5DLL.dll" (ByVal P5Id As Long, ByRef data As P5Data)
Public Declare Sub P5_GetState Lib "P5DLL.dll" (ByVal P5Id As Long, ByVal Frame As Long, ByRef state As P5State)
Public Declare Sub P5_GetInfo Lib "P5DLL.dll" (ByVal P5Id As Long, ByRef info As P5Info)


' Get values stored in structures
Public Declare Sub P5_GetAbsolutePos Lib "P5DLL.dll" (ByVal P5Id As Long, ByRef x As Single, ByRef y As Single, ByRef z As Single)
Public Declare Sub P5_GetRelativePos Lib "P5DLL.dll" (ByVal P5Id As Long, ByRef x As Single, ByRef y As Single, ByRef z As Single)
Public Declare Sub P5_GetRelativeAvgPos Lib "P5DLL.dll" (ByVal P5Id As Long, ByRef x As Single, ByRef y As Single, ByRef z As Single)
Public Declare Sub P5_GetRotation Lib "P5DLL.dll" (ByVal P5Id As Long, ByRef yaw As Single, ByRef pitch As Single, ByRef roll As Single)
Public Declare Sub P5_GetFingerBends Lib "P5DLL.dll" (ByVal P5Id As Long, ByRef thumb As Single, ByRef index As Single, ByRef middle As Single, ByRef ring As Single, ByRef pinky As Single)
Public Declare Sub P5_GetButtons Lib "P5DLL.dll" (ByVal P5Id As Long, ByRef A As Single, ByRef B As Single, ByRef C As Single, ByRef D As Single)
Public Declare Function P5_GetThreadStatus Lib "P5DLL.dll" (ByVal P5Id As Long) As Boolean



