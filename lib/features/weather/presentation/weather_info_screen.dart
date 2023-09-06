import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/internal/helpers/utils.dart';

class WeatherInfoScreen extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherInfoScreen({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          weatherModel.name ?? "",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image(
              image: AssetImage(
                imageHelper(weatherModel.weather?.first.description ?? ""),
              ),
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tempConverter(weatherModel.main?.temp ?? 0),
                    style: TextStyle(
                      fontSize: 70,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text() //Я хотел сюда добавить clear, sunny, rainy or smth like this.
                      Text(
                        "${tempConverter(weatherModel.main?.tempMax ?? 0)} / ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        tempConverter(weatherModel.main?.tempMin ?? 0),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Sunrise: ",
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              dataConverter(weatherModel.sys?.sunrise ?? 0),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Sunset:  ",
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              dataConverter(weatherModel.sys?.sunset ?? 0),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  CachedNetworkImage(
                    imageUrl:
                        "https://openweathermap.org/img/wn/${weatherModel.weather!.first.icon}@4x.png",
                    progressIndicatorBuilder: (context, url, progress) {
                      return CircularProgressIndicator();
                    },
                    errorWidget: (context, url, error) {
                      return Icon(
                        Icons.error,
                        size: 40,
                        color: Colors.red,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
