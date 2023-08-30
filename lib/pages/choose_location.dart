import 'package:flutter/foundation.dart';
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
        // WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'toronto.png'),
        WorldTime(url: 'Africa/Douala', location: 'Douala', flag: 'douala.png'),
      ];

      void updateTime(index) async{
        WorldTime worldTime = locations[index];
        await worldTime.getTime();

        //Navigate to home screen with data
        navigateToHome(worldTime);
      }

      void navigateToHome(WorldTime worldTime){
        Navigator.pop(context,{
          'location': worldTime.location,
          'flag': worldTime.flag,
          'time': worldTime.time,
          'isDayTime': worldTime.isDayTime,
        });
      }

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
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
                child: Card(
                  child: ListTile(
                    onTap: (){
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    subtitle: const Text('Something'),
                    subtitleTextStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/${locations[index].flag}'),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }
    }
    