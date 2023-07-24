import 'package:flutter/cupertino.dart';
import 'helpers/api_helper.dart';

class APIControllers extends ChangeNotifier {
  List data = [];

  APIControllers() {
    search();
  }

  search({String val = "animal"}) async {
    data = await APIHelper.apiHelper.getWallpeper(wall: val) ?? [];
    notifyListeners();
  }
}
