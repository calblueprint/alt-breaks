console.log "hello"

Gmaps.map.callback = ->
	# go through each trip and associate the info bubble with it
	console.log @markers
	# @markers is automatically populated by gmaps4rails