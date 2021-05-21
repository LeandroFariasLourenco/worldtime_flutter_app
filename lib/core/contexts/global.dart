import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GlobalContext extends ChangeNotifier {
  bool isLoading;

  GlobalContext() {
    this.isLoading = false;
  }

  setLoading(bool isLoading, BuildContext context) {
    this.isLoading = isLoading;

    if (isLoading) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('Estamos carregando...'),
          content: Container(
            child: SpinKitRipple(
              size: 85.0,
              color: Colors.blue[500],
            ),
          ),
        ),
      );
    } else {
      Navigator.of(context, rootNavigator: true).pop();
    }

    notifyListeners();
  }
}
