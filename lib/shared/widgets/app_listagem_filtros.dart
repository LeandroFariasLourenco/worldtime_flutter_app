import 'package:flutter/material.dart';
import 'package:world_time_flutter_app/core/contexts/locais.dart';
import 'package:world_time_flutter_app/core/models/continente.dart';
import 'package:provider/provider.dart';
import 'package:world_time_flutter_app/core/services/continente_service.dart';

class AppListagemFiltros extends StatelessWidget {
  final List<Continente> continentes = ContinenteService.continentes();

  void filtrarPaisesPorContinente(
      Continente continenteSelecionado, BuildContext context) {
    Provider.of<LocaisContext>(context, listen: false).continenteParaFiltro =
        continenteSelecionado;
    Provider.of<LocaisContext>(context, listen: false).filtroAberto = false;
  }

  Widget renderFiltroCard({
    int indice,
    Continente continente,
    BuildContext context,
  }) {
    if (indice == this.continentes.length) {
      return GestureDetector(
        onTap: () {
          Provider.of<LocaisContext>(
            context,
            listen: false,
          ).continenteParaFiltro = null;
        },
        child: Card(
          color: Colors.white,
          child: ListTile(
            leading: Icon(Icons.remove_circle_outline),
            title: Text('Remover filtro'),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        this.filtrarPaisesPorContinente(
            this.continentes.elementAt(indice), context);
      },
      child: Card(
        color: this.continentes.elementAt(indice) == continente
            ? Colors.blue[300]
            : Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[200],
            backgroundImage: AssetImage(
                'assets/images/${this.continentes.elementAt(indice).icone}'),
          ),
          title: Text(this.continentes.elementAt(indice).nome),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Continente continenteSelecionado =
        context.watch<LocaisContext>().continenteSelecionado;

    return Expanded(
      child: ListView.builder(
        itemCount: continenteSelecionado != null
            ? this.continentes.length + 1
            : this.continentes.length,
        itemBuilder: (context, indice) {
          return this.renderFiltroCard(
            indice: indice,
            continente: continenteSelecionado,
            context: context,
          );
        },
      ),
    );
  }
}
