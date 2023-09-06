import 'package:dio/dio.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/internal/helpers/api_requester.dart';
import 'package:weather_app/internal/helpers/catch_exception.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<WeatherModel> getWeatherInfo({required String value}) async {
    try {
      Response response = await apiRequester.toGet(
        url: "weather",
        queryParams: {
          "q": value,
          "appid": "d0617a5c2dca461ecff826af2453a679",
          // "lang": "ru",
        },
      );

      print("statusCode == ${response.statusCode}");
      print("respose.data == ${response.data}");

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      }

      throw response;
    } catch (e) {
      print("getWeatherInfo error: $e");
      throw CatchException.convertException(e);
    }
  }
}
