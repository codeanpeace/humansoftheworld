$ ->

  displayOverlay = false

  $(document).ajaxStart ->
    if displayOverlay
      $('.ajax').show()

  $(document).ajaxStop ->
    displayOverlay = false
    $('.ajax').hide()

  $('#nav-map').click (ev) ->
    $(this).parent().toggleClass 'reveal'

  map = L.map('map').setView([15, 25], 2)

  cm_key = $("#map").data('cmkey')

  L.tileLayer("http://{s}.tile.cloudmade.com/#{cm_key}/997/256/{z}/{x}/{y}.png", {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
      maxZoom: 18,
      minZoom: 2
  }).addTo(map);

  mark = (m) ->
    latitude = m['latitude']
    longitude = m['longitude']
    marker = L.marker([latitude, longitude]).addTo(map)
    marker.about = m['about']
    marker.address = m['address']
    marker.cover_source = m['cover_source']
    marker.created_at = m['created_at']
    marker.description = m['description']
    marker.fb_id = m['fb_id']
    marker.id = m['id']
    marker.latitude = m['latitude']
    marker.likes = m['likes']
    marker.link = m['link']
    marker.longitude = m['longitude']
    marker.name = m['name']
    marker.place = m['place']
    marker.talking_about_count = m['talking_about_count']
    marker.updated_at = m['updated_at']
    # marker.bindPopup("<a href=#{link} target='_tab'>#{name}</a>")
    marker.bindPopup(marker.name)

    $(marker).hover (ev) ->
      ev.target.openPopup()
      # $('#nav-map').html ev.target.name

    $(marker).click (ev) ->
      name = ev.target.name
      ev.preventDefault()
      if $(this).hasClass('loaded') == false
        displayOverlay = true
        ajax_page(name)
        $('.loaded').removeClass 'loaded'
        $(this).addClass 'loaded'

    ajax_page = (name) ->
      $.ajax
        url: '/ajax_page'
        type: 'GET'
        data:
          name: name
        beforeSend: () ->
        success: (data, status, response) ->
          $('#top-viewer').html data
          console.log data
          $('#viewer').css 'background-image', 'url(' + $('#cover-source img').attr('src') + ')'
          $('#bottom-map').removeClass 'reveal'
        error: ->
        dataType: 'html'
      $.ajax
        url: '/ajax_photos'
        type: 'GET'
        data:
          name: name
        beforeSend: () ->
        success: (data, status, response) ->
          $('#photos_container').html data
        error: ->
        dataType: 'html'

  pages = gon.pages
  mark page for page in pages

  # $('#bottom-map').scroll () ->
  #   $('#top-viewer').
