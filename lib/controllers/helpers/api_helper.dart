import 'dart:convert';
import 'package:http/http.dart' as http;

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  Future<List?> getWallpeper({String wall = "nature"}) async {
    String wallpeperApi =
        "https://pixabay.com/api/?key=38396545-4199a1b3068d3f3f3227603e8&q=$wall";

    http.Response response = await http.get(
      Uri.parse(wallpeperApi),
    );

    if (response.statusCode == 200) {
      print(
          "===================${response.statusCode}=========================");
      var data = jsonDecode(response.body);

      List allData = data['hits'];
      return allData;
    }
  }
}
