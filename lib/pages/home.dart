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
      body: Center(
          child: SafeArea(
              child: Text(
                  "Home Screen",
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.amberAccent[200],
              ),
              ))),
    );
  }
}
