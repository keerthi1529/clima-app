import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apikey='141b750ed04535af4cd49d67efba6e04';
const openweather='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async{
    var url= '$openweather?q=$cityName&appid=$apikey&units=metric';
    Network network =Network(url);
    var weatherData=await network.getData();
    return weatherData;
  }
  Future <dynamic> getLocationWeather() async{
    Location location= Location();
    await location.getCurrentLocation();
    var url='$openweather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric';
    Network network =Network(url);
    var weatherData= await network.getData();
    return weatherData;
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
