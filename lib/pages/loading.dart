import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {

  String time = "Loading.......";

  void setupWorldTime() async{
    WorldTime worldTime = WorldTime(location: "Berlin", url: "Europe/Berlin", flag: "germany.png");
    await worldTime.getTime();
    setState(() {
      time = worldTime.time;
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: Center(
          child: Text(
              time,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic,
                ),)),
    );
  }
}
