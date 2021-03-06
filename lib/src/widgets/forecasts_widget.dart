import 'package:cuba_weather_dart/cuba_weather_dart.dart';
import 'package:cuba_weather_insmet_dart/cuba_weather_insmet_dart.dart' as aux;
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class ForecastWidget extends StatelessWidget {
  final WeatherModel weather;

  ForecastWidget({Key key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          padding: EdgeInsets.only(top: 16),
          child: Text(
            "Pronóstico para los siguientes días:",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: weather.forecasts.map(_buildForecast).toList(),
          ),
        )
      ],
    );
  }

  Widget _buildForecast(WeatherForecastModel forecast) {
    String weatherIconCode =
        _weatherIconCodeByState(forecast.state);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Día: ${forecast.day}',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        BoxedIcon(
          WeatherIcons.fromString(weatherIconCode, fallback: WeatherIcons.na),
          size: 40,
          color: Colors.white,
        ),
        Text(
          '${forecast.temperatureMin.round()}'
          ' / '
          '${forecast.temperatureMax.round()}'
          ' °C',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  String _weatherIconCodeByState(aux.State state) {
    String result = '';
    switch (state) {
      case aux.State.OccasionalShowers:
        result = 'wi-day-rain';
        break;
      case aux.State.ScatteredShowers:
        result = 'wi-rain';
        break;
      case aux.State.IsolatedShowers:
        result = 'wi-day-rain';
        break;
      case aux.State.AfternoonShowers:
        result = 'wi-showers';
        break;
      case aux.State.RainShowers:
        result = 'wi-showers';
        break;
      case aux.State.PartlyCloudy:
        result = 'wi-day-cloudy';
        break;
      case aux.State.Cloudy:
        result = 'wi-cloudy';
        break;
      case aux.State.Sunny:
        result = 'wi-day-sunny';
        break;
      case aux.State.Storms:
        result = 'wi-day-thunderstorm';
        break;
      case aux.State.AfternoonStorms:
        result = 'wi-thunderstorm';
        break;
      default:
        result = 'wi-na';
    }
    return result;
  }
}
