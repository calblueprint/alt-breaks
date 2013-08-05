create_new_infobubble = (content) ->
    bubble = new InfoBubble
        content: content
        hideCloseButton: true
        minWidth: 300
        disableAnimation: true

    window.infobubbles = [] if not window.infobubbles?
    window.infobubbles.push bubble
    return bubble

are_infobubbles_open = (return_them, close_them, except_current) ->
    if not window.infobubbles?
        return false
    rtn = []
    for bubble in window.infobubbles
        if bubble.isOpen()
            if not return_them and not close_them
                return true
            if close_them
                if not (except_current and bubble == window.open_infobubble)
                    bubble.close()
            else
                rtn.push(bubble)
    if return_them
        return rtn
    return false

create_and_bind_infobubble = (map, marker, html, zoom_level) ->
    bubble = create_new_infobubble html
    marker.bubble = marker.bubble || bubble

    google.maps.event.addListener marker.serviceObject, 'click', ->
        if !bubble.isOpen()
            if map.getZoom() != zoom_level
                map.setZoom zoom_level
            window.open_infobubble?.close()
            bubble.open(map, marker.serviceObject)
            window.open_infobubble = bubble
        else
            bubble.close()
            window.open_infobubble = null

create_and_bind_hover_link = (map, marker, name, zoom_level) ->
    html = $ "<li class='pan'>#{name}</li>"
    $(".trips ul").append html
    html.hover ->
        if map.getZoom() != zoom_level
            map.setZoom zoom_level

        if marker != null
            console.log name
            map.panTo marker.serviceObject.position
            if !marker.bubble?.isOpen()
                window.open_infobubble?.close()
                are_infobubbles_open(true, true, true) #close all other infobubbles
                marker.bubble.open(map, marker.serviceObject)
                window.open_infobubble = marker.bubble
        # if name == 'About Us'
        #     console.log 'about us'
        #     window.open_infobubble?.close()
        #     map.panTo new google.maps.LatLng(36.35, -106.5, false) #hard coded--how do i zoom back to center of all markers?



Gmaps.map.callback = ->
    console.log "GMAPS$RAILS CALLBACK CALLED"
    # go through each trip and associate the info bubble with it
    # @markers is automatically populated by gmaps4rails. so is @map
    window.markers = @markers

    if window.rendered_htmls?.length != @markers.length
        console.log "ERROR: Something is going wrong with the rendered html and markers."
        return

    #About
    # create_and_bind_hover_link(@map, null, 'About Us', 5)
    for i in [0...@markers.length]
        create_and_bind_infobubble(@map, @markers[i], window.rendered_htmls[i], window.zoom_levels[i])
        create_and_bind_hover_link(@map, @markers[i], window.trip_names[i], window.zoom_levels[i])

    google.maps.event.addListener @map, 'click', ->
        window.open_infobubble?.close()
        # console.log "fuck"