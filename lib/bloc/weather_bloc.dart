import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/models/weather_model.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetched>(_getCurrentWeather);
  }

  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   super.onError(error, stackTrace);
  //   print(error);
  // }

  // @override
  // void onTransition(Transition<WeatherEvent, WeatherState> transition) {
  //   super.onTransition(transition);
  //   print('Transition: $transition');
  // }

  // @override
  // void onEvent(WeatherEvent event) {
  //   super.onEvent(event);
  //   print('Event: $event');
  // }

  void _getCurrentWeather(
      WeatherFetched event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weatherInfo = await weatherRepository.getCurrentWeather();
      final weather = weatherInfo['weatherModel'] as WeatherModel;
      final cityName = weatherInfo['cityName'];
      emit(WeatherSuccess(weatherModel: weather, cityName: cityName));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
