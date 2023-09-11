import 'dart:convert';
import 'package:effective_mobile_test/model/hotel_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HotelController{

  final HotelModel _model = HotelModel();

  Future<String> getName() async{
    final response = await http.get(Uri.parse(_model.apiUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['name'];
    } else {
      throw Exception('Failed to fetch the rating');
    }
  }

  Future<List<String>> getImages() async{
    final response = await http.get(Uri.parse(_model.apiUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      List<dynamic> dynamicList = json['image_urls'];
      List<String> stringList = dynamicList.map((item) => item.toString()).toList();
      return stringList;
    } else {
      throw Exception('Failed to fetch the rating');
    }
  }

  Future<int> getRating() async{
    final response = await http.get(Uri.parse(_model.apiUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['rating'];
    } else {
      throw Exception('Failed to fetch the rating');
    }
  }
  Future<String> getAddress() async{
    final response = await http.get(Uri.parse(_model.apiUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['adress'];
    } else {
      throw Exception('Failed to fetch the address');
    }
  }

  Future<int> getMinimalPrice() async{
    final response = await http.get(Uri.parse(_model.apiUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['minimal_price'];
    } else {
      throw Exception('Failed to fetch the minimal price');
    }
  }

  Future<String> getForWhat() async{
    final response = await http.get(Uri.parse(_model.apiUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['price_for_it'];
    } else {
      throw Exception('Failed to fetch for what');
    }
  }
  Future<List<String>> getPeculiarities() async {
    final response = await http.get(Uri.parse(_model.apiUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List<dynamic> peculiaritiesJson = json['about_the_hotel']['peculiarities'];
      return List<String>.from(peculiaritiesJson);
    } else {
      throw Exception('Failed to fetch peculiarities');
    }
  }

  Future<String> getDescription() async{
    final response = await http.get(Uri.parse(_model.apiUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['about_the_hotel']['description'];
    } else {
      throw Exception('Failed to fetch peculiarities');
    }
  }
}