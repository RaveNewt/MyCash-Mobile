import 'package:my_cash_mobile/models/user_model.dart';

class TransactionModel {
  int? userid;
  int? amount;

  TransactionModel({
    this.amount,
    this.userid,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    userid = json['userID'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userid,
      'amount': amount,
    };
  }
}
