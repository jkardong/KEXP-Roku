function GetPlayData()
    return "https://api.kexp.org/v1/play/"
end function 

function GetShow(show)
    return "https://api.kexp.org/v1/show/"
end function 

function GetLiveStream(encode)
    if(encode = "mp3")
        return "https://kexp-mp3-128.streamguys1.com/kexp128.mp3"
    else if (encode = "aac")
        return "http://live-aacplus-64.kexp.org/kexp64.aac"
    end if
end function 
