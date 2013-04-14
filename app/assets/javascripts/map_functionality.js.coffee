console.log "hello, map_functionality called"

create_new_infobubble = (content) ->
    bubble = new InfoBubble
        content: content
        hideCloseButton: true
        minWidth: 300
        minHeight: 300
        disableAnimation: true
    return bubble

create_and_bind_infobubble = (map, marker, html) ->
    bubble = create_new_infobubble html
    marker.bubble = marker.bubble || bubble

    google.maps.event.addListener marker.serviceObject, 'click', ->
        if !bubble.isOpen()
            window.open_infobubble?.close()
            bubble.open(map, marker.serviceObject)
            window.open_infobubble = bubble
        else
            bubble.close()
            window.open_infobubble = null

create_and_bind_hover_link = (map, marker, name) ->
    html = $ "<li class='pan'>#{name}</li>"
    $(".trips ul").append html
    html.mouseenter ->
        map.panTo marker.serviceObject.position
        map.setZoom 6
        if !marker.bubble?.isOpen()
            window.open_infobubble?.close()
            marker.bubble.open(map, marker.serviceObject)
            window.open_infobubble = marker.bubble

Gmaps.map.callback = ->
    console.log "GMAPS$RAILS CALLBACK CALLED"
    # go through each trip and associate the info bubble with it
    # @markers is automatically populated by gmaps4rails. so is @map

    if window.rendered_htmls?.length != @markers.length
        console.log "Something is going wrong with the rendered html and markers."
        return

    for i in [0...@markers.length]
        create_and_bind_infobubble(@map, @markers[i], window.rendered_htmls[i])
        create_and_bind_hover_link(@map, @markers[i], window.trip_names[i])

    google.maps.event.addListener @map, 'click', ->
        window.open_infobubble?.close()
        # console.log "fuck"