// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

abstract class WeatherEvent {}

class GetWeatherInfoEvent extends WeatherEvent {
  final String value;

  GetWeatherInfoEvent({required this.value});
}
