import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Column(
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
                      color: Colors.grey[400],) ,)
            ],
          ),),
    );
  }
}
