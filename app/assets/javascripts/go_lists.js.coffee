root = window.location.href

searchResultClickHandler = () ->
  $('.results .search-result').click ->
    $(this)
      .clone()
      .appendTo('.go-list')

    info = 
      restaurantID : $(this).attr('data-yelp-id')
      name         : $(this).attr('data-name')

    $.ajax
      url   : root + 'add-to-list'
      data  : info
      cache : true
      success: (data) ->
        console.log data

searchYelp = (args) ->
  $.ajax
    url   : root + 'search_yelp'
    data  : args
    cache : true
    success: (data) ->
      counter = 0
      $('.results').html('')
      data = $.parseJSON(data)
      console.log data
      $(data.businesses).each ->
        if counter < 5
          $('.results').append('<p class="search-result" data-yelp-id="' + this.id + '" data-name="' + this.name + '">' + this.name + ' - ' + this.location.city + '</p>')
          counter++
        else
          return false

      searchResultClickHandler()

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
