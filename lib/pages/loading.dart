import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
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
