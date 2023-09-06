import 'package:intl/intl.dart';

String tempConverter(double value) {
  return "${(value - 271.15).round()} °C";
}

String dataConverter(int date) {
  var convertedDate = DateTime.fromMillisecondsSinceEpoch(date * 1000);

  return DateFormat("dd-MM-yyyy hh:mm:ss").format(convertedDate);
}

String imageHelper(String description) {
  switch (description) {
    case "clear sky":
      return "assets/images/clear_sky.jpg";
    case "few clouds":
      return "assets/images/few_clouds.jpg";
    case "scattered clouds":
      return "assets/images/scattered_clouds.jpg";
    case "broken clouds":
      return "assets/images/broken_clouds.jpg";
    case "shower rain":
      return "assets/images/shower_rain.jpg";
    case "rain":
      return "assets/images/rain.jpg";
    case "thunderstorm":
      return "assets/images/thunderstorm.jpg";
    case "snow":
      return "assets/images/snow.jpg";
    case "mist":
      return "assets/images/mist.jpg";
    default:
      return "assets/image/bg_image.jpg";
  }
}
