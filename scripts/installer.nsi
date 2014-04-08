; Scaffolding by https://github.com/idleberg/NSIS-Sublime-Text

; Includes ---------------------------------
!include MUI2.nsh
!include LogicLib.nsh

; Settings ---------------------------------
Name "Sublime Text Packages for NSIS"
OutFile "sublimetext-packages.exe"
RequestExecutionLevel user
InstallDir "$APPDATA\Sublime Text 2\Packages"

Var copyBat

; Pages ------------------------------------
!insertmacro MUI_PAGE_COMPONENTS 
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES

; Languages --------------------------------
!insertmacro MUI_LANGUAGE "English"

; Sections ---------------------------------
SectionGroup /e "Auto Completion" sublimeSyntax

	Section "NSIS Scripts" sublimeNsisSyntax
		SetOutPath "$INSTDIR\NSIS"
		
		File "..\NSIS.tmLanguage"
		File "..\Miscellaneous.tmPreferences"
	SectionEnd

	Section "NSIS Language Files" sublimeNlfSyntax
		SetOutPath "$INSTDIR\NSIS"
		
		File "..\NLF.tmLanguage"
	SectionEnd

SectionGroupEnd

SectionGroup /e "Auto Completion" sublimeAutoCompletion

	Section "NSIS Commands" sublimeCmdCompletion
		SetOutPath "$INSTDIR\NSIS"
		
		File "..\NSIS.sublime-completions"
		File "..\NSIS.sublime-settings"
	SectionEnd

	Section "Drunken NSIS" sublimeDrunkenNsis
		SetOutPath "$INSTDIR\NSIS"
		
		File "..\Drunken NSIS.sublime-completions"
	SectionEnd

	Section "Plug-in Commands" sublimePlugCompletion
		SetOutPath "$INSTDIR\NSIS"
		
		File "..\NSIS Addons.sublime-completions"
		File "..\NSIS.sublime-settings"
	SectionEnd

	Section "InstallOptions" sublimeIOCompletion
		SetOutPath "$INSTDIR\NSIS"
		
		File "..\InstallOptions.sublime-completions"
	SectionEnd

	Section "Snippets" sublimeSnippets
		SetOutPath "$INSTDIR\NSIS\snippets"
		
		File "..\snippets\*.sublime-snippet"
	SectionEnd

SectionGroupEnd

Section "Build System" sublimeBuild
	SetOutPath "$INSTDIR\NSIS"
	
	ReadRegStr $0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\NSIS" "InstallLocation"
	${If} $0 != ""
	${AndIf} ${FileExists} "$0\makensis.exe"
		File "..\NSIS.sublime-build"
		StrCpy $copyBat 1
	${EndIf}

	ReadRegStr $0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\NSIS Unicode" "InstallLocation"
	${If} $0 != ""
	${AndIf} ${FileExists} "$0\makensis.exe"
		File "..\NSIS (Unicode).sublime-build"
		StrCpy $copyBat 1
	${EndIf}

	ReadRegStr $0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\NSIS ANSI" "InstallLocation"
	${If} $0 != ""
	${AndIf} ${FileExists} "$0\makensis.exe"
		File "..\NSIS (ANSI).sublime-build"
		StrCpy $copyBat 1
	${EndIf}

	StrCmp $copyBat 1 0 +2
	File "..\nsis_build.bat"
SectionEnd

Section "Menu" sublimeMenu
	SetOutPath "$INSTDIR\NSIS"
	
	File "..\NSIS.py"
	File "..\Context.sublime-menu"
SectionEnd

; Descriptions -----------------------------
LangString DESC_sublimeSyntax ${LANG_English} "Add syntax highlighting Sublime Text (or Textmate)"
LangString DESC_sublimeNsisSyntax ${LANG_English} "Add syntax highlighting for NSIS scripts"
LangString DESC_sublimeNlfSyntax ${LANG_English} "Add syntax highlighting for NSIS language files"
LangString DESC_sublimeAutoCompletion ${LANG_English} "Add code completion for NSIS to Sublime Text"
LangString DESC_sublimeCmdCompletion ${LANG_English} "Code completion for all NSIS commands, Useful Headers, and bundled plug-ins"
LangString DESC_sublimeDrunkenNsis ${LANG_ENGLISH} "Drunken NSIS completions, command aliases to eliminate naming inconsistencies"
LangString DESC_sublimePlugCompletion ${LANG_English} "Code completion for third party plug-ins and macros"
LangString DESC_sublimeIOCompletion ${LANG_English} "Code completion for InstallOptions ini-files"
LangString DESC_sublimeSnippets ${LANG_English} "Useful snippets providing scaffolding and code blocks"
LangString DESC_sublimeBuild ${LANG_English} "Add Makensis to Sublime Text's build system (supports official NSIS, NSIS Unicode and NSIS ANSI)"
LangString DESC_sublimeMenu ${LANG_English} "Add context menu entry to look-up NSIS commands in the online scripting reference"

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeSyntax} $(DESC_sublimeSyntax)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeNsisSyntax} $(DESC_sublimeNsisSyntax)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeNlfSyntax} $(DESC_sublimeNlfSyntax)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeAutoCompletion} $(DESC_sublimeAutoCompletion)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeCmdCompletion} $(DESC_sublimeCmdCompletion)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeDrunkenNsis} $(DESC_sublimeDrunkenNsis)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimePlugCompletion} $(DESC_sublimePlugCompletion)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeIOCompletion} $(DESC_sublimeIOCompletion)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeSnippets} $(DESC_sublimeSnippets)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeBuild} $(DESC_sublimeBuild)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeMenu} $(DESC_sublimeMenu)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

; Functions --------------------------------
Function .onInit
	
	${If} ${FileExists} "$APPDATA\Sublime Text 2\Packages\*.*"
	${AndIfNot} ${FileExists} "$APPDATA\Sublime Text 3\Packages\User\*.*"
		StrCpy $INSTDIR "$APPDATA\Sublime Text 2\Packages"
	${ElseIfNot} ${FileExists} "$APPDATA\Sublime Text 2\Packages\*.*"
	${AndIf} ${FileExists} "$APPDATA\Sublime Text 3\Packages\User\*.*"
		StrCpy $INSTDIR "$APPDATA\Sublime Text 3\Packages\User"
	${ElseIf} ${FileExists} "$APPDATA\Sublime Text 2\Packages\*.*"
	${AndIf} ${FileExists} "$APPDATA\Sublime Text 3\Packages\User\*.*"
		StrCpy $INSTDIR "$APPDATA\Sublime Text 2\Packages"
		MessageBox MB_YESNO|MB_ICONQUESTION "Do you prefer Sublime Text 3 over version 2?" IDNO +2
		StrCpy $INSTDIR "$APPDATA\Sublime Text 3\Packages\User"
	${ElseIfNot} ${FileExists} "$APPDATA\Sublime Text 2\Packages\*.*"
	${AndIfNot} ${FileExists} "$APPDATA\Sublime Text 3\Packages\User\*.*"
		MessageBox MB_OK|MB_ICONEXCLAMATION "Sublime Text not found, please specify the packages directory."
	${EndIf}
FunctionEnd