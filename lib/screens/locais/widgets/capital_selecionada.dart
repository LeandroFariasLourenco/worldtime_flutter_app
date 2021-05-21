import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time_flutter_app/core/models/pais.dart';
import 'package:world_time_flutter_app/shared/widgets/app_local.dart';

class CapitalSelecionada extends StatelessWidget {
  final Pais pais;

  CapitalSelecionada({this.pais});

  @override
  Widget build(BuildContext context) {
    final double larguraDispositivo = MediaQuery.of(context).size.width;

    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        width: larguraDispositivo,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Capital atual: ',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
            Container(
              width: larguraDispositivo - 110,
              child: AppLocal(
                local: this.pais,
                dispararOnTap: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
