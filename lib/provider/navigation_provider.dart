import 'package:daily_caters/models/navigationbar.dart';
import 'package:flutter/material.dart';


class NavigationProvider extends ChangeNotifier {
  NavigationItem _navigationItem = NavigationItem.Home;

  NavigationItem get navigationItem => _navigationItem;

  void setNavigationItem(NavigationItem navigationItem) {
    _navigationItem = navigationItem;

    notifyListeners();
  }
}
