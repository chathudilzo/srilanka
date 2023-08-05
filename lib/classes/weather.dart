class Weather{
  double? temperature;
  String? condition;
  int? humidity;
  String? country;
  String? place;
  String? weatherIcon;
  String? message;

  Weather({required this.place,required this.temperature,required this.condition,required this.humidity,required this.country,this.weatherIcon,this.message});

}