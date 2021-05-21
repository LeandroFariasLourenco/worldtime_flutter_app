import 'package:flutter/material.dart';
import 'package:world_time_flutter_app/core/models/pais.dart';

class AppLocal extends StatelessWidget {
  final Function handleTap;
  final Pais local;
  final int indice;
  final bool dispararOnTap;

  AppLocal({
    this.local,
    this.indice,
    this.handleTap,
    this.dispararOnTap = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      child: ListTile(
        onTap: () {
          if (this.dispararOnTap) {
            this.handleTap(indice);
          }
        },
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/${this.local.bandeira}'),
        ),
        title: Text(this.local.localizacao),
      ),
    );
  }
}
