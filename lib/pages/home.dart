import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {

     data = data.isNotEmpty? data : ModalRoute.of(context)!.settings.arguments as Map;

     //Set background
     String bgImage = data['isDayTime'] ? "day.png" : "nightTime.png";
     Color? bgColor = data['isDayTime'] ? Colors.blue[200] : Colors.black54;

     if (kDebugMode) {
       print(data);
     }
    return  Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration:  BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'),
                  fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 180.0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton.icon(
                      onPressed: () async {
                        dynamic results =  await Navigator.pushNamed(context, "/location");
                        setState(() {
                          data = {
                            'location': results['location'],
                            'flag': results['flag'],
                            'time': results['time'],
                            'isDayTime': results['isDayTime'],
                          };
                        });

                      },
                      label:  Text(
                        "Edit Location",
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.grey[200],
                        ),),
                      icon: Icon(
                          Icons.edit_location,
                          size: 40.0,
                          color: Colors.grey[200],) ,),
                  const SizedBox(height: 20.0,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                          Text(
                              data['location'],
                              style: const TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                              ),
                          ),
                    ],
                  ),
                  const SizedBox(height: 20.0,),
                  Text(
                      data['time'],
                    style: const TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),),
    );
  }
}

