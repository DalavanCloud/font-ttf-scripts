; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

; Assumes iscc commandline parameters, e.g.:
;  iscc.exe  /dMyVer=0.16.2 FontUtils.iss
; where 
;  MyVer is the version for this release in the form n.n.n, and 
;  ParlPath is the name of the folder containing parl.exe

;#define Debug

#define MyFileName StringChange("TTFontUtils_" + MyVer, ".", "_")
#define MyVer StringChange(MyVer, "_", ".")

[Setup]
AppName=SIL TTF Font Utilities
AppVersion={#MyVer}
AppVerName=SIL TTF Font Utilities {#MyVer}
AppPublisher=SIL International
AppPublisherURL=http://www.sil.org/
AppSupportURL=http://scripts.sil.org/FontUtils
; AppUpdatesURL=http://www.sil.org/
VersionInfoVersion={#MyVer}
VersionInfoCopyright="Copyright (c) 1997-2016, SIL International (http://www.sil.org); released under the Artistic License 2.0"
DefaultDirName={pf}\SIL\FontUtils
DefaultGroupName=Font Utilities
; uncomment the following line if you want your installation to run on NT 3.51 too.
; MinVersion=4,3.51
PrivilegesRequired=admin
OutputBaseFilename={#MyFileName}
OutputDir=.
; DisableProgramGroupPage=yes
DisableStartupPrompt=yes

[Tasks]
Name: updatepath; Description: "Add installation directory to &PATH";

[Files]
Source: "fontutils.exe"; DestDir: "{app}"; Flags: ignoreversion

[Run]
Filename: "{app}\fontutils.exe"; Parameters: "addpath ""{app}"""; Flags: runminimized; Tasks: updatepath
Filename: "{app}\fontutils.exe"; Parameters: "addbats.pl ""{app}"""; Flags: runminimized

[UninstallRun]
Filename: "{app}\fontutils.exe"; Parameters: "addpath -r ""{app}"""; Flags: runminimized; Tasks: updatepath
Filename: "{app}\fontutils.exe"; Parameters: "addbats.pl -r ""{app}"""; Flags: runminimized

#ifdef Debug
  #expr SaveToFile(AddBackslash(SourcePath) + "Preprocessed.iss")
#endif