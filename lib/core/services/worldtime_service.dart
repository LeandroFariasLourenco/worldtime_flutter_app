import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart";
import "dart:convert";
import 'package:intl/intl.dart';
import 'package:world_time_flutter_app/core/models/pais.dart';

class WorldTimeService {
  Pais pais;
  Uri _endpoint;

  WorldTimeService({this.pais}) {
    this._endpoint = Uri.http(
      'api.timezonedb.com',
      '/v2.1/get-time-zone',
      {
        'key': 'IFAVAJVH8T3Y',
        'by': 'zone',
        'zone': this.pais.fusoHorario,
        'format': 'json',
      },
    );
  }

  void isDateDaytime(DateTime date) {
    this.pais.ehDia = date.hour >= 6 && date.hour <= 18 ? true : false;
  }

  Future<void> getTimezone(BuildContext context) async {
    try {
      Response response;
      response = await get(this._endpoint);
      Map timezone = jsonDecode(response.body);

      DateTime currentTime = DateTime.parse(timezone['formatted']);

      this.isDateDaytime(currentTime);
      this.pais.tempo = DateFormat.jm().format(currentTime);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Ocorreu um erro. O local mudou para sua localização atual.'),
        ),
      );
      this.pais.localizacao = 'São Paulo';
      this.pais.bandeira = 'brazil.png';
      this.pais.tempo = DateFormat.jm().format(DateTime.now());
      this.isDateDaytime(DateTime.now());
    }
  }

  static List<Pais> paises() {
    List<Pais> todosPaises = [
      Pais(
          fusoHorario: 'Asia/Jakarta',
          localizacao: 'Jakarta',
          bandeira: 'indonesia.png'),
      Pais(
          fusoHorario: 'Asia/Seoul',
          localizacao: 'Seoul',
          bandeira: 'south_korea.png'),
      Pais(
          fusoHorario: 'Africa/Cairo',
          localizacao: 'Cairo',
          bandeira: 'egypt.png'),
      Pais(
          fusoHorario: 'Europe/Madrid',
          localizacao: 'Madri',
          bandeira: 'spain.jpg'),
      Pais(
          fusoHorario: 'Africa/Ceuta',
          localizacao: 'Ceuta',
          bandeira: 'spain.jpg'),
      Pais(
          fusoHorario: 'Atlantic/Canary',
          localizacao: 'Ilhas Canárias',
          bandeira: 'spain.jpg'),
      Pais(
          fusoHorario: 'Europe/Ljubljana',
          localizacao: 'Ljubljana',
          bandeira: 'slovenia.png'),
      Pais(
          fusoHorario: 'Africa/Nairobi',
          localizacao: 'Nairobi',
          bandeira: 'kenya.png'),
      Pais(
          fusoHorario: 'America/Chicago',
          localizacao: 'Chicago',
          bandeira: 'usa.png'),
      Pais(
          fusoHorario: 'America/New_York',
          localizacao: 'Nova York',
          bandeira: 'usa.png'),
      Pais(
          fusoHorario: 'America/Los_Angeles',
          localizacao: 'Los Angeles',
          bandeira: 'usa.png'),
      Pais(
          fusoHorario: 'America/Indiana/Indianapolis',
          localizacao: 'Los Angeles',
          bandeira: 'usa.png'),
      Pais(
          fusoHorario: 'Europe/London',
          localizacao: 'Londres',
          bandeira: 'uk.png'),
      Pais(
          fusoHorario: 'Europe/Moscow',
          localizacao: 'Moscow',
          bandeira: 'russia.jpg'),
      Pais(
          fusoHorario: 'Europe/Kaliningrad',
          localizacao: 'Kaliningrado',
          bandeira: 'russia.jpg'),
      Pais(
          fusoHorario: 'Europe/Ukraine',
          localizacao: 'Kiev',
          bandeira: 'ukraine.png'),
      Pais(
          fusoHorario: 'Europe/Athens',
          localizacao: 'Athenas',
          bandeira: 'greece.png'),
      Pais(
          fusoHorario: 'Europe/Berlin',
          localizacao: 'Berlin',
          bandeira: 'germany.png'),
      Pais(
          fusoHorario: 'Europe/Copenhagen',
          localizacao: 'Copenhague',
          bandeira: 'denmark.png'),
      Pais(
          fusoHorario: 'Europe/Dublin',
          localizacao: 'Dublin',
          bandeira: 'ireland.png'),
      Pais(
          fusoHorario: 'Europe/Rome',
          localizacao: 'Roma',
          bandeira: 'italy.jpg'),
      Pais(
          fusoHorario: 'America/Tegucigalpa',
          localizacao: 'Tegucigalpa',
          bandeira: 'honduras.jpg'),
      Pais(
          fusoHorario: 'Africa/Johannesburg',
          localizacao: 'Joanesburgo',
          bandeira: 'south_africa.png'),
      Pais(
          fusoHorario: 'Asia/Qatar',
          localizacao: 'Qatar',
          bandeira: 'qatar.png'),
      Pais(
          fusoHorario: 'America/Mexico_City',
          localizacao: 'Cidade do méxico',
          bandeira: 'mexico.png'),
      Pais(
          fusoHorario: 'Asia/Jerusalem',
          localizacao: 'Jerusalém',
          bandeira: 'israel.png'),
      Pais(
          fusoHorario: 'Europe/Paris',
          localizacao: 'Paris',
          bandeira: 'france.png'),
      Pais(
          fusoHorario: 'America/Costa_Rica',
          localizacao: 'Costa Rica',
          bandeira: 'costa_rica.png'),
      Pais(
          fusoHorario: 'Asia/Shanghai',
          localizacao: 'Xangai',
          bandeira: 'china.png'),
      Pais(
          fusoHorario: 'America/Argentina/Buenos_Aires',
          localizacao: 'Buenos Aires',
          bandeira: 'argentina.png'),
      Pais(
          fusoHorario: 'Australia/Sydney',
          localizacao: 'Sidnei',
          bandeira: 'australia.png'),
      Pais(
          fusoHorario: 'America/Sao_Paulo',
          localizacao: 'São Paulo',
          bandeira: 'brazil.png'),
      Pais(
          fusoHorario: 'America/Recife',
          localizacao: 'Recife',
          bandeira: 'brazil.png'),
      Pais(
          fusoHorario: 'Europe/Tirane',
          localizacao: 'Albânia',
          bandeira: 'albania.png'),
      Pais(
          fusoHorario: 'America/Campo_Grande',
          localizacao: 'Campo Grande',
          bandeira: 'brazil.png'),
      Pais(
          fusoHorario: 'Africa/Ouagadougou',
          localizacao: 'Burkina Faso',
          bandeira: 'burkina_faso.png'),
      Pais(
          fusoHorario: 'Asia/Yerevan',
          localizacao: 'Armênia',
          bandeira: 'armenia.jpg'),
      Pais(
          fusoHorario: 'Europe/Sarajevo',
          localizacao: 'Sarajevo',
          bandeira: 'bosnia.png'),
      Pais(
          fusoHorario: 'Europe/Zagreb',
          localizacao: 'Zagrebe',
          bandeira: 'croatia.png'),
      Pais(
          fusoHorario: 'America/Rio_Branco',
          localizacao: 'Rio Branco',
          bandeira: 'brazil.png'),
      Pais(
          fusoHorario: 'Asia/Phnom_Penh',
          localizacao: 'Camboja',
          bandeira: 'Cambodia.png'),
      Pais(
          fusoHorario: 'America/Manaus',
          localizacao: 'Santarem',
          bandeira: 'brazil.png'),
      Pais(
          fusoHorario: 'America/Santiago',
          localizacao: 'Santiago',
          bandeira: 'chile.png'),
      Pais(
          fusoHorario: 'America/Manaus',
          localizacao: 'Santarem',
          bandeira: 'brazil.png'),
    ];
    return [...todosPaises];
  }
}
