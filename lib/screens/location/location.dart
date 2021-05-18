import 'package:flutter/material.dart';
import 'package:world_time_flutter_app/core/services/worldtime_service.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  void initState() {
    super.initState();
  }

  List<WorldTimeService> locations = [
    WorldTimeService(
        timezone: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTimeService(
        timezone: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTimeService(
        timezone: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTimeService(
        timezone: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTimeService(
        timezone: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTimeService(
        timezone: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTimeService(
        timezone: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTimeService(
        timezone: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(int index) async {
    WorldTimeService worldTimeService = locations[index];
    await worldTimeService.getTimezone();
    Navigator.pop(context, {
      'time': worldTimeService.time,
      'location': worldTimeService.location,
      'flag': worldTimeService.flag,
      'isDaytime': worldTimeService.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: this.locations.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
          child: Card(
            child: ListTile(
              onTap: () {
                this.updateTime(index);
              },
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/images/${this.locations[index].flag}'),
              ),
              title: Text(this.locations[index].location),
            ),
          ),
        ),
      ),
    );
  }
}
