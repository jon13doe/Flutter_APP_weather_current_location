String getWeatherIcon(int code) {
  switch (code) {
    case 200:
      return 'rainy_thunderstorm';
    case 201:
      return 'rain_thunderstorm';
    case 202:
      return 'heavy_rain_thunderstorm';
    case 210:
      return 'low_thunderstorm';
    case 211:
      return 'thunderstorm';
    case 212 && 221:
      return 'heavy_thunderstorm';
    case 230 || 231 || 232:
      return 'thunderstorm';
    case 300:
      return 'low_drizzle';
    case 301:
      return 'drizzle';
    case 302:
      return 'heavy_drizzle';
    case >= 310 && < 400:
      return 'drizzle';
    case 500 || 520:
      return 'rainy';
    case 501 || 521:
      return 'rain';
    case 502 || 503 || 522 || 531:
      return 'heavy_rain';
    case 600 || 620:
      return 'snowy';
    case 601 || 621:
      return 'snow';
    case 602 || 622:
      return 'heavy_snow';
    case 800:
      return 'sun';
    case 801:
      return 'clouds_with_sun';
    case 802:
      return 'low_clouds';
    case 803:
      return 'clouds';
    case 804:
      return 'heavy_clouds';
    default:
      return 'sun';
  }
}
