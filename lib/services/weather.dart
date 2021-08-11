import 'package:clima/location.dart';
import 'package:clima/services/networking.dart';
const apikey='ea0b115dd77a6b40e4a1e8e95b418abf';
const url='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future<dynamic> getcityweather(String cityname) async{
var url2='$url?q=$cityname&appid=$apikey&units=metric';
Networkhelp networkhelper=Networkhelp(url2);
var weatherdata=await networkhelper.getdata();
return weatherdata;
  }
  Future<dynamic> getlocationweather() async{
    Location location=Location();
    await location.getcurrentlocation();

    Networkhelp nethelp=Networkhelp('$url?lat=${location.latitude}&lon=${location.longitude}&appid=${apikey}&units=metric');
    var weatherdata=await nethelp.getdata();
    return weatherdata;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
