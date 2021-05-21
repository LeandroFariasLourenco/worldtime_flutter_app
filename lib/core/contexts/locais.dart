import 'package:flutter/cupertino.dart';
import 'package:world_time_flutter_app/core/models/continente.dart';

class LocaisContext extends ChangeNotifier {
  bool drawerFiltroAberto;
  Continente continenteSelecionado;

  LocaisContext() {
    this.drawerFiltroAberto = false;
  }

  set filtroAberto(bool aberto) {
    this.drawerFiltroAberto = aberto;
    notifyListeners();
  }

  set continenteParaFiltro(Continente continente) {
    this.continenteSelecionado = continente;
    if (this.continenteSelecionado == null) {
      this.drawerFiltroAberto = false;
    }
    notifyListeners();
  }
}
