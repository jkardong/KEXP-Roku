
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

    ? "BUTTON SELECTION"
    ? obj.id

    if(obj.id = "streamingarchive")

        ? "********************************************************************"
        ? "OPEN STREAMING ARCHIVE" 
        ? "********************************************************************"

        'Show/Hide Scenes
        SetSceneVisibility(obj.id)

    else if (obj.id = "listenlive")

        ? "********************************************************************"
        ? "OPEN LIVE STREAM" 
        ? "********************************************************************"

        'Show/Hide Scenes
        SetSceneVisibility(obj.id)

        'Start The Live Stream On Load
        PlayLiveStream(obj)
        
    else if (obj.id = "podcasts")

        ? "********************************************************************"
        ? "OPEN PODCASTS" 
        ? "********************************************************************"
        m.myObj = createObject("RoSGNode", "JSONLoaderTask")
        m.myObj.contenturi = GetPlayDataURI()
        m.myObj.observeField("foo", "GetDataFromAPI")
        m.myObj.control = "RUN"

    end if

end sub

sub GetDataFromAPI()

    data = m.myObj.foo 
    json = m.myObj.jsoncontent

    if json <> invalid
        ? json.bright 
    end if

    if data <> invalid 
        ? data
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
    if (obj.id = "listenlive")

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
REM     Load Main Poster Grid
REM     Called From: MainScene.brs Init()
REM ********************************************************************
function loadMainScene()

    ? "================================================"
    ? "  Load Main Scene Poster Nodes"
    ? "================================================"

    'Create Content Nodes
    postercontent = createObject("roSGNode","ContentNode")

    'get main scene nodes from local JSON
    feed = ReadAsciiFile("pkg:/feed/mainscene.json")

    'Load To UI
    if feed.Len() > 0
        ? "Main Scene JSON Loaded"

        'Get Val From JSON
        json = ParseJson(feed)

        ' Validate JSON
        if json <> invalid
            for each item in json

                'Create Poster Node
                node = CreateObject("roSGNode","ContentNode")

                'Get Value From JSON Array
                value = json[item]

                'If AssArray Then Load
                if type(value) = "roArray"

                    'Get AA Values
                    node_values = value[0]

                    'Populate Nodes
                    node.id = node_values.id
                    node.title = node_values.description
                    node.description = node_values.description
                    node.HDGRIDPOSTERURL = node_values.posterurl 
                    node.SHORTDESCRIPTIONLINE1 = node_values.shortDescription1 
                    node.SHORTDESCRIPTIONLINE2 =  node_values.shortDescription2
                    postercontent.appendChild(node)
                    m.content_grid.content=postercontent

                end if 
            end for
        end if
    end if

    'Populate Main Scene Poster Grid
    m.content_grid.visible=true
    m.content_grid.setFocus(true)

end function

REM ********************************************************************
REM     Screen Visibility
REM ********************************************************************
sub SetSceneVisibility(scene)

    if (scene = "listenlive")
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
    ' m.livestream_artist_name.text = "What The Heck!!"
    ? "What the heck"
end sub