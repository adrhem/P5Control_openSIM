VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form VBControlPanelForm 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "P5 Glove Control Panel 2"
   ClientHeight    =   6345
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6345
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   423
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   423
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox GloveNumberBox 
      Height          =   315
      ItemData        =   "VBControlPanelForm.frx":0000
      Left            =   120
      List            =   "VBControlPanelForm.frx":0002
      Style           =   2  'Dropdown List
      TabIndex        =   31
      Top             =   5880
      Width           =   1695
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   2280
      Top             =   5760
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   330
      Left            =   3960
      TabIndex        =   3
      Top             =   5880
      Width           =   1095
   End
   Begin VB.CommandButton ApplyButton 
      Caption         =   "&Apply"
      Enabled         =   0   'False
      Height          =   330
      Left            =   5160
      TabIndex        =   2
      Top             =   5880
      Width           =   1095
   End
   Begin VB.CommandButton OkButton 
      Caption         =   "O&K"
      Default         =   -1  'True
      Height          =   330
      Left            =   2760
      TabIndex        =   1
      Top             =   5880
      Width           =   1095
   End
   Begin VB.Frame TabFrame 
      BorderStyle     =   0  'None
      Caption         =   "Calibration"
      Height          =   5055
      Index           =   0
      Left            =   240
      TabIndex        =   4
      Top             =   480
      Width           =   5895
      Begin VB.Frame Frame1 
         Caption         =   "Bending Data"
         Height          =   3855
         Left            =   120
         TabIndex        =   8
         Top             =   240
         Width           =   2895
         Begin MSComctlLib.ProgressBar FingerBar 
            Height          =   1215
            Index           =   0
            Left            =   360
            TabIndex        =   9
            ToolTipText     =   "Thumb"
            Top             =   1560
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   2143
            _Version        =   393216
            Appearance      =   1
            Max             =   63
            Orientation     =   1
            Scrolling       =   1
         End
         Begin MSComctlLib.ProgressBar FingerBar 
            Height          =   1935
            Index           =   1
            Left            =   840
            TabIndex        =   10
            ToolTipText     =   "Index"
            Top             =   840
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   3413
            _Version        =   393216
            Appearance      =   1
            Max             =   63
            Orientation     =   1
            Scrolling       =   1
         End
         Begin MSComctlLib.ProgressBar FingerBar 
            Height          =   2295
            Index           =   2
            Left            =   1320
            TabIndex        =   11
            ToolTipText     =   "Middle"
            Top             =   480
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   4048
            _Version        =   393216
            Appearance      =   1
            Max             =   63
            Orientation     =   1
            Scrolling       =   1
         End
         Begin MSComctlLib.ProgressBar FingerBar 
            Height          =   2055
            Index           =   3
            Left            =   1800
            TabIndex        =   12
            ToolTipText     =   "Ring"
            Top             =   720
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   3625
            _Version        =   393216
            Appearance      =   1
            Max             =   63
            Orientation     =   1
            Scrolling       =   1
         End
         Begin MSComctlLib.ProgressBar FingerBar 
            Height          =   1575
            Index           =   4
            Left            =   2280
            TabIndex        =   13
            ToolTipText     =   "Pinky"
            Top             =   1200
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   2778
            _Version        =   393216
            Appearance      =   1
            Max             =   63
            Orientation     =   1
            Scrolling       =   1
         End
         Begin VB.Label FingerAbsolute 
            Alignment       =   1  'Right Justify
            Caption         =   "500"
            ForeColor       =   &H00800000&
            Height          =   255
            Index           =   4
            Left            =   2160
            TabIndex        =   96
            Top             =   3480
            Width           =   375
         End
         Begin VB.Label FingerBend 
            Alignment       =   1  'Right Justify
            Caption         =   "63"
            ForeColor       =   &H00800000&
            Height          =   255
            Index           =   4
            Left            =   2160
            TabIndex        =   95
            Top             =   3240
            Width           =   375
         End
         Begin VB.Label FingerAbsolute 
            Alignment       =   1  'Right Justify
            Caption         =   "500"
            ForeColor       =   &H00800000&
            Height          =   255
            Index           =   3
            Left            =   1680
            TabIndex        =   94
            Top             =   3480
            Width           =   375
         End
         Begin VB.Label FingerBend 
            Alignment       =   1  'Right Justify
            Caption         =   "63"
            ForeColor       =   &H00800000&
            Height          =   255
            Index           =   3
            Left            =   1680
            TabIndex        =   93
            Top             =   3240
            Width           =   375
         End
         Begin VB.Label FingerAbsolute 
            Alignment       =   1  'Right Justify
            Caption         =   "500"
            ForeColor       =   &H00800000&
            Height          =   255
            Index           =   2
            Left            =   1200
            TabIndex        =   92
            Top             =   3480
            Width           =   375
         End
         Begin VB.Label FingerBend 
            Alignment       =   1  'Right Justify
            Caption         =   "63"
            ForeColor       =   &H00800000&
            Height          =   255
            Index           =   2
            Left            =   1200
            TabIndex        =   91
            Top             =   3240
            Width           =   375
         End
         Begin VB.Label FingerAbsolute 
            Alignment       =   1  'Right Justify
            Caption         =   "500"
            ForeColor       =   &H00800000&
            Height          =   255
            Index           =   1
            Left            =   720
            TabIndex        =   90
            Top             =   3480
            Width           =   375
         End
         Begin VB.Label FingerBend 
            Alignment       =   1  'Right Justify
            Caption         =   "63"
            ForeColor       =   &H00800000&
            Height          =   255
            Index           =   1
            Left            =   720
            TabIndex        =   89
            Top             =   3240
            Width           =   375
         End
         Begin VB.Label FingerAbsolute 
            Alignment       =   1  'Right Justify
            Caption         =   "500"
            ForeColor       =   &H00800000&
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   88
            Top             =   3480
            Width           =   375
         End
         Begin VB.Label FingerBend 
            Alignment       =   1  'Right Justify
            Caption         =   "63"
            ForeColor       =   &H00800000&
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   87
            Top             =   3240
            Width           =   375
         End
         Begin VB.Label FingerMax 
            Alignment       =   1  'Right Justify
            Caption         =   "1000"
            Height          =   255
            Index           =   4
            Left            =   2160
            TabIndex        =   29
            Top             =   960
            Width           =   375
         End
         Begin VB.Label FingerMax 
            Alignment       =   1  'Right Justify
            Caption         =   "1000"
            Height          =   255
            Index           =   3
            Left            =   1680
            TabIndex        =   28
            Top             =   480
            Width           =   375
         End
         Begin VB.Label FingerMax 
            Alignment       =   1  'Right Justify
            Caption         =   "1000"
            Height          =   255
            Index           =   2
            Left            =   1200
            TabIndex        =   27
            Top             =   240
            Width           =   375
         End
         Begin VB.Label FingerMax 
            Alignment       =   1  'Right Justify
            Caption         =   "1000"
            Height          =   255
            Index           =   1
            Left            =   720
            TabIndex        =   26
            Top             =   600
            Width           =   375
         End
         Begin VB.Label FingerMax 
            Alignment       =   1  'Right Justify
            Caption         =   "1000"
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   25
            Top             =   1320
            Width           =   375
         End
         Begin VB.Label FingerMin 
            Alignment       =   1  'Right Justify
            Caption         =   "500"
            Height          =   255
            Index           =   4
            Left            =   2160
            TabIndex        =   24
            Top             =   2880
            Width           =   375
         End
         Begin VB.Label FingerMin 
            Alignment       =   1  'Right Justify
            Caption         =   "500"
            Height          =   255
            Index           =   3
            Left            =   1680
            TabIndex        =   23
            Top             =   2880
            Width           =   375
         End
         Begin VB.Label FingerMin 
            Alignment       =   1  'Right Justify
            Caption         =   "500"
            Height          =   255
            Index           =   2
            Left            =   1200
            TabIndex        =   22
            Top             =   2880
            Width           =   375
         End
         Begin VB.Label FingerMin 
            Alignment       =   1  'Right Justify
            Caption         =   "500"
            Height          =   255
            Index           =   1
            Left            =   720
            TabIndex        =   21
            Top             =   2880
            Width           =   375
         End
         Begin VB.Label FingerMin 
            Alignment       =   1  'Right Justify
            Caption         =   "500"
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   20
            Top             =   2880
            Width           =   375
         End
      End
      Begin VB.Label OutOfRange 
         Caption         =   "Out of Range"
         Height          =   375
         Left            =   0
         TabIndex        =   30
         Top             =   4560
         Visible         =   0   'False
         Width           =   2175
      End
      Begin VB.Label Label4 
         Caption         =   "4. Hit 'A' button again to save."
         Height          =   735
         Left            =   3120
         TabIndex        =   19
         Top             =   2880
         Width           =   2535
      End
      Begin VB.Label Label3 
         Caption         =   "3. Unbend fingers straightening out your fingers."
         Height          =   735
         Left            =   3120
         TabIndex        =   18
         Top             =   2280
         Width           =   2535
      End
      Begin VB.Label Label2 
         Caption         =   "2. Make a fist, bending all fingers to a comfortable level."
         Height          =   735
         Left            =   3120
         TabIndex        =   17
         Top             =   1680
         Width           =   2535
      End
      Begin VB.Label Label1 
         Caption         =   "1. Hit 'A' button on the P5 Glove to reset the device settings."
         Height          =   735
         Left            =   3120
         TabIndex        =   16
         Top             =   1080
         Width           =   2535
      End
      Begin VB.Label Instructions1 
         Caption         =   "To calibrate all the fingers at once please use the following steps:"
         Height          =   735
         Left            =   3120
         TabIndex        =   15
         Top             =   480
         Width           =   2535
      End
      Begin VB.Label StatusLabel 
         Caption         =   "Status: loading..."
         Height          =   375
         Left            =   0
         TabIndex        =   14
         Top             =   4320
         Width           =   5535
      End
   End
   Begin VB.Frame TabFrame 
      BorderStyle     =   0  'None
      Caption         =   "XYZ Tracking"
      Height          =   5055
      Index           =   4
      Left            =   240
      TabIndex        =   67
      Top             =   480
      Width           =   5895
      Begin MSComctlLib.Slider AverageSlider 
         Height          =   375
         Left            =   3480
         TabIndex        =   78
         Top             =   2280
         Width           =   2295
         _ExtentX        =   4048
         _ExtentY        =   661
         _Version        =   393216
         Max             =   20
         SelStart        =   10
         Value           =   10
      End
      Begin VB.CheckBox AverageBox 
         Caption         =   "Average"
         Height          =   255
         Left            =   2400
         TabIndex        =   77
         Top             =   2400
         Value           =   1  'Checked
         Width           =   1095
      End
      Begin VB.CheckBox DeadbandBox 
         Caption         =   "Deadband"
         Height          =   255
         Left            =   2400
         TabIndex        =   76
         Top             =   3000
         Value           =   1  'Checked
         Width           =   1095
      End
      Begin VB.ComboBox ModeBox 
         Height          =   315
         ItemData        =   "VBControlPanelForm.frx":0004
         Left            =   2400
         List            =   "VBControlPanelForm.frx":0014
         Style           =   2  'Dropdown List
         TabIndex        =   75
         Top             =   1800
         Width           =   2055
      End
      Begin MSComctlLib.Slider SliderY 
         Height          =   4095
         Left            =   360
         TabIndex        =   70
         Top             =   480
         Width           =   630
         _ExtentX        =   1111
         _ExtentY        =   7223
         _Version        =   393216
         Orientation     =   1
         Min             =   -512
         Max             =   512
         TickStyle       =   3
      End
      Begin MSComctlLib.Slider SliderX 
         Height          =   375
         Left            =   1080
         TabIndex        =   68
         Top             =   360
         Width           =   4575
         _ExtentX        =   8070
         _ExtentY        =   661
         _Version        =   393216
         Min             =   -512
         Max             =   512
         TickStyle       =   3
      End
      Begin MSComctlLib.Slider SliderZ 
         Height          =   375
         Left            =   1080
         TabIndex        =   69
         Top             =   4320
         Width           =   4575
         _ExtentX        =   8070
         _ExtentY        =   661
         _Version        =   393216
         Min             =   -512
         Max             =   512
         TickStyle       =   3
      End
      Begin MSComctlLib.Slider DeadbandSlider 
         Height          =   375
         Left            =   3480
         TabIndex        =   79
         Top             =   3000
         Width           =   2295
         _ExtentX        =   4048
         _ExtentY        =   661
         _Version        =   393216
         Max             =   30
         SelStart        =   14
         Value           =   14
      End
      Begin VB.Label LabelZ 
         Caption         =   "Z: ? "
         Height          =   375
         Left            =   2640
         TabIndex        =   73
         Top             =   3840
         Width           =   1215
      End
      Begin VB.Label LabelX 
         Caption         =   "X: ? "
         Height          =   375
         Left            =   2640
         TabIndex        =   72
         Top             =   840
         Width           =   1215
      End
      Begin VB.Label LabelY 
         Caption         =   "Y: ? "
         Height          =   375
         Left            =   1080
         TabIndex        =   71
         Top             =   2400
         Width           =   1215
      End
      Begin VB.Label Label16 
         Caption         =   "Tracking mode (not saved, for testing only)"
         Height          =   375
         Left            =   2400
         TabIndex        =   74
         Top             =   1440
         Width           =   3015
      End
   End
   Begin VB.Frame TabFrame 
      Caption         =   "Rotation"
      Height          =   5055
      Index           =   5
      Left            =   240
      TabIndex        =   80
      Top             =   480
      Width           =   5895
      Begin MSComctlLib.Slider SliderPitch 
         Height          =   615
         Left            =   240
         TabIndex        =   81
         Top             =   1560
         Width           =   5415
         _ExtentX        =   9551
         _ExtentY        =   1085
         _Version        =   393216
         Min             =   -180
         Max             =   180
         TickFrequency   =   30
      End
      Begin MSComctlLib.Slider SliderYaw 
         Height          =   615
         Left            =   240
         TabIndex        =   82
         Top             =   2640
         Width           =   5415
         _ExtentX        =   9551
         _ExtentY        =   1085
         _Version        =   393216
         Min             =   -180
         Max             =   180
         TickFrequency   =   30
      End
      Begin MSComctlLib.Slider SliderRoll 
         Height          =   615
         Left            =   240
         TabIndex        =   83
         Top             =   3720
         Width           =   5415
         _ExtentX        =   9551
         _ExtentY        =   1085
         _Version        =   393216
         Min             =   -180
         Max             =   180
         TickFrequency   =   30
      End
      Begin VB.Shape LED 
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   7
         Left            =   2880
         Shape           =   3  'Circle
         Top             =   4560
         Width           =   255
      End
      Begin VB.Shape LED 
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   6
         Left            =   2520
         Shape           =   3  'Circle
         Top             =   4560
         Width           =   255
      End
      Begin VB.Shape LED 
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   5
         Left            =   2160
         Shape           =   3  'Circle
         Top             =   4560
         Width           =   255
      End
      Begin VB.Shape LED 
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   4
         Left            =   1800
         Shape           =   3  'Circle
         Top             =   4560
         Width           =   255
      End
      Begin VB.Shape LED 
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   3
         Left            =   1440
         Shape           =   3  'Circle
         Top             =   4560
         Width           =   255
      End
      Begin VB.Shape LED 
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   2
         Left            =   1080
         Shape           =   3  'Circle
         Top             =   4560
         Width           =   255
      End
      Begin VB.Shape LED 
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   1
         Left            =   720
         Shape           =   3  'Circle
         Top             =   4560
         Width           =   255
      End
      Begin VB.Shape LED 
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   0
         Left            =   360
         Shape           =   3  'Circle
         Top             =   4560
         Width           =   255
      End
      Begin VB.Label RollLabel 
         Caption         =   "Roll: ?"
         Height          =   255
         Left            =   480
         TabIndex        =   86
         Top             =   3360
         Width           =   1215
      End
      Begin VB.Label YawLabel 
         Caption         =   "Yaw: ?"
         Height          =   255
         Left            =   480
         TabIndex        =   85
         Top             =   2280
         Width           =   1215
      End
      Begin VB.Label PitchLabel 
         Caption         =   "Pitch: ?"
         Height          =   255
         Left            =   480
         TabIndex        =   84
         Top             =   1200
         Width           =   1215
      End
   End
   Begin VB.Frame TabFrame 
      Caption         =   "About"
      Height          =   5055
      Index           =   3
      Left            =   240
      TabIndex        =   7
      Top             =   480
      Width           =   5895
   End
   Begin VB.Frame TabFrame 
      BorderStyle     =   0  'None
      Caption         =   "Buttons"
      Height          =   5055
      Index           =   2
      Left            =   240
      TabIndex        =   6
      Top             =   480
      Width           =   5895
      Begin VB.CheckBox ButtonBox 
         Caption         =   "D                  - P5 Glove Power On / Off"
         Height          =   375
         Index           =   3
         Left            =   1200
         TabIndex        =   59
         Top             =   3840
         Value           =   2  'Grayed
         Width           =   3255
      End
      Begin VB.CheckBox ButtonBox 
         Caption         =   "C"
         Height          =   375
         Index           =   2
         Left            =   1800
         TabIndex        =   58
         Top             =   3240
         Value           =   2  'Grayed
         Width           =   1335
      End
      Begin VB.CheckBox ButtonBox 
         Caption         =   "B"
         Height          =   375
         Index           =   1
         Left            =   1560
         TabIndex        =   57
         Top             =   2520
         Value           =   2  'Grayed
         Width           =   1335
      End
      Begin VB.CheckBox ButtonBox 
         Caption         =   "A"
         Height          =   375
         Index           =   0
         Left            =   960
         TabIndex        =   56
         Top             =   2040
         Value           =   2  'Grayed
         Width           =   1335
      End
      Begin VB.Line Line1 
         X1              =   600
         X2              =   5160
         Y1              =   1560
         Y2              =   1560
      End
      Begin VB.Label Label15 
         Caption         =   "There are four buttons on the top of the P5 Glove Device which you can track using this page."
         Height          =   975
         Left            =   480
         TabIndex        =   55
         Top             =   600
         Width           =   4815
      End
   End
   Begin VB.Frame TabFrame 
      BorderStyle     =   0  'None
      Caption         =   "Mouse"
      Height          =   5055
      Index           =   1
      Left            =   240
      TabIndex        =   5
      Top             =   480
      Width           =   5895
      Begin VB.Frame StickyTimeFrame 
         Caption         =   "Sticky Time"
         Height          =   975
         Left            =   120
         TabIndex        =   32
         Top             =   120
         Width           =   2535
         Begin MSComctlLib.Slider StickyTimeSlider 
            Height          =   495
            Left            =   120
            TabIndex        =   33
            ToolTipText     =   "Mouse Sticky Time"
            Top             =   240
            Width           =   1815
            _ExtentX        =   3201
            _ExtentY        =   873
            _Version        =   393216
            Max             =   20
            TickStyle       =   1
            TickFrequency   =   5
            TextPosition    =   1
         End
         Begin VB.Label StickyTimeLabel 
            Caption         =   "?"
            Height          =   375
            Left            =   2040
            TabIndex        =   34
            Top             =   360
            Width           =   375
         End
      End
      Begin VB.Frame SensitivityFrame 
         Height          =   3615
         Left            =   120
         TabIndex        =   36
         Top             =   1200
         Width           =   5535
         Begin VB.Frame TestArea 
            Caption         =   "Test Area"
            Height          =   975
            Left            =   360
            TabIndex        =   53
            Top             =   2280
            Width           =   975
            Begin VB.Label TestLetter 
               BackStyle       =   0  'Transparent
               Caption         =   "A"
               BeginProperty Font 
                  Name            =   "MS Sans Serif"
                  Size            =   18
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   495
               Left            =   360
               TabIndex        =   54
               Top             =   360
               Width           =   375
            End
         End
         Begin MSComctlLib.Slider LeftClickSlider 
            Height          =   375
            Left            =   2160
            TabIndex        =   48
            Top             =   480
            Width           =   2175
            _ExtentX        =   3836
            _ExtentY        =   661
            _Version        =   393216
            LargeChange     =   10
            Min             =   -99
            Max             =   0
            TickFrequency   =   10
         End
         Begin VB.Frame DesktopMouseFrame 
            Caption         =   "Desktop Mouse"
            Height          =   1095
            Left            =   2760
            TabIndex        =   44
            Top             =   2160
            Width           =   1815
            Begin VB.OptionButton MouseOffButton 
               Caption         =   "Mouse OFF"
               Height          =   255
               Left            =   360
               TabIndex        =   46
               Top             =   600
               Width           =   1335
            End
            Begin VB.OptionButton MouseOnButton 
               Caption         =   "Mouse ON"
               Height          =   255
               Left            =   360
               TabIndex        =   45
               Top             =   240
               Width           =   1335
            End
         End
         Begin VB.ComboBox RightClickBox 
            Height          =   315
            ItemData        =   "VBControlPanelForm.frx":0058
            Left            =   240
            List            =   "VBControlPanelForm.frx":006B
            Style           =   2  'Dropdown List
            TabIndex        =   40
            Top             =   1680
            Width           =   1455
         End
         Begin VB.ComboBox MiddleClickBox 
            Height          =   315
            ItemData        =   "VBControlPanelForm.frx":0092
            Left            =   240
            List            =   "VBControlPanelForm.frx":00A5
            Style           =   2  'Dropdown List
            TabIndex        =   39
            Top             =   1080
            Width           =   1455
         End
         Begin VB.ComboBox LeftClickBox 
            Height          =   315
            ItemData        =   "VBControlPanelForm.frx":00CC
            Left            =   240
            List            =   "VBControlPanelForm.frx":00DF
            Style           =   2  'Dropdown List
            TabIndex        =   38
            Top             =   480
            Width           =   1455
         End
         Begin MSComctlLib.Slider MiddleClickSlider 
            Height          =   375
            Left            =   2160
            TabIndex        =   51
            Top             =   1080
            Width           =   2175
            _ExtentX        =   3836
            _ExtentY        =   661
            _Version        =   393216
            LargeChange     =   10
            Min             =   -99
            Max             =   0
            TickFrequency   =   10
         End
         Begin MSComctlLib.Slider RightClickSlider 
            Height          =   375
            Left            =   2160
            TabIndex        =   52
            Top             =   1680
            Width           =   2175
            _ExtentX        =   3836
            _ExtentY        =   661
            _Version        =   393216
            LargeChange     =   10
            Min             =   -99
            Max             =   0
            TickFrequency   =   10
         End
         Begin VB.Label RightSensitivityLabel 
            Caption         =   "?"
            Height          =   375
            Left            =   5040
            TabIndex        =   66
            Top             =   1680
            Width           =   375
         End
         Begin VB.Label MiddleSensitivityLabel 
            Caption         =   "?"
            Height          =   375
            Left            =   5040
            TabIndex        =   65
            Top             =   1080
            Width           =   375
         End
         Begin VB.Label LeftSensitivityLabel 
            Caption         =   "?"
            Height          =   375
            Left            =   5040
            TabIndex        =   64
            Top             =   480
            Width           =   375
         End
         Begin VB.Label Label14 
            Caption         =   "High 0"
            Height          =   375
            Left            =   4440
            TabIndex        =   63
            Top             =   1680
            Width           =   375
         End
         Begin VB.Label Label12 
            Caption         =   "High 0"
            Height          =   375
            Left            =   4440
            TabIndex        =   62
            Top             =   1080
            Width           =   375
         End
         Begin VB.Label Label13 
            Caption         =   "Low 99"
            Height          =   375
            Left            =   1800
            TabIndex        =   61
            Top             =   1680
            Width           =   495
         End
         Begin VB.Label Label11 
            Caption         =   "Low 99"
            Height          =   375
            Left            =   1800
            TabIndex        =   60
            Top             =   1080
            Width           =   495
         End
         Begin VB.Label Label10 
            Caption         =   "High 0"
            Height          =   375
            Left            =   4440
            TabIndex        =   50
            Top             =   480
            Width           =   375
         End
         Begin VB.Label Label9 
            Caption         =   "Low 99"
            Height          =   375
            Left            =   1800
            TabIndex        =   49
            Top             =   480
            Width           =   495
         End
         Begin VB.Label MouseModeLabel 
            Alignment       =   2  'Center
            Caption         =   "Mouse Mode is ?"
            Height          =   255
            Left            =   2760
            TabIndex        =   47
            Top             =   3300
            Width           =   1815
         End
         Begin VB.Label Label8 
            Caption         =   "Right Click"
            Height          =   255
            Left            =   240
            TabIndex        =   43
            Top             =   1440
            Width           =   1455
         End
         Begin VB.Label Label7 
            Caption         =   "Middle Click"
            Height          =   255
            Left            =   240
            TabIndex        =   42
            Top             =   840
            Width           =   1455
         End
         Begin VB.Label Label6 
            Caption         =   "Left Click"
            Height          =   255
            Left            =   240
            TabIndex        =   41
            Top             =   240
            Width           =   1455
         End
         Begin VB.Label Label5 
            AutoSize        =   -1  'True
            Caption         =   " Click Sensitivity "
            Height          =   195
            Left            =   2040
            TabIndex        =   37
            Top             =   0
            Width           =   1185
         End
      End
      Begin VB.Label StickyTimeInstructions 
         Caption         =   $"VBControlPanelForm.frx":0106
         Height          =   855
         Left            =   2760
         TabIndex        =   35
         Top             =   240
         Width           =   3015
      End
   End
   Begin MSComctlLib.TabStrip TabStrip1 
      Height          =   5655
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6135
      _ExtentX        =   10821
      _ExtentY        =   9975
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   6
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Calibration"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Mouse"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Buttons"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "About"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab5 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "XYZ Tracking"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab6 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Rotation"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "VBControlPanelForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim state As P5State
Dim GloveNumber As Long
Dim ButtonWasDown As Boolean
Dim Calibrating As Boolean

