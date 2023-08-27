import 'package:flutter/material.dart';
import '../services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {

  String time = "";
  //A separate function to move to a new screen since CONTEXT is permitted across async  functions
  void move(WorldTime worldTime){
    Navigator.pushReplacementNamed(context,"/home",arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime,
    }
    );
  }
  void setupWorldTime() async{
    WorldTime worldTime = WorldTime(location: "Berlin", url: "America/Toronto", flag: "germany.png");
    await worldTime.getTime();
    move(worldTime);
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
    return  const Scaffold(
      body:  Center(
        child:  SpinKitThreeInOut(
          color: Colors.blue,
          size: 50.0,
        ),
         ),
    );
  }
}
