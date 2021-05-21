import 'package:flutter/cupertino.dart';
import 'package:world_time_flutter_app/core/models/pais.dart';

class HomeContext extends ChangeNotifier {
  Pais paisSelecionado;

  set pais(Pais paisSelecionado) {
    this.paisSelecionado = paisSelecionado;
    notifyListeners();
  }
}
