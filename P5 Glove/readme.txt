========================
P5 Virtual Reality Glove
Dual Mode Driver (BETA 3)
Version 5.0.12.8
========================
8 December 2004

This is an Unofficial Driver Replacement for the official Essential Reality P5 drivers.
It is also a replacement for the old absolute mode driver.
It is also a new SDK for writing your own P5-enabled software.

This driver includes code that is copyright (c) 2004, Essential Reality LLC.
It is not officially endorsed by Essential Reality.

This is a BETA version. This means it contains bugs, it's not guaranteed to be reliable.
The interface may change before the official release version, meaning if you write programs using this driver they may not be compatible with the release version.

=========
Important
=========
This is not a driver in the sense of "Windows has detected your new hardware" and is trying to find an INF file. The P5 doesn't need that sort of driver because the P5 just uses the standard USB mouse drivers that SHOULD come with windows and should already be installed or on your windows CD.

This is also not going to have any effect on the P5's mouse mode, because that is built into the hardware.

What it is, is a replacement for the original P5DLL.DLL file that almost all P5 Enabled applications require. It improves the behaviour of the glove with existing programs and is required for many new P5 Enabled applications.

========
Features
========
* Compatible with existing relative or absolute mode P5 software
* New APIs which can be called from Delphi, Visual Basic 6, Java, C, or Visual C++ 6.
* Relative or Absolute mode
* More accurate position and rotations
* Filters: Averaging and Dead-band
* Access to raw LED positions and other low-level data
* Receptor tower can be moved and rotated
* Prediction for when the glove is out of range
* Initial glove orientation can be set
* Velocities and Accelerations
* LED errors can be measured
* Absolute finger bend values
* Gloves can be worn on the left hand
* Sensitivity setting
* Choice of units
* Glove hot-spot can be set
* Location of LEDs on the glove can be moved
* INI files can be used to configure the driver for different applications
* Left or Right handed coordinate space
* Euler angles in different orders
* Can tell when the glove is in range or not
* Can retrieve previous frame data
* Data is time stamped
* Anything the original driver could do


=================
Existing Programs
=================

This driver is compatible with the almost all existing P5 Applications. 
The only exception is 10LEDTEST and similar programs which have their own debug version DLLs.

There are four categories of existing P5 Glove programs:

1) Relative Mode applications using the original driver released by Essential Reality.
2) Absolute Mode applications using Carl Kenner's absolute mode driver.
3) 10LEDTEST and other debug programs using the debug version of Essential Reality's Driver.
4) Programs which don't use any driver, and communicate directly with the glove or use a driver they wrote themselves.

Almost all programs fit into the first category. This includes games like Hitman 2, Beachhead 2002, Tiger Hunt, Black & White, and Serious Sam 2. It also includes sample programs made by the community, such as P5 Sword. It even includes the original P5 control panel applet.

At time of writing, there is only one program that I know of which uses the original absolute mode driver: that is the P5 Direct Input Emulation program. This allows the P5 to emulate a joystick.


To use this new driver with existing programs you can put it in either the application directory for that program, or your windows system directory. In both cases you need to delete or rename any p5dll.dll file in the application directory first.

You should also copy the P5DLL.ini file into the application folder, and edit it to the settings you want.  The P5DLL.ini file will not work in the windows system directory, it must always be in the application folder.  If the P5DLL.ini file cannot be found in the application directory, it will use inbuilt default settings that are similar to the original drivers.

If you want to use this driver with the old joystick emulation program, you need to set 
[mode] position = 1 for absolute mode, or set [mode] position = 3 for filtered absolute mode.


============
New Programs
============

You can develop your own programs which use the new features of this driver.
An example is the VBControlPanel program. Its Visual Basic source code is in the samples directory.

Just use the include files in the include directory.

There is also a sample for Dev-C++ in the samples directory. 
You can download Dev-C++ here:   http://www.bloodshed.net/devcpp.html

The samples that come with the original SDK can be modified to use the new driver if you want a quicker start.

=============
Documentation
=============

There is little documentation for this driver yet, since I have been very busy.
Sorry.

You can look at the comments in the P5DLL.ini file to see how to configure the driver.
You can also look at the p5dll.h file (or the appropriate one for your language).

You can also see the original SDK.

Make sure you visit the Discussion Group in the websites section below.

==========
Known Bugs
==========

New applications written in Delphi 5 reportedly crash on exit if they have called P5_Close().
This does not happen in my Delphi 7.
Delphi 7 applications run from the IDE encounter a breakpoint on closing. Just click continue to ignore this breakpoint.

Sometimes the Yaw value returns Not-A-Number. You need to check for this in your programs. This may have been fixed in this version, I don't know.

Many things are partially untested.

==========
What's new
==========

BETA 3 fixes a bunch of bugs, but mostly just improves the tracker's position and orientation accuracy.

BETA 2 fixes a bug found by Roid, where prediction wasn't working with Filters.
It also changes the default filter mode to both filters active. 
You still need to use FilterPos in new applications 
or set [mode] position = 3 in the INI file for old applications.

There is also a sample for how to use the driver in the FREE program Dev C++, 
for those who don't want to buy Microsoft Visual C++ 6.
Download Dev-C++ here:  http://www.bloodshed.net/devcpp.html
Then open TestDevP5.dev in the samples folder.

========
Websites
========

P5 Community:
http://www.zzz.com.ru/index.php?area=pages&action=view_page&page_id=11

Discussion Groop:
http://groups.yahoo.com/group/p5glove/

Essential Reality:
http://www.essentialreality.com

Free Dev C++ Compiler/Editor:
http://www.bloodshed.net/devcpp.html

=======
Credits
=======

Written and Designed by Carl Kenner.
C# include file by goubs_fr.
Based on original Essential Reality driver source code by Av Utukuri, and Igor Borysov of Nytric.
Some documentation and suggestions by Roid.
Tested by Roid.
Special thanks to everyone in the P5 Community who demanded an absolute mode.
