searchYelp = (args) ->
  $.ajax
    url   : window.location.href + 'search_yelp'
    data  : args
    cache : true
    success: (data) ->
      $('.results').html('')
      data = $.parseJSON(data)
      console.log data
      $(data.businesses).each ->
        $('.results').append('<p data-yelp-id="' + this.id + '">' + this.name + ' - ' + this.location.city + '</p>')

timer = null

setSearchTimer = ->
  timer = setTimeout( ->
    query = $('.search-yelp').val().replace(' ', '+')

    params =
      'term'      : query
      'location'  : 'evanston'

    searchYelp(params)
  , 1000)

$(document).ready ->
  $('.search-yelp').keypress ->
    clearTimeout(timer)
    setSearchTimer()
