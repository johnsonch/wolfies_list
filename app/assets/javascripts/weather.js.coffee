@convertKToF = (k) ->
  Math.round((k - 273.15)* 1.8000 + 32.00)

@convertBearing = (bearing) ->
  points = ["N ","NE","E","SE","S","SW","W","NW"]
  seg_size = 360 / points.length
  points[Math.floor(((parseInt(bearing) + (seg_size / 2)) % 360) / seg_size)]

@renderWeather = (data) ->
  weatherPanel = $("#weather-data")
  weatherPanel.html ""
  weatherPanel.append Handlebars.compile(
    "{{#weather}} 
      <h3>Weather</h3>
 Temperature:
      <ul>
        <li>Current {{main.temp}}&degF</li>
        <li>Wind Direction {{main.wind}}</li>
       </ul>
    {{/weather}}")(weather: data)
  return

@populateWeather = (data) ->
  sanitizedData = {
    main: {
      temp: convertKToF(data.main.temp),
      wind: convertBearing(data.wind.deg)
    }
  }
  renderWeather(sanitizedData)

@getWeather = (url) ->
  $.ajax
    method: "get"
    url: url
    success: (data) ->
      populateWeather(data)
      return
    error: (data) ->
      console.log data
      return