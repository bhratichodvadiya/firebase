import 'dart:convert';
import 'package:demo/model/api.dart';
import 'package:http/http.dart' as http;


class Statservice {
  Future<Welcome> fetchdata()async{
  final Response = await http.get(Uri.parse('https://dummyjson.com/products'));
  if (Response.statusCode == 200) {
    var data = jsonDecode(Response.body.toString());
    return Welcome.fromJson(data);
  }else{
 throw Exception('Error');
  }
}
}