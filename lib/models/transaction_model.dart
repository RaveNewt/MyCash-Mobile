import 'package:my_cash_mobile/models/user_model.dart';

class TransactionModel {
  int? userid;
  int? amount;
  int? total_amount;

  TransactionModel({
    this.amount,
    this.userid,
    this.total_amount,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    userid = json['userID'];
    amount = json['amount'];
    total_amount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userid,
      'amount': amount,
      'total_amount': total_amount,
    };
  }
}
