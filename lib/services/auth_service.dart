import 'dart:convert';
import 'dart:io';

import 'package:my_cash_mobile/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://10.0.2.2:3000';

  Future<UserModel> register({
    String? fullname,
    String? age,
    String? phonenumber,
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/user/';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'fullname': fullname,
      'age': age,
      'phonenumber': phonenumber,
      'email': email,
      'password': password,
    });

    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(json.decode(response.body));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/user/';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
