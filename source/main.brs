' ********** Copyright 2016 Roku Corp.  All Rights Reserved. ********** 

' sub Main()
'     showChannelSGScreen()
' end sub

' SGDEX Call to Set First Form
function GetSceneName() as String
    return "main_scene"
end function

' sub showChannelSGScreen()
'     screen = CreateObject("roSGScreen")
'     m.port = CreateObject("roMessagePort")
'     screen.setMessagePort(m.port)
'     scene = screen.CreateScene("main_scene")
'     screen.show()

'     while(true)
'         msg = wait(0, m.port)
'     msgType = type(msg)
'         if msgType = "roSGScreenEvent"
'             if msg.isScreenClosed() then return
'         end if
'     end while
' end sub

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