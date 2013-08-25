console.log "hi"

$("#photos a").click (e) ->
  e.preventDefault()
  $(this).tab "show"

$("#testimonies a").click (e) ->
  e.preventDefault()
  $(this).tab "show"

# $("#tripTabs a:last").tab "show"


