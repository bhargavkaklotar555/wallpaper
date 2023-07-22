import 'package:flutter/cupertino.dart';

import 'helpers/api_helper.dart';

class APIControllers extends ChangeNotifier {
  List data = [];

  APIControllers() {
    search();
  }

  search({String val = "nature"}) async {
    data = await APIHelper.apiHelper.getWallpeper(query: val) ?? [];
    notifyListeners();
  }
}
