#Persistent
#SingleInstance force

::@em::mihai.rotaru@gmx.com
::@pc::NW4 2RY
F6::
  FormatTime, CurrentDateTime,, ddd, yyyy-MM-dd HH:mm:ss   
  SendInput %CurrentDateTime%
  return
;  ::@mo::
;  ::@o2::
;  ::@omo::

::@wem::mihai.rotaru@miceanddice.com
::@wpc::

SetTitleMatchMode 2

CapsLock::
  WinGet, JournalWindowID , ID, JOURNAL.md
  WinGet, currentWindow, ID, A
  if (JournalWindowID = currentWindow) {
    if (WinExist("ahk_id" PreviousWindowId)) {
      WinActivate, ahk_id %PreviousWindowId%
    } else {
      WinMinimize, "A"
    }
  } else {
    WinGet, PreviousWindowId, ID, A
    if (WinExist("JOURNAL.md")) {
      WinActivate, JOURNAL.md
      JournalWindowID := WinExist("A")
    } else {
      Run, "C:\Program Files (x86)\Microsoft VS Code Insiders\Code - Insiders.exe" "C:\Users\Mihai\Sync\notes\JOURNAL.md", , Max
    }
  }

; - open journal
; - toggle todo list
