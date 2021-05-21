import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time_flutter_app/core/contexts/global.dart';
import 'package:world_time_flutter_app/core/contexts/home.dart';
import 'package:world_time_flutter_app/core/contexts/locais.dart';
import 'package:world_time_flutter_app/screens/home/home.dart';
import 'package:world_time_flutter_app/screens/splash/splash.dart';
import 'package:world_time_flutter_app/screens/locais/locais.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GlobalContext()),
        ChangeNotifierProvider(create: (context) => HomeContext()),
        ChangeNotifierProvider(create: (context) => LocaisContext()),
      ],
      child: MaterialApp(
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => Splash(),
          '/home': (context) => Home(),
          '/location': (context) => Locais(),
        },
      ),
    ),
  );
}
