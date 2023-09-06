import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/weather/domain/use_cases/weather_use_case.dart';
import 'package:weather_app/features/weather/presentation/logic/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/weather_info_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = WeatherBloc(
      weatherUseCase: WeatherUseCase(
        weatherRepository: WeatherRepositoryImpl(),
      ),
    );

    final TextEditingController controller = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: controller),
              SizedBox(height: 20),
              BlocListener<WeatherBloc, WeatherState>(
                bloc: weatherBloc,
                listener: (context, state) {
                  if (state is WeatherInfoLoadingState) {
                    SmartDialog.showLoading(msg: "Загрузка...");
                  }

                  if (state is WeatherInfoErrorState) {
                    SmartDialog.dismiss();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.error.message.toString(),
                        ),
                      ),
                    );
                  }

                  if (state is WeatherInfoLoadedState) {
                    SmartDialog.dismiss();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeatherInfoScreen(
                          weatherModel: state.weatherModel,
                        ),
                      ),
                    );
                  }
                },
                child: ElevatedButton(
                  onPressed: () {
                    controller.text;

                    weatherBloc.add(
                      GetWeatherInfoEvent(value: controller.text),
                    );
                  },
                  child: Text("Поиск"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
