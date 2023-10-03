import 'dart:convert';
import 'secrets.dart';
import 'dart:io';

void main() async {
  var apiKey = Keys.ApiKeyId;
  var city = 'Jakarta';
  var weatherUrl = Uri.parse('http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric');

  var responses = await HttpClient().getUrl(weatherUrl);
  // print(responses);
  var httpResponse = await responses.close();
  // print(httpResponse);
  var responseBody = await httpResponse.transform(utf8.decoder).join();
  // print(responseBody);


  Map<String, dynamic> json = jsonDecode(responseBody);

  print("Weather in Forecast:");
  List<dynamic> cuaca = json['list'];
  for (var forecast in cuaca) {
    var dateTime = forecast['dt_txt'];
    // print(dateTime);
    var date = formatDate(dateTime);
    // print(date);

    var temp = forecast['main']['temp'];
    var result = '$date: $temp°C';
    
    print(result);
  }
}

String formatDate(String inputDate) {
  List<String> months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  List<String> parts = inputDate.split(' ');
  List<String> dateParts = parts[0].split('-');

  int year = int.parse(dateParts[0]);
  int month = int.parse(dateParts[1]);
  int day = int.parse(dateParts[2]);

  DateTime date = DateTime(year, month, day);
  String dayName = days[date.weekday - 1];
  String monthName = months[date.month - 1];

  return '$dayName, ${date.day} $monthName ${date.year}';
}