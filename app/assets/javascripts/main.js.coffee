$ ->

  displayOverlay = false

  $(document).ajaxStart ->
    if displayOverlay
      $('.ajax-loading').show()

  $(document).ajaxStop ->
    displayOverlay = false
    $('.ajax-loading').hide()


  map = L.map('map').setView([15, 25], 2)

  cm_key = $("#map").data('cmkey')

  L.tileLayer("http://{s}.tile.cloudmade.com/#{cm_key}/997/256/{z}/{x}/{y}.png", {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
      maxZoom: 18,
      minZoom: 2
  }).addTo(map);

  mark = (marker) ->
    latitude = marker['latitude']
    longitude = marker['longitude']
    about = marker['about']
    address = marker['address']
    cover_source = marker['cover_source']
    created_at = marker['created_at']
    description = marker['description']
    fb_id = marker['fb_id']
    id = marker['id']
    latitude = marker['latitude']
    likes = marker['likes']
    link = marker['link']
    longitude = marker['longitude']
    name = marker['name']
    place = marker['place']
    talking_about_count = marker['talking_about_count']
    updated_at = marker['updated_at']
    marker = L.marker([latitude, longitude]).addTo(map)
    # just extend marker class!
    # marker.bindPopup("<a href=#{link} target='_tab'>#{name}</a>")
    marker.bindPopup("#{name}")

    $(marker).hover (ev) ->
      ev.target.openPopup()
      # (ev) -> ev.target.closePopup()
      $('#nav-map').html ev.target

    $(marker).click (ev) ->
      name = $(ev.target)[0]['_popup']['_content']
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
          # $('#viewer').append "#{image_tag 'ajax_load_map.GIF'}"
          # $('#viewer').append '<div class="loading"><img src="/images/ajax_load_map.GIF" alt="Loading..." /></div>'
        # success: (data, status, response) ->
        #   page = JSON.parse data['page']
        #   photos = JSON.parse data['photos']gen
        #   # $('body').append data[0]
        success: (data, status, response) ->
          $('#viewer').html data
          console.log data
          $('#bottom-map').removeClass 'reveal'
        error: ->
          # Hard error
        # dataType: "json"
        dataType: "html"

  pages = gon.pages
  mark page for page in pages



# returns name of marker
# $('.leaflet-popup-content-wrapper a')[0].text