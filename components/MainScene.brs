' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********  

sub init()

    m.top.SetFocus(true)

    ' styling
	m.top.backgroundURI = ""
    m.top.backgroundColor = "#f4f4f4"

    ' set global var
    m.content_grid = m.top.FindNode("content_grid")
    m.live_stream = m.top.FindNode("live_stream")
    m.streaming_archive = m.top.FindNode("streaming_archive")
    m.option_description_text = m.top.FindNode("option_description_text")
    m.audio = createObject("RoSGNode", "Audio")

    'observe
    m.content_grid.observeField("itemFocused","setSelection")
    m.content_grid.observeField("itemSelected","uiitemselected")
    
    'Set Main Scene Menu Items
    loadMainScene()

End sub

'User Selection
sub setSelection()

    'Find Selected UI Element Name
    selected = m.content_grid.content.getChild(m.content_grid.itemFocused)

    'Set The Text Of The UI
    m.option_description_text.text = SetMainSceenText(selected.id)

end sub

sub UIItemSelected()

    'print debug
    ? "UI Item Selected"

    'Get Selected Item
    playStream = m.content_grid.content.getChild(m.content_grid.itemFocused)

    'Play Stream
    OpenScreen(playStream)

end sub


'LOAD POSTER GRID
function loadMainScene()

    ? "================================================"
    ? "  Load Main Scene Poster "
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

'BUTTON SELECTION
function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    
    return result 
end function
