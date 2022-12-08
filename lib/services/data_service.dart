import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_cash_mobile/models/transaction_model.dart';

class DataService {
  String baseUrl = 'http://10.0.2.2:3000';

  Future<List<TransactionModel>> getIncome({
    int? userid,
  }) async {
    var url = '$baseUrl/income/${userid}';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<TransactionModel> products = [];

      for (var item in data) {
        products.add(TransactionModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}
