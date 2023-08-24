import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {

  void getTime() async {
    // var uri =  Uri.parse('https://jsonplaceholder.typicode.com/todos/4');
    // final response = await get(uri);
    // final Map<String, dynamic> data = jsonDecode(response.body);
    // if (kDebugMode) {
    //   print(data);
    // }

    //make the request.
    final uri = Uri.parse("https://worldtimeapi.org/api/timezone/Europe/London");
    Response response = await get(uri);
    final Map<String, dynamic> data = jsonDecode(response.body);
    if (kDebugMode) {
      // print(data);

      //get properties from the data.
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      print(offset.substring(1,3));
      // print(datetime);

      //Create a date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset.substring(1,3))));
      print(now);
    }
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context)  {
    return const Scaffold(
      body: Center(
          child: Text(
              "Loading Screen",
                style: TextStyle(
                  fontSize: 40.0,
                  fontStyle: FontStyle.italic,
                ),)),
    );
  }
}
