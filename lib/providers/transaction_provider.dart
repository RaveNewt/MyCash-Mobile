import 'package:flutter/material.dart';
import 'package:my_cash_mobile/models/transaction_model.dart';
import 'package:my_cash_mobile/models/user_model.dart';
import 'package:my_cash_mobile/services/auth_service.dart';
import 'package:my_cash_mobile/services/transaction_service.dart';

class TransactionProvider with ChangeNotifier {
  late TransactionModel _transaction;

  TransactionModel get transaction => _transaction;

  set user(UserModel user) {
    _transaction = transaction;
    notifyListeners();
  }

  Future<bool> income({
    int? amount,
    int? userid,
  }) async {
    try {
      TransactionModel transaction = await TransactionService().income(
        amount: amount,
        userid: userid,
      );
      print(amount);

      _transaction = transaction as TransactionModel;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
