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

REM ********************************************************************
REM     User Selection
REM ********************************************************************
sub setSelection()

    'Find Selected UI Element Name
    selected = m.content_grid.content.getChild(m.content_grid.itemFocused)

    'Set The Text Of The UI
    m.option_description_text.text = SetMainSceenText(selected.id)

end sub

REM ********************************************************************
REM     User Item Selected
REM ********************************************************************
sub UIItemSelected()

    'print debug
    ? "UI Item Selected"

    'Get Selected Item
    playStream = m.content_grid.content.getChild(m.content_grid.itemFocused)

    'Play Stream
    OpenScreen(playStream)

end sub

REM ********************************************************************
REM     Button Selection
REM ********************************************************************
function onKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    
    return result 
end function
