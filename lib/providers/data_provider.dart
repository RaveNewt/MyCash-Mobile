import 'package:flutter/material.dart';
import 'package:my_cash_mobile/models/transaction_model.dart';
import 'package:my_cash_mobile/services/data_service.dart';

class ProductProvider with ChangeNotifier {
  late List<TransactionModel> _datas = [];

  List<TransactionModel> get datas => _datas;

  set datas(List<TransactionModel> datas) {
    _datas = datas;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<TransactionModel> products = await DataService().getIncome();
      _datas = datas;
    } catch (e) {
      print(e);
    }
  }
}
