#Persistent

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

F5::
  WinGet, JournalWindowID , ID, "JOURNAL.md", , , 

  ; if the current window is JOURNAL:
  ; - bring previous ID to foreground
  ; - if no longer exists, minimize JOURNAL
  if (JournalWindowID = WinExist("A")) {
    if (WinExist(ahk_id %PreviousWindowId%)) {
      WinActivate, ahk_id %PreviousWindowId%
    } else {
      WinMinimize, "A"
    }
  } else {
  ; if no, then:
  ; - save the active window's ID
  ; - see if we have the JOURNAL window open
  ;   - if yes, bring it to foreground, and maximize it
  ;   - if no, start the editor with the JOURNAL, then maximize
    PreviousWindowId := WinExist("A")
    if (WinExist("JOURNAL.md")) {
      WinActivate, "JOURNAL.md"
      WinMaximize
      JournalWindowID := WinExist("A")
    } else {
      Run, "C:\Program Files (x86)\Microsoft VS Code Insiders\Code - Insiders.exe" "C:\Users\Mihai\Sync\notes\JOURNAL.md", , Max
    }
  }


  ; if yes, put it in the background
; - open journal
; - toggle todo list
