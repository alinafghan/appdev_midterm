import 'dart:convert';
import 'dart:io';
import 'package:appdev_midterm/models/item.dart';
import 'package:http/http.dart' as http;

class ItemProvider {
  List<Item> itemList = [];

  Future<void> getItems() async {
    var url = 'https://api.sampleapis.com/avatar/characters';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        itemList = data.map((json) => Item.fromJson(json)).toList();
        // this works if its [{},{},{}] etc etc otherwise
        // Map<String, dynamic> dataResponse = json.decode(response.body);
        // List<dynamic> listData = dataResponse['items'];
        // itemList = data.map((json) => Item.fromJson(json)).toList();
      }
    } on SocketException {
      throw Exception('Please connect your wifi');
    } catch (e) {
      throw Exception('$e');
    }
  }
}
