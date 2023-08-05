import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import '../classes/weather.dart';
import 'package:http/http.dart' as http;
class WeatherController extends GetxController{

 


String _apiKey='';
String _apiUrl="";

bool isLoading=true;
bool clwIsLoading=true;

Rx<Weather?>_currentWeather=Rx<Weather?>(null);

Weather? get currentWeather=>_currentWeather.value;

RxList<Weather> weatherData=RxList<Weather>();

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    
    
  }


Future<void>getLocationWeather(double latD,double lonD)async{
  try{
    
 
    await dotenv.load();
    _apiKey = dotenv.env['WEATHER_API'].toString();
    final double? lat=lonD;
    final double? lon=latD;
    _apiUrl='https://api.openweathermap.org/data/2.5/weather?lat=${lat.toString()}&lon=${lon.toString()}&appid=${_apiKey}';
     final response = await http.get(Uri.parse(_apiUrl));
     print(response.body);
        if (response.statusCode == 200) {
          final data = json.decode(response.body);

          final temp = data['main']['temp'];
          final String message = getMessage(temp - 273.15);
          final String icon = getIcon(data['weather'][0]['main']);

          final Weather weather = Weather(
            place: data['name'],
            temperature: temp - 273.15,
            condition: data['weather'][0]['main'],
            humidity: data['main']['humidity'],
            country: data['sys']['country'],
            weatherIcon: icon,
            message: message,
          );
          _currentWeather.value=weather;
          

        }
        if(_currentWeather.value!=null){
          print(_currentWeather.value?.place);
            clwIsLoading=false;
        }
        
      
    } catch (e) {
      print(e.toString());
    } finally {
      
      update(); // Notify listeners that the data has been updated
    }

}

  // Future<void> getWeather() async {
  //   await dotenv.load();
  //   _apiKey = dotenv.env['WEATHER_API'].toString();

  //   try {
  //     for (int i = 0; i < districts.length; i++) {
  //       final double? lat = districts[i].lat;
  //       final double? lon = districts[i].lon;

  //       _apiUrl =
  //           'https://api.openweathermap.org/data/2.5/weather?lat=${lat.toString()}&lon=${lon.toString()}&appid=${_apiKey}';
  //       final response = await http.get(Uri.parse(_apiUrl));
  //       if (response.statusCode == 200) {
  //         final data = json.decode(response.body);

  //         final temp = data['main']['temp'];
  //         final String message = getMessage(temp - 273.15);
  //         final String icon = getIcon(data['weather'][0]['main']);

  //         final Weather weather = Weather(
  //           city: data['name'],
  //           temperature: temp - 273.15,
  //           condition: data['weather'][0]['main'],
  //           humidity: data['main']['humidity'],
  //           country: data['sys']['country'],
  //           weatherIcon: icon,
  //           message: message,
  //         );
  //         weatherData.add(weather);
  //       }
  //     }
  //     if(weatherData.length>0){
  //       isLoading=false;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   } finally {
      
  //     update(); // Notify listeners that the data has been updated
  //   }
  // }

  String getIcon(String condition) {
  if (condition.contains('Thunderstorm')) {
    return '🌩';
  } else if (condition.contains('Drizzle') || condition.contains('Rain')) {
    return '🌧';
  } else if (condition.contains('Rain')) {
    return '☔️';
  } else if (condition.contains('Snow')) {
    return '☃️';
  } else if (condition.contains('Mist') || condition.contains('Fog')) {
    return '🌫';
  } else if (condition == 'Clear') {
    return '☀️';
  } else if (condition.contains('Clouds')) {
    return '☁️';
  } else {
    return '🤷‍';
  }
}

 String getMessage(double temp) {
  if (temp > 25) {
    return 'It\'s time for 🍦';
  } else if (temp > 20) {
    return 'Wear shorts and 👕';
  } else if (temp < 10) {
    return 'Bundle up with 🧣 and 🧤';
  } else {
    return 'Bring a 🧥 just in case';
  }
}
}