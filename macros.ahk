#Persistent
#SingleInstance force

%VariablesFile% := "./variables.ini"
IniRead, EMAIL, %VariablesFile%, Home, EMAIL
IniRead, POSTCODE, %VariablesFile%, Home, POSTCODE
IniRead, ADDRESS, %VariablesFile%, Home, ADDRESS
IniRead, MOBILE_NUMBER, %VariablesFile%, Home, MOBILE_NUMBER

:*:@em::
SendInput, %EMAIL%
Return

:*:@pc::
SendInput, %POSTCODE%
Return

:*:@addr::
SendInput, %ADDRESS%
Return

:*:@mo::
SendInput, %MOBILE_NUMBER%
Return

IniRead, WORK_EMAIL, %VariablesFile%, Work, EMAIL
IniRead, WORK_POSTCODE, %VariablesFile%, Work, POSTCODE
IniRead, WORK_ADDRESS, %VariablesFile%, Work, ADDRESS

:*:@wem::
SendInput, %WORK_EMAIL%
Return

:*:@wpc::
SendInput, %WORK_POSTCODE%
Return

:*:@waddr::
SendInput, %WORK_ADDRESS%
Return

F6::
  FormatTime, CurrentDateTime,, ddd, yyyy-MM-dd HH:mm:ss   
  SendInput %CurrentDateTime%
  return

>+j::Send 7

SetTitleMatchMode 2

; Run a program or switch to it if already running.
;-------------------------------------------------------------------------------
; @param Target - Program to run. E.g. Calc.exe or C:\Progs\Bobo.exe
; @param WinTitle - Optional title of the window to activate.  Programs like
;    MS Outlook might have multiple windows open (main window and email
;    windows).  This parm allows activating a specific window.
;-------------------------------------------------------------------------------
RunOrActivate(Target, WinTitle = "", Parameters = "")
{
   ; Get the filename without a path
   SplitPath, Target, TargetNameOnly

   Process, Exist, %TargetNameOnly%
   If ErrorLevel > 0
      PID = %ErrorLevel%
   Else
      Run, %Target% "%Parameters%", , , PID

   ; At least one app (Seapine TestTrack wouldn't always become the active
   ; window after using Run), so we always force a window activate.
   ; Activate by title if given, otherwise use PID.
   If WinTitle <> 
   {
      SetTitleMatchMode, 2
      WinWait, %WinTitle%, , 3
      ; TrayTip, , Activating Window Title "%WinTitle%" (%TargetNameOnly%)
      WinActivate, %WinTitle%
   }
   Else
   {
      WinWait, ahk_pid %PID%, , 3
      ; TrayTip, , Activating PID %PID% (%TargetNameOnly%)
      WinActivate, ahk_pid %PID%
   }


  ;  SetTimer, RunOrActivateTrayTipOff, 1
}

; Turn off the tray tip
RunOrActivateTrayTipOff:
   SetTimer, RunOrActivateTrayTipOff, off
   TrayTip
Return

;example to run or activate the specific script, "Autohotkey"
; ^!+a::RunorActivate("notepad.exe", "AutoHotkey", "C:\Documents and Settings\ahoover.autotool\My Documents\AutoHotkey.ahk")
#v::RunOrActivate("C:\Program Files\Microsoft VS Code Insiders\Code - insiders.exe")
; #z::RunOrActivate("C:\Program Files\Git\usr\bin\bash.exe")
#n::RunOrActivate("C:\Program Files\Git\git-bash.exe")
#c::RunOrActivate("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")

;CapsLock::RAlt

  ; WinGet, JournalWindowID , ID, JOURNAL.md
  ; WinGet, currentWindow, ID, A
  ; if (JournalWindowID = currentWindow) {
  ;   if (WinExist("ahk_id" PreviousWindowId)) {
  ;     WinActivate, ahk_id %PreviousWindowId%
  ;   } else {
  ;     WinMinimize, "A"
  ;   }
  ; } else {
  ;   WinGet, PreviousWindowId, ID, A
  ;   if (WinExist("JOURNAL.md")) {
  ;     WinActivate, JOURNAL.md
  ;     JournalWindowID := WinExist("A")
  ;   } else {
  ;     Run, "C:\Program Files (x86)\Microsoft VS Code Insiders\Code - Insiders.exe" "C:\Users\Mihai\Sync\notes\JOURNAL.md", , Max
  ;   }
  ; }

; - open journal
; - toggle todo list
