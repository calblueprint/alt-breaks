# display a loading gif on the upload page so people don't assume the worst
console.log "binding testimony shit"
console.log $('#new_testimony')
$('#new_testimony').submit ->
	console.log "gunna show the uploader bar thing."
	$('.uploding').show()