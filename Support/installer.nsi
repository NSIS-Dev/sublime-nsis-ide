; Scaffolding by https://github.com/idleberg/NSIS-Sublime-Text

; Includes ---------------------------------
!include MUI2.nsh
!include LogicLib.nsh

; Settings ---------------------------------
Name "NSIS-Dev for Sublime Text"
OutFile "sublime-nsis.exe"
RequestExecutionLevel user
InstallDir "$APPDATA\Sublime Text 3\Packages"

; Pages ------------------------------------
!insertmacro MUI_PAGE_COMPONENTS 
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES

; Languages --------------------------------
!insertmacro MUI_LANGUAGE "English"

; Sections ---------------------------------
SectionGroup /e "Grammar" sublimeSyntax

	Section "NSIS" sublimeNsisSyntax
		SetOutPath "$INSTDIR\NSIS Developer\Syntaxes"
		File "..\Syntaxes\NSIS.tmLanguage" 
	SectionEnd

	Section "NSIS Language Files" sublimeNlfSyntax
		SetOutPath "$INSTDIR\NSIS Developer\Syntaxes"
		File "..\Syntaxes\NLF.tmLanguage" 
	SectionEnd

SectionGroupEnd

SectionGroup /e "Completions" sublimeAutoCompletion

	Section "NSIS Commands" sublimeCmdCompletion
		SetOutPath "$INSTDIR\NSIS Developer\Commands"
		File "..\Commands\NSIS.sublime-completions" 
		File "..\Commands\InstallOptions.sublime-completions"

		SetOutPath "$INSTDIR\NSIS Developer"
		File "..\NSIS.sublime-settings" 
	SectionEnd

	Section "Drunken NSIS" sublimeDrunkenNsis
		SetOutPath "$INSTDIR\NSIS Developer\Commands"
		File "..\Commands\DrunkenNSIS.sublime-completions" 
	SectionEnd

SectionGroupEnd

Section "Build" sublimeBuild
	SetOutPath "$INSTDIR\NSIS Developer\Commands"
	File "..\Commands\NSIS.sublime-build"

	SetOutPath "$INSTDIR\NSIS Developer\Support"
	File "..\Support\makensis.cmd"
	File "..\Support\makensis.sh"
SectionEnd

SectionGroup /e "Snippets" sublimeSnippets

	Section "NSIS" sublimeNsisSnippets
		SetOutPath "$INSTDIR\NSIS Developer\Snippets"
		File /x "..\Snippets\scaffold.Translate*.sublime-snippet" "..\Snippets\*.sublime-snippet"
	SectionEnd

	Section "NSIS Language Files" sublimeNlfSnippets
		SetOutPath "$INSTDIR\NSIS Developer\Snippets"
		File "..\Snippets\scaffold.Translate MUI (French).sublime-snippet" 
		File "..\Snippets\scaffold.Translate MUI (Spanish).sublime-snippet" 
		File "..\Snippets\scaffold.Translate MUI.sublime-snippet" 
	SectionEnd

SectionGroupEnd

; Descriptions -----------------------------
LangString DESC_sublimeSyntax ${LANG_ENGLISH} "Add syntax highlighting Sublime Text (or Textmate)"
LangString DESC_sublimeNsisSyntax ${LANG_ENGLISH} "Add syntax highlighting for NSIS scripts"
LangString DESC_sublimeNlfSyntax ${LANG_ENGLISH} "Add syntax highlighting for NSIS language files"
LangString DESC_sublimeAutoCompletion ${LANG_ENGLISH} "Add code completion for NSIS to Sublime Text"
LangString DESC_sublimeCmdCompletion ${LANG_ENGLISH} "Code completion for all NSIS commands, Useful Headers, and bundled plug-ins"
LangString DESC_sublimeDrunkenNsis ${LANG_ENGLISH} "Drunken NSIS completions, command aliases to eliminate naming inconsistencies"
; LangString DESC_sublimePlugCompletion ${LANG_ENGLISH} "Code completion for third party plug-ins and macros"
LangString DESC_sublimeBuild ${LANG_ENGLISH} "Add build system to compile NSIS scripts"
LangString DESC_sublimeSnippets ${LANG_ENGLISH} "Add useful snippets for common tasks"
LangString DESC_sublimeNsisSnippets ${LANG_ENGLISH} "Useful snippets for code blocks and scaffolding of entire scripts"
LangString DESC_sublimeNlfSnippets ${LANG_ENGLISH} "Useful snippets to scaffold NLF files"

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeSyntax} $(DESC_sublimeSyntax)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeNsisSyntax} $(DESC_sublimeNsisSyntax)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeNlfSyntax} $(DESC_sublimeNlfSyntax)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeAutoCompletion} $(DESC_sublimeAutoCompletion)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeCmdCompletion} $(DESC_sublimeCmdCompletion)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeDrunkenNsis} $(DESC_sublimeDrunkenNsis)
	; !insertmacro MUI_DESCRIPTION_TEXT ${sublimePlugCompletion} $(DESC_sublimePlugCompletion)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeBuild} $(DESC_sublimeBuild)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeSnippets} $(DESC_sublimeSnippets)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeNsisSnippets} $(DESC_sublimeNsisSnippets)
	!insertmacro MUI_DESCRIPTION_TEXT ${sublimeNlfSnippets} $(DESC_sublimeNlfSnippets)
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

	${If} ${FileExists} "$INSTDIR\NSIS Developer\*.*"
		MessageBox MB_YESNO|MB_DEFBUTTON2 'Overwrite existing files in "$INSTDIR\NSIS Developer"?' IDYES +2
		Quit
	${EndIf}
FunctionEnd