Private Sub ApplyButton_Click()
    ' Apply Settings
    SaveMouse
    ApplyButton.Enabled = False
End Sub

Private Sub AverageBox_Click()
    Dim filters As Integer
    filters = 0
    If AverageBox.Value = 1 Then filters = filters + P5_FILTER_AVERAGE
    If DeadbandBox.Value = 1 Then filters = filters + P5_FILTER_DEADBAND
    P5_SetFilterMode filters
End Sub

Private Sub AverageSlider_Click()
    P5_SetFilterAmount AverageSlider.Value, DeadbandSlider.Value
End Sub

Private Sub CancelButton_Click()
    End
End Sub

Private Sub DeadbandBox_Click()
    Dim filters As Integer
    filters = 0
    If AverageBox.Value = 1 Then filters = filters + P5_FILTER_AVERAGE
    If DeadbandBox.Value = 1 Then filters = filters + P5_FILTER_DEADBAND
    P5_SetFilterMode filters
End Sub

Private Sub DeadbandSlider_Click()
    P5_SetFilterAmount AverageSlider.Value, DeadbandSlider.Value
End Sub

Private Sub Form_Load()
    Randomize Timer
    ButtonWasDown = False
    Calibrating = False
    Dim i As Integer
    If P5_Init Then
        For i = 0 To P5_GetCount - 1
            GloveNumberBox.AddItem "Glove " & i, i
        Next i
        GloveNumberBox.ListIndex = 0
        GloveNumber = 0
        Timer1.Enabled = True
        StatusLabel.Caption = "Status: tracking..."
        LoadCalibration
        LoadMouse
    Else
        StatusLabel.Caption = "Status: P5_Init failed"
    End If
    TabFrame(TabStrip1.SelectedItem.index - 1).ZOrder 0
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Timer1.Enabled = False
    StatusLabel.Caption = "Status: closing..."
    If Calibrating Then
        P5_SaveBendSensors GloveNumber
        Calibrating = False
    End If
    P5_Close
