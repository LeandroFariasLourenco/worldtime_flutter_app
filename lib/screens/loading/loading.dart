import 'package:flutter/material.dart';
import 'package:world_time_flutter_app/core/services/worldtime_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getCurrentTimezone() async {
    WorldTimeService worldTimeService = WorldTimeService(
        location: 'Berlin', flag: 'germany.png', timezone: 'Europe/Berlin');
    await worldTimeService.getTimezone();

    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'time': worldTimeService.time,
        'location': worldTimeService.location,
        'flag': worldTimeService.flag,
        'isDaytime': worldTimeService.isDayTime
      });
    });
  }

  @override
  void initState() {
    super.initState();
    this.getCurrentTimezone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Center(
        child: SpinKitPouringHourglass(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
