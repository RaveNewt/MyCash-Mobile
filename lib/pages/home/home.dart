import 'package:flutter/material.dart';
import 'package:my_cash_mobile/models/expense_model.dart';
import 'package:my_cash_mobile/models/transaction_model.dart';
import 'package:my_cash_mobile/models/user_model.dart';
import 'package:my_cash_mobile/providers/auth_provider.dart';
import 'package:my_cash_mobile/providers/data_provider.dart';
import 'package:my_cash_mobile/providers/transaction_provider.dart';
import 'package:my_cash_mobile/theme.dart';
import 'package:my_cash_mobile/widget/data_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  bool isIncome = true;

  @override
  void initState() {
    super.initState();
    getInit();
  }

  getInit() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    UserModel user = authProvider.user;
    await Provider.of<DataProvider>(context, listen: false)
        .getIncome(userid: user.id);
    await Provider.of<DataProvider>(context, listen: false)
        .getExpense(userid: user.id);
    // await Provider.of<TransactionProvider>(context, listen: false)
    //     .getSUM(userid: user.id);
  }

  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    DataProvider dataProvider = Provider.of<DataProvider>(context);
    // Provider.of<TransactionProvider>(context, listen: false)
    //     .getSUM(userid: user.id);
    // TransactionProvider transactionProvider =
    //     Provider.of<TransactionProvider>(context);
    // TransactionModel transactionModel = transactionProvider.transaction;
    List<TransactionModel> datas = dataProvider.datas;
    print(datas);
    changeIncome() async {
      await Provider.of<DataProvider>(context, listen: false)
          .getIncome(userid: user.id);
      setState(() {
        isIncome = true;
        print(isIncome);
      });
      Navigator.pushNamed(context, '/main');
    }

    changeExpenses() async {
      await Provider.of<DataProvider>(context, listen: false)
          .getExpense(userid: user.id);
      setState(() {
        isIncome = false;
        print(isIncome);
      });
      Navigator.pushNamed(context, '/main');
    }

    Widget Header() {
      return Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.only(right: 24, left: 24, top: 24, bottom: 16),
        decoration: BoxDecoration(
          color: bglight,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(
                  'assets/illustration/profile.png',
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "${user.fullname}",
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          Icon(
            Icons.notifications,
            color: blackColor,
          ),
        ]),
      );
    }

    Widget Card() {
      return SafeArea(
        child: Container(
            width: double.infinity,
            height: 170,
            margin: EdgeInsets.only(top: 24, left: 24, right: 24),
            padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 30,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total Balance",
                    style: primaryTextStyle.copyWith(
                        fontSize: 11, fontWeight: regular, color: bglight)),
                SizedBox(
                  height: 8,
                ),
                Text("100000",
                    style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                        color: primaryColor)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      margin: EdgeInsets.only(top: 32),
                      child: TextButton(
                        onPressed: (() => {
                              setState(() {
                                isLoading = true;
                              }),
                              Future.delayed(Duration(seconds: 2), () {
                                setState(() {
                                  isLoading = false;
                                });
                              })
                            }),
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Income',
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium, color: bglight),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: 100,
                      margin: EdgeInsets.only(top: 32),
                      child: TextButton(
                        onPressed: (() => {
                              setState(() {
                                isLoading = true;
                              }),
                              Future.delayed(Duration(seconds: 2), () {
                                setState(() {
                                  isLoading = false;
                                });
                              })
                            }),
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Expenses',
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium, color: bglight),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      );
    }

    Widget Category() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: Row(
          children: [
            SizedBox(
              width: defaultMargin,
            ),
            Container(
              width: 100,
              height: 40,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primaryColor,
              ),
              child: TextButton(
                onPressed: changeIncome,
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Income',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium, color: bglight),
                ),
              ),
            ),
            Container(
              width: 100,
              height: 40,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primaryColor,
              ),
              child: TextButton(
                onPressed: changeExpenses,
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Expenses',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium, color: bglight),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget Income() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children: dataProvider.datas
              .map(
                (data) => DataList(data),
              )
              .toList(),
        ),
      );
    }

    Widget Expense() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children: dataProvider.datas
              .map(
                (data) => DataList(data),
              )
              .toList(),
        ),
      );
    }

    return ListView(
      children: [
        Header(),
        Card(),
        Category(),
        isIncome ? Income() : Expense(),
      ],
    );
  }
}
