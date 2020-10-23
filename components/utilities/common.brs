
REM ********************************************************************
REM ********************************************************************
REM ==
REM ==  KEXP Roku TV
REM ==  Author: J Kardong
REM ==  Copyright: Friends of KEXP
REM ==  Created: Sept 25
REM ==  Description: Referenced from the MainScene.xml file
REM ==
REM ********************************************************************
REM ********************************************************************


REM ********************************************************************
REM     Hide and show screens
REM ********************************************************************
sub OpenScreen(obj)

    if(obj.id = "streamingarchive")

        ? "********************************************************************"
        ? "OPEN STREAMING ARCHIVE" 
        ? "********************************************************************"

        'Show/Hide Scenes
        SetSceneVisibility(obj.id)

    else if (obj.id = "livestream")

        ? "********************************************************************"
        ? "OPEN LIVE STREAM" 
        ? "********************************************************************"

        'Show/Hide Scenes
        SetSceneVisibility(obj.id)

        'Start The Live Stream On Load
        PlayLiveStream(obj)

    end if

end sub

REM ********************************************************************
REM     Play The Live Stream
REM ********************************************************************
sub PlayLiveStream(obj)

    ' stop play if playing
    if(m.audio.control = "play")
        m.audio.control = "stop"
    end if 

    ' play just the livestream
    if (obj.id = "livestream")

        'create a content node
        content = CreateObject("roSGNode","ContentNode")

        'set vars
        encode = "mp3"

        'create Node 'TODO - Toggle Logic To Be Added
        content.setFields({
            streamformat: encode
            url: GetLiveStream(encode)
            live: true
        }) 

        'set Node to player
        m.audio.content = content

        'Play Stream
        m.audio.control = "play"

        'Change Play Image 
        m.livestream_play_button = m.top.FindNode("livestream_play_button")
        m.livestream_play_button.uri = "pkg:/images/misc/pause.png"

        '
        m.jsonloadertask = CreateObject("roSGNode","jsonloadertask")
        m.jsonloadertask.control = "run"

    end if
end sub

REM ********************************************************************
REM     Load Live Stream JSON
REM ********************************************************************
sub LoadLiveStreamJSON(obj)

    ' request the content feed from the API
    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.SetURL("https://jonathanbduval.com/roku/feeds/roku-developers-feed-v1.json")
    rsp = xfer.GetToString()
    rootChildren = []
    rows = {}
end sub 

REM ********************************************************************
REM     Screen Visibility
REM ********************************************************************
sub SetSceneVisibility(scene)

    if (scene = "livestream")
        ? "Show Live Stream"
        m.content_grid.visible = false
        'm.header_label.visible = false
        m.live_stream.visible = true
    else if (scene = "streamingarchive")
        ? "Show Streaming Archive"
        m.live_stream.visible = false 
        m.content_grid.visible = false
        m.streaming_archive.visible = true 
    end if 

end sub

sub Foo()
    ' m.livestream_artist_name = m.top.FindNode("livestream_artist_name")
    ' m.livestream_artist_name.text = "Fuck you"
    ? "What the heck"
end sub