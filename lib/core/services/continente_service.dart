import 'package:world_time_flutter_app/core/models/continente.dart';

class ContinenteService {
  static List<Continente> continentes() {
    return [
      Continente(nome: 'América', filtro: 'America', icone: 'america.png'),
      Continente(nome: 'Ásia', filtro: 'Asia|Australia', icone: 'asia.png'),
      Continente(nome: 'Africa', filtro: 'Africa', icone: 'africa.png'),
      Continente(nome: 'Europa', filtro: 'Europe', icone: 'europe.png'),
    ];
  }
}
