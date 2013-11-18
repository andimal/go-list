searchYelp = (args) ->
  $.ajax
    url   : window.location.href + 'search_yelp'
    data  : args
    cache : true
    success: (data) ->
      console.log $.parseJSON(data)

params =
  'term'      : 'phillys+best'
  'location'  : 'evanston'

searchYelp(params)
