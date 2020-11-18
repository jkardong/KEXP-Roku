REM ********************************************************************
REM ********************************************************************
REM ==
REM ==  KEXP Roku TV
REM ==  Author: J Kardong
REM ==  Copyright: Friends of KEXP
REM ==  Created: Sept 25
REM ==
REM ********************************************************************
REM ********************************************************************

' SGDEX Call to Set First Form
function GetSceneName() as String
    return "main_scene"
end function

'==============================================
' Live Audio - AAC Works
'==============================================
    'http://devtools.web.roku.com/stream_tester/html/
    'http://live-aacplus-64.kexp.org/kexp64.aac
    'https://kexp-mp3-128.streamguys1.com/kexp128.mp3

'==============================================
' PLAYLIST
'==============================================
    'https://api.kexp.org
    'https://api.kexp.org/v1/play/