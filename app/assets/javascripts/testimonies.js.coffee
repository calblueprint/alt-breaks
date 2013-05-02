# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# display a loading gif on the upload page so people don't assume the worst
console.log "binding testimony shit"
console.log $('#new_testimony')
$('#new_testimony').submit ->
	console.log "gunna show the uploader bar thing."
	$('.uploding').show()