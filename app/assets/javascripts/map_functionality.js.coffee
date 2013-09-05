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
    window.marker = marker
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
    html = $ "<div class='pan'><a href = '/trips/#{marker.id}'><li>#{name}</li></a></div>"
    $(".trips ul").append html
    html.hover ->
        if map.getZoom() != zoom_level
            map.setZoom zoom_level

        if marker != null
            map.panTo marker.serviceObject.position
            if !marker.bubble?.isOpen()
                window.open_infobubble?.close()
                are_infobubbles_open(true, true, true) #close all other infobubbles
                marker.bubble.open(map, marker.serviceObject)
                window.open_infobubble = marker.bubble


Gmaps.map.callback = ->
    # go through each trip and associate the info bubble with it
    # @markers is automatically populated by gmaps4rails. so is @map
    window.markers = @markers

    for i in [0...@markers.length]
        current_marker = @markers[i]
        if current_marker['type'] == 'trip'
            create_and_bind_infobubble(@map, @markers[i], window.rendered_htmls[i], window.zoom_levels[i])
            create_and_bind_hover_link(@map, @markers[i], window.trip_names[i], window.zoom_levels[i])
        else
            # TODO: setting the zoom level to 16 is quite arbitrary. ideally we should store the zoom
            # level of a partner location directly in the model and store it in the window to be retrieved here.
            create_and_bind_infobubble(@map, @markers[i], window.rendered_htmls[i], 5)
            # make the icon white
            @markers[i].serviceObject.setIcon('http://maps.google.com/mapfiles/marker_white.png')

    google.maps.event.addListener @map, 'click', ->
        window.open_infobubble?.close()