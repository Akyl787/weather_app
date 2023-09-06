// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherInfoLoadingState extends WeatherState {}

class WeatherInfoLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherInfoLoadedState({required this.weatherModel});
}

class WeatherInfoErrorState extends WeatherState {
  final CatchException error;

  WeatherInfoErrorState({required this.error});
}
