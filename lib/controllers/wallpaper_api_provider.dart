import 'package:flutter/cupertino.dart';
import 'helpers/api_helper.dart';

class APIControllers extends ChangeNotifier {
  List data = [];
  List favrite = [];

  bool fav_icon = false;

  APIControllers() {
    search();
  }

  search({String val = "animal"}) async {
    data = await APIHelper.apiHelper.getWallpeper(wall: val) ?? [];
    notifyListeners();
  }

  addfav({required String fav}) {
    fav_icon = !fav_icon;
    favrite.add(fav);
    print("==============${fav}==================");
    notifyListeners();
  }
}
