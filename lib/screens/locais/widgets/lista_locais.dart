import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time_flutter_app/core/contexts/global.dart';
import 'package:world_time_flutter_app/core/contexts/home.dart';
import 'package:world_time_flutter_app/core/contexts/locais.dart';
import 'package:world_time_flutter_app/core/models/continente.dart';
import 'package:world_time_flutter_app/core/models/pais.dart';
import 'package:world_time_flutter_app/core/services/worldtime_service.dart';
import 'package:world_time_flutter_app/core/utils/normalizar_string.dart';
import 'package:world_time_flutter_app/shared/widgets/app_local.dart';

class ListaLocais extends StatelessWidget {
  final List<Pais> paises = WorldTimeService.paises();

  void atualizarHorario(
    int indice,
    WorldTimeService worldTimeService,
    BuildContext context,
  ) async {
    Provider.of<GlobalContext>(context, listen: false)
        .setLoading(true, context);
    await worldTimeService.getTimezone(context);
    Provider.of<GlobalContext>(context, listen: false)
        .setLoading(false, context);
    Provider.of<HomeContext>(context, listen: false).pais =
        worldTimeService.pais;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final Continente continenteSelecionado =
        context.watch<LocaisContext>().continenteSelecionado;
    final Pais paisSelecionado = context.watch<HomeContext>().paisSelecionado;

    List<Pais> locaisFiltrados;
    locaisFiltrados = this
        .paises
        .where((local) => local.localizacao != paisSelecionado.localizacao)
        .toList();

    if (continenteSelecionado != null) {
      locaisFiltrados = locaisFiltrados.fold([], (filtrados, local) {
        String paisNome = normalizarString(local.fusoHorario.toLowerCase());
        String continenteNome =
            normalizarString(continenteSelecionado.filtro.toLowerCase());

        List<String> filtros = continenteNome.split('|');

        bool paisEhFiltrado = false;
        filtros.forEach((filtro) {
          paisEhFiltrado = paisNome.contains(filtro);

          if (paisEhFiltrado) {
            filtrados.add(local);
          }
        });
        return filtrados;
      });
    }

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: 60, top: 60),
            child: ListView.builder(
              itemCount: locaisFiltrados.length,
              itemBuilder: (context, indice) => Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: AppLocal(
                  local: locaisFiltrados.elementAt(indice),
                  indice: indice,
                  handleTap: (indiceClicado) {
                    this.atualizarHorario(
                      indiceClicado,
                      WorldTimeService(pais: locaisFiltrados[indice]),
                      context,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
