import 'package:flutter/material.dart';
import 'package:world_time_flutter_app/core/utils/normalizar_string.dart';

class AppAutocomplete extends StatelessWidget {
  final List<dynamic> sugestoes;
  final String campoEntidade;
  final String mensagemSugestaoNaoEncontrada;
  final String placeholder;
  final Function onSelectHandler;
  // final Widget sugestaoPopupWidget;

  AppAutocomplete({
    this.sugestoes,
    this.campoEntidade,
    this.onSelectHandler,
    // this.sugestaoPopupWidget,
    this.mensagemSugestaoNaoEncontrada = "Sem sugestões...",
    this.placeholder = "Busca",
  });

  @override
  Widget build(BuildContext context) {
    return Autocomplete<dynamic>(
      fieldViewBuilder: (
        BuildContext context,
        TextEditingController fieldTextEditingController,
        FocusNode fieldFocusNode,
        VoidCallback onFieldSubmitted,
      ) =>
          Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 30.0, 0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60.0,
              child: Icon(
                Icons.search,
                size: 25.0,
              ),
            ),
            SizedBox(
              height: 60.0,
              width: 235.0,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 0.0),
                child: TextFormField(
                  controller: fieldTextEditingController,
                  focusNode: fieldFocusNode,
                  decoration: InputDecoration(hintText: this.placeholder),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      optionsViewBuilder: (
        BuildContext context,
        AutocompleteOnSelected<dynamic> onSelected,
        Iterable<dynamic> options,
      ) =>
          Align(
        alignment: Alignment.topLeft,
        child: Material(
          elevation: 15.0,
          child: Container(
            width: 280,
            height: 275,
            color: Colors.blue[500],
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: options.length,
              itemBuilder: (BuildContext context, int index) {
                final dynamic option = options.elementAt(index);
                Widget renderGesture(
                  String optionText,
                  bool dispararOnSelected,
                ) {
                  return GestureDetector(
                    onTap: () {
                      if (!dispararOnSelected) {
                        return;
                      }
                      onSelected(option);
                    },
                    child: Row(
                      children: [
                        (() {
                          if (option.runtimeType == String) {
                            return Container();
                          }
                          return Container(
                            width: 50.0,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/${option.bandeira}'),
                            ),
                          );
                        }()),
                        Container(
                          width: 210,
                          child: ListTile(
                            title: Text(
                              optionText,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                if (option.runtimeType == String) {
                  return renderGesture(option, false);
                }

                return renderGesture(option.get(this.campoEntidade), true);
              },
            ),
          ),
        ),
      ),
      onSelected: (dynamic entidadeSelecionada) {
        this.onSelectHandler(entidadeSelecionada);
      },
      displayStringForOption: (dynamic instanciaSugestao) {
        if (instanciaSugestao.runtimeType == String) {
          return instanciaSugestao;
        }
        return instanciaSugestao.get(this.campoEntidade);
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return [];
        }
        Iterable<dynamic> sugestoesEncontradas =
            this.sugestoes.where((dynamic sugestoes) {
          String sugestaoDigitada = normalizarString(
              sugestoes.get(this.campoEntidade).toString().toLowerCase());
          return sugestaoDigitada
              .contains(normalizarString(textEditingValue.text.toLowerCase()));
        });
        if (sugestoesEncontradas.length == 0) {
          return [this.mensagemSugestaoNaoEncontrada];
        }
        return sugestoesEncontradas;
      },
    );
  }
}