End Sub

Private Sub GloveNumberBox_Click()
    GloveNumber = GloveNumberBox.ListIndex
    LoadCalibration
    LoadMouse
    LoadXYZ
End Sub

Private Sub LeftClickBox_Change()
    ApplyButton.Enabled = True
End Sub

Private Sub LeftClickBox_Click()
    ApplyButton.Enabled = True
End Sub

Private Sub LeftClickSlider_Change()
    ApplyButton.Enabled = True
    LeftSensitivityLabel.Caption = -LeftClickSlider.Value
End Sub

Private Sub LeftClickSlider_Click()
    ApplyButton.Enabled = True
    LeftSensitivityLabel.Caption = -LeftClickSlider.Value
End Sub

Private Sub MiddleClickBox_Change()
    ApplyButton.Enabled = True
End Sub

Private Sub MiddleClickBox_Click()
    ApplyButton.Enabled = True
End Sub

Private Sub MiddleClickSlider_Change()
    ApplyButton.Enabled = True
    MiddleSensitivityLabel.Caption = -MiddleClickSlider.Value
End Sub

Private Sub MiddleClickSlider_Click()
    ApplyButton.Enabled = True
    MiddleSensitivityLabel.Caption = -MiddleClickSlider.Value
End Sub

Private Sub ModeBox_Change()
    If ModeBox.ListIndex = P5MODE_FILTERED Then
        AverageBox.Visible = True
        DeadbandBox.Visible = True
        AverageSlider.Visible = True
        DeadbandSlider.Visible = True
    Else
        AverageBox.Visible = False
        DeadbandBox.Visible = False
        AverageSlider.Visible = False
        DeadbandSlider.Visible = False
    End If
