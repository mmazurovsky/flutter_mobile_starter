import 'package:flutter/widgets.dart';

import 'navigation_tab.dart';

class CurrentTabChangeNotifier extends ChangeNotifier {
  NavigationTab _navigationTab;
  CurrentTabChangeNotifier(this._navigationTab);

  NavigationTab get currentTab => _navigationTab;

  void changeCurrentTab(NavigationTab newTab) {
    _navigationTab = newTab;
    notifyListeners();
  }
}
