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
     data = ModalRoute.of(context)!.settings.arguments as Map;
     if (kDebugMode) {
       print(data);
     }
    return  Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 180.0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/location");
                    },
                    label: const Text(
                      "Edit Location",
                      style: TextStyle(
                        fontSize: 40.0,
                      ),),
                    icon: Icon(
                        Icons.edit_location,
                        size: 40.0,
                        color: Colors.grey[400],) ,),
                const SizedBox(height: 20.0,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                        Text(
                            data['location'],
                            style: const TextStyle(
                              fontSize: 30.0,
                            ),
                        ),
                  ],
                ),
                const SizedBox(height: 20.0,),
                Text(
                    data['time'],
                  style: const TextStyle(
                    fontSize: 66.0,
                  ),
                ),
              ],
            ),
          ),),
    );
  }
}

