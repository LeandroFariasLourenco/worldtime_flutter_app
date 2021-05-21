import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time_flutter_app/core/contexts/home.dart';
import 'package:world_time_flutter_app/core/models/pais.dart';
import 'package:world_time_flutter_app/core/services/worldtime_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void getCurrentTimezone() async {
    WorldTimeService worldTimeService = WorldTimeService(
      pais: Pais(
          localizacao: 'Berlin',
          bandeira: 'germany.png',
          fusoHorario: 'Europe/Berlin'),
    );
    await worldTimeService.getTimezone(context);

    Provider.of<HomeContext>(context, listen: false).pais =
        worldTimeService.pais;
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/home');
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
