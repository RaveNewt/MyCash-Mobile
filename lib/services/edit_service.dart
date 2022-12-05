import 'dart:convert';
import 'dart:io';

import 'package:my_cash_mobile/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://10.0.2.2:3000';
  // String baseUrl = 'https://reqres.in';

  Future<UserModel> edit({
    int? id,
    String? fullname,
    String? age,
    String? phonenumber,
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/user/$id';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'fullname': fullname,
      'age': age,
      'phonenumber': phonenumber,
      'email': email,
      'password': password,
    });

    http.Response response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data);

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }
}