End Sub

Private Sub ModeBox_Click()
    If ModeBox.ListIndex = P5MODE_FILTERED Then
        AverageBox.Visible = True
        DeadbandBox.Visible = True
        AverageSlider.Visible = True
        DeadbandSlider.Visible = True
    Else
        AverageBox.Visible = False
        DeadbandBox.Visible = False
        AverageSlider.Visible = False
        DeadbandSlider.Visible = False
    End If
End Sub

Private Sub MouseOffButton_Click()
    P5_SetMouseState GloveNumber, False
    MouseModeLabel.Caption = "Mouse Mode is OFF"
End Sub

Private Sub MouseOnButton_Click()
    P5_SetMouseState GloveNumber, True
    MouseModeLabel.Caption = "Mouse Mode is ON"
End Sub

Private Sub OkButton_Click()
    ApplyButton_Click
    End
End Sub

Private Sub RightClickBox_Change()
    ApplyButton.Enabled = True
End Sub

Private Sub RightClickBox_Click()
    ApplyButton.Enabled = True
End Sub

Private Sub RightClickSlider_Change()
    ApplyButton.Enabled = True
    RightSensitivityLabel.Caption = -RightClickSlider.Value
End Sub

Private Sub RightClickSlider_Click()
    ApplyButton.Enabled = True
    RightSensitivityLabel.Caption = -RightClickSlider.Value
