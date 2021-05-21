import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time_flutter_app/core/contexts/global.dart';
import 'package:world_time_flutter_app/core/contexts/home.dart';
import 'package:world_time_flutter_app/core/contexts/locais.dart';
import 'package:world_time_flutter_app/core/models/pais.dart';
import 'package:world_time_flutter_app/core/services/worldtime_service.dart';
import 'package:world_time_flutter_app/screens/locais/widgets/filtro_locais.dart';
import 'package:world_time_flutter_app/screens/locais/widgets/icone_flutuante_continente.dart';
import 'package:world_time_flutter_app/screens/locais/widgets/lista_locais.dart';
import 'package:world_time_flutter_app/screens/locais/widgets/capital_selecionada.dart';
import 'package:world_time_flutter_app/screens/locais/widgets/locais_opcoes.dart';

class Locais extends StatefulWidget {
  @override
  _LocaisState createState() => _LocaisState();
}

class _LocaisState extends State<Locais> {
  @override
  void initState() {
    super.initState();
  }

  void retornarParaHome(WorldTimeService worldTimeService) async {
    Provider.of<GlobalContext>(context, listen: false)
        .setLoading(true, context);
    await worldTimeService.getTimezone(context);
    if (!mounted) {
      return;
    }
    Provider.of<GlobalContext>(context, listen: false)
        .setLoading(false, context);
    Provider.of<HomeContext>(context, listen: false).pais =
        worldTimeService.pais;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Text('Selecione um local'),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          ListaLocais(),
          Consumer<HomeContext>(
            builder: (context, homeContext, child) =>
                CapitalSelecionada(pais: homeContext.paisSelecionado),
          ),
          LocaisOpcoes(handleSelecaoBusca: this.retornarParaHome),
          FiltroLocais(),
          IconeFlutuanteContinente(),
        ],
      ),
    );
  }
}
