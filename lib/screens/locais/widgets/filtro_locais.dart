import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time_flutter_app/core/contexts/locais.dart';
import 'package:world_time_flutter_app/core/models/continente.dart';
import 'package:world_time_flutter_app/shared/widgets/app_listagem_filtros.dart';

class FiltroLocais extends StatefulWidget {
  @override
  _FiltroLocaisState createState() => _FiltroLocaisState();
}

class _FiltroLocaisState extends State<FiltroLocais> {
  bool filtroAberto;

  bool conteudoVisivel = false;
  double width = 0;

  @override
  void initState() {
    super.initState();
  }

  void animarFechamento() {
    setState(() {
      this.width = 0;
      this.conteudoVisivel = false;
    });
  }

  void fecharFiltros() {
    Provider.of<LocaisContext>(context, listen: false).filtroAberto = false;
  }

  @override
  Widget build(BuildContext context) {
    final int duracaoTransicao = 250;

    final double alturaDispositivo = MediaQuery.of(context).size.height;
    final double larguraDispositivo = MediaQuery.of(context).size.width;
    this.filtroAberto = context.watch<LocaisContext>().drawerFiltroAberto;

    if (this.filtroAberto) {
      setState(() {
        this.width = 300;
      });
    } else {
      this.animarFechamento();
    }

    if (this.width == 300) {
      Future.delayed(Duration(milliseconds: duracaoTransicao), () {
        if (!this.conteudoVisivel) {
          setState(() {
            this.conteudoVisivel = true;
          });
        }
      });
    }
    return Stack(
      children: [
        Positioned(
          right: 0,
          top: 0,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOutCubic,
            width: this.filtroAberto ? larguraDispositivo - this.width : 0,
            height: alturaDispositivo,
            child: GestureDetector(
              onTap: () {
                this.fecharFiltros();
              },
              child: Container(
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: AnimatedContainer(
            width: this.width,
            curve: Curves.decelerate,
            duration: Duration(milliseconds: duracaoTransicao),
            height: alturaDispositivo,
            color: Colors.white,
            child: Visibility(
              visible: this.conteudoVisivel,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 10, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Filtros', style: TextStyle(fontSize: 19)),
                          ElevatedButton(
                            onPressed: () => this.fecharFiltros(),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0,
                              onPrimary: Colors.black,
                            ),
                            child: Icon(Icons.close, size: 35),
                          ),
                        ],
                      ),
                    ),
                    AppListagemFiltros()
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