End Sub

Private Sub StickyTimeSlider_Change()
    StickyTimeLabel.Caption = StickyTimeSlider.Value
    ApplyButton.Enabled = True
End Sub

Private Sub StickyTimeSlider_Click()
    StickyTimeLabel.Caption = StickyTimeSlider.Value
    ApplyButton.Enabled = True
End Sub

Private Sub TabStrip1_Click()
    Select Case TabStrip1.SelectedItem.index
        Case 1: LoadCalibration
        Case 2: If ApplyButton.Enabled = False Then LoadMouse
        Case 5: LoadXYZ
    End Select
    TabFrame(TabStrip1.SelectedItem.index - 1).ZOrder 0
    
End Sub

Private Sub LoadCalibration()
    Dim FingerStraight(5) As Long
    Dim FingerBent(5) As Long
    Dim i As Long
    P5_GetBendCalibration GloveNumber, FingerStraight(0), FingerBent(0), FingerStraight(1), FingerBent(1), FingerStraight(2), FingerBent(2), FingerStraight(3), FingerBent(3), FingerStraight(4), FingerBent(4)
    For i = 0 To 4
        FingerMin(i).Caption = FingerBent(i)
        FingerMax(i).Caption = FingerStraight(i)
    Next i
End Sub

Private Sub LoadMouse()
    Dim leftclick As Long
    Dim middleclick As Long
    Dim rightclick As Long
    Dim leftclicks As Long
    Dim middleclicks As Long
    Dim rightclicks As Long
    Dim state As Boolean
    leftclick = -1
    middleclick = -1
    rightclick = -1
    StickyTimeSlider.Value = P5_GetMouseStickTime(GloveNumber)
    P5_GetMouseButtonAllocation GloveNumber, leftclick, rightclick, middleclick
    LeftClickBox.ListIndex = leftclick
    MiddleClickBox.ListIndex = middleclick
    RightClickBox.ListIndex = rightclick
    leftclicks = 0
    middleclicks = 0
    rightclicks = 0
    P5_GetClickSensitivity GloveNumber, leftclicks, rightclicks, middleclicks
    LeftClickSlider.Value = -leftclicks
    MiddleClickSlider.Value = -middleclicks
    RightClickSlider.Value = -rightclicks
    state = P5_GetMouseState(GloveNumber)
    If state Then
        MouseOnButton.Value = True
        MouseOffButton.Value = False
        MouseModeLabel = "Mouse mode is ON"
    Else
        MouseOffButton.Value = True
        MouseOnButton.Value = False
        MouseModeLabel = "Mouse mode is OFF"
    End If
    ApplyButton.Enabled = False
