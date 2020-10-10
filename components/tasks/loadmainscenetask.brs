sub Init()
    m.top.functionName = "LoadMainSceneOptions" 
end sub

REM ********************************************************************
REM     Load Main Scene Options
REM ********************************************************************
sub LoadMainSceneOptions()

    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.SetURL("http://192.168.0.40:8888/server/roku-tutorial/main_scene_options.json")
    rsp = xfer.GetToString()
    json = ParseJson(rsp)

    for each category in json

        ? "HIT"
        ' 'Get Each JSON Parent Node
        ' value = json.Lookup(category)

        ' ' ===========================================================
        ' '   KEXP
        ' ' ===========================================================
        ' if Type(value) = "roArray"
        '     if category = "results"
        '         for each item in value
        '             if (item.playtype.playtypeid = 1)
        '                 ? "artist name: " + item.artist.name
        '             end if 
        '         end for
        '     end if
        ' end if 

    end for

end sub 