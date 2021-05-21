import 'package:flutter/material.dart';
import 'package:world_time_flutter_app/core/models/pais.dart';

class AppPais extends StatelessWidget {
  final Pais pais;

  AppPais({this.pais});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        this.pais.tempo,
        style: TextStyle(
          fontSize: 66.0,
          color: Colors.white,
        ),
      ),
      Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              this.pais.localizacao,
              style: TextStyle(
                fontSize: 28.0,
                letterSpacing: 2.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
      ]),
      Container(
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/${this.pais.bandeira}'),
        ),
      ),
    ]);
  }
}