End Sub


Private Sub SaveMouse()
    P5_SetMouseStickTime GloveNumber, StickyTimeSlider.Value
    P5_SetMouseButtonAllocation GloveNumber, LeftClickBox.ListIndex, RightClickBox.ListIndex, MiddleClickBox.ListIndex
    P5_SetClickSensitivity GloveNumber, -LeftClickSlider.Value, -RightClickSlider.Value, -MiddleClickSlider.Value
    ApplyButton.Enabled = True
End Sub


Private Sub LoadXYZ()
    ModeBox.ListIndex = 3
    P5_SetFilterMode P5_FILTER_AVERAGE + P5_FILTER_DEADBAND
End Sub

Private Sub UpdateCalibration()
    Dim i As Integer
    P5_GetState GloveNumber, 0, state
    For i = 0 To 4
        FingerBar(i).Value = 63 - state.finger(i)
        FingerBend(i).Caption = state.finger(i)
        FingerAbsolute(i).Caption = state.FingerAbsolute(i)
    Next i
    If state.Visible Then
        OutOfRange.Visible = False
    Else
        OutOfRange.Visible = True
    End If
    If state.button(0) Then
        If Not ButtonWasDown Then
            If Calibrating Then
                P5_SaveBendSensors GloveNumber
                Calibrating = False
                StatusLabel.Caption = "Status: Fingers have been Saved"
                LoadCalibration
            Else
                P5_CalibrateBendSensors GloveNumber
                Calibrating = True
                StatusLabel.Caption = "Status: Make a fist and hit 'A' button on P5 Device"
            End If
            ' start or stop calibrating
        End If
        ButtonWasDown = True
    Else
        ButtonWasDown = False
    End If
    
