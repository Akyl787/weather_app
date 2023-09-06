import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/domain/use_cases/weather_use_case.dart';
import 'package:weather_app/internal/helpers/catch_exception.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUseCase weatherUseCase;

  WeatherBloc({required this.weatherUseCase}) : super(WeatherInitialState()) {
    on<GetWeatherInfoEvent>((event, emit) async {
      try {
        emit(WeatherInfoLoadingState());

        final data = await weatherUseCase.getWeatherInfo(value: event.value);

        emit(WeatherInfoLoadedState(weatherModel: data));
      } catch (e) {
        emit(WeatherInfoErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
