import 'package:flutter/material.dart';
import 'package:world_time_flutter_app/core/contexts/home.dart';
import 'package:world_time_flutter_app/core/models/pais.dart';
import 'package:world_time_flutter_app/screens/home/widgets/editar_local.dart';
import 'package:provider/provider.dart';
import 'package:world_time_flutter_app/shared/widgets/app_pais.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Pais pais;

  @override
  Widget build(BuildContext context) {
    this.pais = context.watch<HomeContext>().paisSelecionado;

    String bgImage = this.pais.ehDia ? 'day.png' : 'night.png';
    Color bgColor = this.pais.ehDia ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[EditarLocal(), AppPais(pais: this.pais)],
            ),
          ),
        ),
      ),
    );
  }
}