End Sub

Private Sub UpdateButtons()
    Dim i As Integer
    P5_GetState GloveNumber, 0, state
    For i = 0 To 3
        ButtonBox(i).Value = state.button(i)
    Next i
End Sub

Private Sub UpdateXYZ()
    Dim i As Integer
    P5_GetState GloveNumber, 0, state
    Dim x As Double
    Dim y As Double
    Dim z As Double
    
    Select Case ModeBox.ListIndex
        Case P5MODE_RELATIVE:
            x = state.RelativeX
            y = state.RelativeY
            z = state.RelativeZ
        Case P5MODE_RELATIVEAVG:
            x = state.RelativeAvgX
            y = state.RelativeAvgY
            z = state.RelativeAvgZ
        Case P5MODE_ABSOLUTE:
            x = state.x
            y = state.y
            z = state.z
        Case P5MODE_FILTERED:
            x = state.FilterPos(0)
            y = state.FilterPos(1)
            z = state.FilterPos(2)
    End Select
    
    SliderX.Value = x
    SliderY.Value = -y
    SliderZ.Value = z + 512
    
    LabelX.Caption = "X: " & Round(x / 51.2, 2) & " inches"
    LabelY.Caption = "Y: " & Round(y / 51.2, 2) & " inches"
    LabelZ.Caption = "Z: " & Round(z / 51.2, 2) & " inches"
    
