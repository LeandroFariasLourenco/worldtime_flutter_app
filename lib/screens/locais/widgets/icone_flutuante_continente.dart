import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time_flutter_app/core/contexts/locais.dart';
import 'package:world_time_flutter_app/core/models/continente.dart';

class IconeFlutuanteContinente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool filtrosAberto = context.watch<LocaisContext>().drawerFiltroAberto;

    Continente continenteSelecionado =
        Provider.of<LocaisContext>(context, listen: false)
            .continenteSelecionado;

    Widget renderIcone() {
      if (continenteSelecionado == null) {
        return Container();
      }
      return Positioned(
        bottom: 80,
        right: 10,
        child: GestureDetector(
          onTap: () {
            Provider.of<LocaisContext>(
              context,
              listen: false,
            ).filtroAberto = true;
          },
          child: Card(
            elevation: 25,
            color: Colors.transparent,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30000),
              ),
              child: Padding(
                padding: EdgeInsets.all(9),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                      'assets/images/${continenteSelecionado.icone}'),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Visibility(
      visible: !filtrosAberto && continenteSelecionado != null,
      child: renderIcone(),
    );
  }
}
