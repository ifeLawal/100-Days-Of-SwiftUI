API_KEY=ea6cf8ed6924aa6c0f4f0d01e0edf0b6

### Geocoding_API.json
* The sample call that gives the JSON response is -> http://api.openweathermap.org/geo/1.0/direct?q=London&limit=5&appid=ea6cf8ed6924aa6c0f4f0d01e0edf0b6
* Webpage with geocoding details -> https://openweathermap.org/api/geocoding-api


### Icon API
* website that breakdown the icon structure -> https://openweathermap.org/weather-conditions
* Full URL link -> https://openweathermap.org/img/wn/10d@2x.png
* n is night time
* d is day time
* https://openweathermap.org/img/wn/<icon>@2x.png

### Weather API
* website with breakdown https://openweathermap.org/current
* 2.5 API call with lat and long https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
* 2.5 API call with city https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
* 2.5 API call for 5 day forecast api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid={API key}
* 3.0 https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&appid={API key}
    * Probably best to exclude minutely and hourly? https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&exclude=minutely,hourly,daily&appid={API key}
* 