End Sub

Private Sub UpdateRotation()
    Dim i As Integer
    Dim e As Single
    P5_GetState GloveNumber, 0, state
    Dim y As Double
    Dim p As Double
    Dim roll As Double
    
    y = state.FilterYaw
    p = state.FilterPitch
    roll = state.FilterRoll
    

On Error GoTo skipslider
    SliderYaw.Value = y
    SliderPitch.Value = p
    SliderRoll.Value = roll
skipslider:
    YawLabel.Caption = "Yaw: " & Round(y, 0) & "°"
    PitchLabel.Caption = "Pitch: " & Round(p, 0) & "°"
    RollLabel.Caption = "Roll: " & Round(roll, 0) & "°"
    'LedVisibleLabel.Caption = state.VisibleLedCount & " LEDs Visible."
    For i = 0 To 7
        Dim r As Integer
        Dim g As Integer
        Dim b As Integer
        If state.LedVisible(i) Then
            e = state.LedGeometricAccuracy(i)
            r = &HD0
            g = &HC0
            b = 0
            If e <= 10 Then
                g = &HC0
            ElseIf e <= 40 Then
                g = &H80
            Else
                g = &H40
            End If
            If state.VisibleLedNumber(0) = i Then
                r = CInt(r * 1.2)
                g = CInt(g * 1.2)
                b = CInt(b * 1.2)
            ElseIf state.VisibleLedNumber(1) = i Then
            ElseIf state.VisibleLedNumber(2) = i Then
                r = CInt(r * 0.8)
                g = CInt(g * 0.8)
                b = CInt(b * 0.8)
            ElseIf state.VisibleLedNumber(3) = i Then
                r = CInt(r * 0.6)
                g = CInt(g * 0.6)
                b = CInt(b * 0.6)
            End If
            LED(i).FillColor = RGB(r, g, b)
        Else
            LED(i).FillColor = RGB(0, 0, 0)
        End If
    Next i
    
End Sub


Private Function Random(ByVal range As Long)
    Random = Int(Rnd * range)
End Function

Private Function RandomLetter()
    RandomLetter = Chr(Asc("A") + Random(26))
End Function


Private Sub TestArea_Click()
    TestLetter.Caption = RandomLetter
End Sub

Private Sub TestArea_DblClick()
    TestArea.BackColor = Random(256) * 65535 + Random(256) * 256 + Random(256)
End Sub

Private Sub TestLetter_Click()
    TestArea_Click
End Sub

Private Sub TestLetter_DblClick()
    TestArea_DblClick
End Sub

Private Sub Timer1_Timer()
    Select Case TabStrip1.SelectedItem.index
        Case 1: UpdateCalibration
        Case 3: UpdateButtons
        Case 5: UpdateXYZ
        Case 6: UpdateRotation
    End Select
End Sub
