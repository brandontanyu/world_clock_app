import 'package:flutter/material.dart';

import '../services/world_time.dart';

    class ChooseLocation extends StatefulWidget {
      const ChooseLocation({super.key});
    
      @override
      State<ChooseLocation> createState() => _ChooseLocationState();
    }
    
    class _ChooseLocationState extends State<ChooseLocation> {

      List<WorldTime> locations = [
        WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
        WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
        WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
        WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
        WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
        WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
        WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
        WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
      ];

      WorldTime worldTime = WorldTime(location: "Berlin", url: "America/Toronto", flag: "germany.png");


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
          body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index){
              return Card(
                child: ListTile(
                  onTap: (){

                  },
                  title: Text(locations[index].location),
                ),
              );
            },

          ),
        );
      }
    }
    