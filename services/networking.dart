import 'package:http/http.dart';
import 'dart:convert';
class Network{
  Network(this.url);
  final String url;
  Future getData() async {
    Uri uri = Uri.parse(url);
    Response response = await get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);
    }
    else {
      print(response.statusCode);
    }
  }
}