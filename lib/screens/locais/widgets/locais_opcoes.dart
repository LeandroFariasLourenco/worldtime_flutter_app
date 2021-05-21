import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time_flutter_app/core/contexts/locais.dart';
import 'package:world_time_flutter_app/core/models/pais.dart';
import 'package:world_time_flutter_app/core/services/worldtime_service.dart';
import 'package:world_time_flutter_app/shared/widgets/app_autocomplete.dart';

class LocaisOpcoes extends StatelessWidget {
  final List<Pais> paises = WorldTimeService.paises();
  final Function handleSelecaoBusca;

  void abrirFiltroLocais(context) {
    Provider.of<LocaisContext>(context, listen: false).filtroAberto = true;
  }

  LocaisOpcoes({this.handleSelecaoBusca});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppAutocomplete(
            sugestoes: this.paises,
            campoEntidade: 'location',
            onSelectHandler: (Pais paisSelecionado) {
              this.handleSelecaoBusca(
                WorldTimeService(pais: paisSelecionado),
              );
            },
          ),
          Container(
            width: 64.0,
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 10.0,
                    padding: EdgeInsets.all(0),
                    primary: Colors.blue[500],
                  ),
                  onPressed: () {
                    this.abrirFiltroLocais(context);
                  },
                  child: Icon(Icons.filter_alt),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
