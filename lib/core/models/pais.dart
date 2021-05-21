import 'package:world_time_flutter_app/shared/classes/autocomplete_entity.dart';

class Pais extends AutocompleteEntity {
  String fusoHorario;
  String localizacao;
  String bandeira;
  String tempo;

  bool ehDia;

  Pais({this.fusoHorario, this.localizacao, this.bandeira});

  @override
  Map<String, dynamic> toMap() {
    return {
      'timezone': fusoHorario,
      'location': localizacao,
      'flag': bandeira,
    };
  }
}
