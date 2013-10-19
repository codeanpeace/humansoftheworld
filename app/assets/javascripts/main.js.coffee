$ ->
  map = L.map('map').setView([51.505, -0.09], 13)

  cm_key = $("#map").data('cmkey')

  L.tileLayer("http://{s}.tile.cloudmade.com/#{cm_key}/997/256/{z}/{x}/{y}.png", {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
      maxZoom: 18
  }).addTo(map);

  marker = L.market([51.5, -0.09]).addTo(map)