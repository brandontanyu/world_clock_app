import 'package:flutter/material.dart';

    class ChooseLocation extends StatefulWidget {
      const ChooseLocation({super.key});
    
      @override
      State<ChooseLocation> createState() => _ChooseLocationState();
    }
    
    class _ChooseLocationState extends State<ChooseLocation> {

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: Colors.indigo[600],
            title: const Text("Choose Location"),
            centerTitle: true,
            elevation: 0.0,
          ),
          body:  Center(
              child: Text(
                  "Choose Location Screen",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.grey[900],
                  ),)),
        );
      }
    }
    