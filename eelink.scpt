use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
  Returns a Markdown styled link including sender and subject  to the first selected Apple Mail message
*)

tell application "Mail"
	set _msgs to selected messages of message viewer 0
	if (_msgs is not equal to missing value) then
		set _msg to first item of _msgs
		set _msgID to the message id of the _msg
		
		set mailSubject to subject of _msg
		set mailSender to sender of _msg
		return "[" & mailSender & " - " & mailSubject & "](message://%3C" & (_msgID) & "%3E)"
	end if
end tell
