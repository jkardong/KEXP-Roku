sub init()
  m.top.functionName = "getmainscreencontent"
end sub

sub getmainscreencontent()


  xfer = CreateObject("roURLTransfer")
  xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
  xfer.SetURL("https://api.kexp.org/v1/play")
  rsp = xfer.GetToString()
  counter = 1
  playData = {}
  json = ParseJson(rsp)

  for each category in json

    value = json.Lookup(category)

    if Type(value) = "roArray"
        if category = "results"
            for each item in value
                if (item.playtype.playtypeid = 1)
                    playData[Str(item.playid)] = item.artist.name
                end if 
            end for
        end if
    end if 

end for

'========================================================
content = createObject("roSGNode", "ContentNode")

contentxml = createObject("roXMLElement")

readInternet = createObject("roUrlTransfer")
readInternet.setUrl(m.top.contenturi)

contentxml.parse(readInternet.GetToString())

if contentxml.getName()="Content"
    for each item in contentxml.GetNamedElements("item")
        itemcontent = content.createChild("ContentNode")
        itemcontent.setFields(item.getAttributes())
    end for
end if
'========================================================

m.top.content = content

end sub