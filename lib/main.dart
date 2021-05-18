import 'package:flutter/material.dart';
import 'package:world_time_flutter_app/screens/home/home.dart';
import 'package:world_time_flutter_app/screens/loading/loading.dart';
import 'package:world_time_flutter_app/screens/location/location.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => Location(),
      },
    ),
  );
}
