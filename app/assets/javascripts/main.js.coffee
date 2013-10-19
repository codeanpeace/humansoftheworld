$ ->
  map = L.map('map').setView([51.505, -0.09], 13)

  cm_key = $("#map").data('cmkey')

  L.tileLayer("http://{s}.tile.cloudmade.com/#{cm_key}/997/256/{z}/{x}/{y}.png", {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
      maxZoom: 18
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
    marker.bindPopup("<a href=#{link} target='_tab'>#{name}</a>")

  pages = gon.pages
  mark page for page in pages
