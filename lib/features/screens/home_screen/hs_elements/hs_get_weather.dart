String getWeatherIcon(int code) {
  switch (code) {
    case 200:
      return 'rainy_thunderstorm';
    case 201:
      return 'rain_thunderstorm';
    case 202:
      return 'heavy_rain_thunderstorm';
    case >= 210 && <= 232:
      return 'thunderstorm';
    case >= 300 && < 400:
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
    default:
      return 'sun';
  }
}
