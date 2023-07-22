import 'dart:convert';
import 'package:http/http.dart' as http;

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  Future<List?> getWallpeper({String query = "nature"}) async {
    String wallpeperApi =
        "https://pixabay.com/api/?key=38396545-4199a1b3068d3f3f3227603e8&q=$query";

    http.Response response = await http.get(
      Uri.parse(wallpeperApi),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List allData = data['hits'];
      return allData;
    }
  }
}
