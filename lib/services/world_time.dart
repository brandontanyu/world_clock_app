import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime{
  final String location;
  final String url;      //location url for API endpoint
  late final String time; // the time in that location
  final String flag;  // url to an asset flag icon
  late bool isDayTime; //true or false is daytime or not.

  WorldTime({
    required this.location,
    required this.url,
    required this.flag
  });

  Future<void>  getTime() async {

    try{
      //make the request.
      final uri = Uri.parse("https://worldtimeapi.org/api/timezone/$url");
      http.Response response = await http.get(uri);

      final Map<String, dynamic> data = jsonDecode(response.body);
      if (kDebugMode) {

        //get properties from the data.
        String datetime = data['datetime'];
        String offset = data['utc_offset'];
        print(offset.substring(1,3));

        //Create a date time object
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset.substring(1,3))));

        isDayTime = now.hour > 6 && now.hour < 20 ? true: false;
        time = DateFormat.jm().format(now);
      }
    }catch(e){
      if (kDebugMode) {
        print("Caught Error: $e");
        time = "Could not Load time Data!";
      }
    }
  }
}

