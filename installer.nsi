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
SectionGroup /e "Syntax Highlighting" sublimeSyntax

	Section "NSIS Scripts" sublimeNsisSyntax
		${If} ${FileExists} "$INSTDIR\NSIS\*.*"
			MessageBox MB_YESNO|MB_DEFBUTTON2 "Overwrite existing files in $INSTDIR\NSIS?" IDNO End
		${EndIf}

		SetOutPath "$INSTDIR\NSIS"
		
		File /r "$INSTDIR\NSIS\*.*"

		End:
	SectionEnd

	Section "NSIS Language Files" sublimeNlfSyntax
		${If} ${FileExists} "$INSTDIR\NSIS-Language-File-Sublime-Text\*.*"
			MessageBox MB_YESNO|MB_DEFBUTTON2 "Overwrite existing files in $INSTDIR\NSIS-Language-File-Sublime-Text?" IDNO End
		${EndIf}

		SetOutPath "$INSTDIR\NSIS-Language-File-Sublime-Text"
		
		File /r "$INSTDIR\NSIS-Language-File-Sublime-Text\*.*"

		End:
	SectionEnd

SectionGroupEnd

SectionGroup /e "Auto Completion" sublimeAutoCompletion

	Section "NSIS Commands" sublimeCmdCompletion
		${If} ${FileExists} "$INSTDIR\NSIS-Sublime-Text\*.*"
			MessageBox MB_YESNO|MB_DEFBUTTON2 "Overwrite existing files in $INSTDIR\NSIS-Sublime-Text?" IDNO End
		${EndIf}

		SetOutPath "$INSTDIR\NSIS-Sublime-Text"
		
		File /r "$INSTDIR\NSIS-Sublime-Text\*.*"

		End:
	SectionEnd

	Section "Drunken NSIS" sublimeDrunkenNsis
		${If} ${FileExists} "$INSTDIR\Drunken-NSIS\*.*"
			MessageBox MB_YESNO|MB_DEFBUTTON2 "Overwrite existing files in $INSTDIR\Drunken-NSIS?" IDNO End
		${EndIf}

		SetOutPath "$INSTDIR\Drunken-NSIS"
		
		File /r "$INSTDIR\Drunken-NSIS\*.*"

		End:
	SectionEnd

	Section "Plug-in Commands" sublimePlugCompletion
		${If} ${FileExists} "$INSTDIR\NSIS-Sublime-Text-Addons\*.*"
			MessageBox MB_YESNO|MB_DEFBUTTON2 "Overwrite existing files in $INSTDIR\NSIS-Sublime-Text-Addons?" IDNO End
		${EndIf}

		SetOutPath "$INSTDIR\NSIS-Sublime-Text-Addons"
		
		File /r "$INSTDIR\NSIS-Sublime-Text-Addons\*.*"

		End:
	SectionEnd

SectionGroupEnd


Section "Menu" sublimeMenu
	${If} ${FileExists} "$INSTDIR\NSIS-Sublime-Text-Menu\*.*"
			MessageBox MB_YESNO|MB_DEFBUTTON2 "Overwrite existing files in $INSTDIR\NSIS-Sublime-Text-Menu?" IDNO End
		${EndIf}

	SetOutPath "$INSTDIR\NSIS-Sublime-Text-Menu"
	
	File /r "$INSTDIR\NSIS-Sublime-Text-Menu\*.*"

	End:
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
	${AndIfNot} ${FileExists} "$APPDATA\Sublime Text 3\Packages\*.*"
		StrCpy $INSTDIR "$APPDATA\Sublime Text 2\Packages"
	${ElseIfNot} ${FileExists} "$APPDATA\Sublime Text 2\Packages\*.*"
	${AndIf} ${FileExists} "$APPDATA\Sublime Text 3\Packages\*.*"
		StrCpy $INSTDIR "$APPDATA\Sublime Text 3\Packages"
	${ElseIf} ${FileExists} "$APPDATA\Sublime Text 2\Packages\*.*"
	${AndIf} ${FileExists} "$APPDATA\Sublime Text 3\Packages\*.*"
		StrCpy $INSTDIR "$APPDATA\Sublime Text 2\Packages"
		MessageBox MB_YESNO|MB_ICONQUESTION "Do you prefer Sublime Text 3 over version 2?" IDNO +2
		StrCpy $INSTDIR "$APPDATA\Sublime Text 3\Packages"
	${ElseIfNot} ${FileExists} "$APPDATA\Sublime Text 2\Packages\*.*"
	${AndIfNot} ${FileExists} "$APPDATA\Sublime Text 3\Packages\*.*"
		MessageBox MB_OK|MB_ICONEXCLAMATION "Sublime Text not found, please specify the packages directory."
	${EndIf}
FunctionEnd