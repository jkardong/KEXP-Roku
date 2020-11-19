function GetPlayDataURI()
    return "https://api.kexp.org/v1/play/"
end function 

function GetShowURI(show)
    return "https://api.kexp.org/v1/show/"
end function 

function GetLiveStream(encode)
    if(encode = "mp3")
        return "https://kexp-mp3-128.streamguys1.com/kexp128.mp3"
    else if (encode = "aac")
        return "http://live-aacplus-64.kexp.org/kexp64.aac"
    end if
end function 

function SetMainSceenText(area)

    'Set Vars
    return_text = "KEXP Streaming Roku Channel"

    'Decision Tree
    if(area = "streamingarchive")
        return_text = "Access the past two weeks of shows you love. Browse by Day, DJ and Show."
    else if (area = "listenlive")
        return_text = "Listen to KEXP live! Start listening now for all the greatest new upcoming artists. "
    else if (area = "podcasts")
        return_text = "Selected shows and broadcasts!"
    end if

    'Return Text
    return return_text

end function