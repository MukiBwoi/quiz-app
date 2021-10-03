import 'package:flutter/cupertino.dart';

class MediaResponsive extends ChangeNotifier {
  double height = 0.0;
  double width = 0.0;
  bool isDesktop = false;

  void setSize(double h, double w) {
    height = h;
    width = w;
    notifyListeners();
  }
}
