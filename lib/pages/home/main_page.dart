import 'package:flutter/material.dart';
import 'package:my_cash_mobile/models/user_model.dart';
import 'package:my_cash_mobile/pages/home/article.dart';
import 'package:my_cash_mobile/pages/home/home.dart';
import 'package:my_cash_mobile/pages/home/profile.dart';
import 'package:my_cash_mobile/pages/home/statistic.dart';
import 'package:my_cash_mobile/providers/auth_provider.dart';
import 'package:my_cash_mobile/providers/page_provider.dart';
import 'package:my_cash_mobile/providers/transaction_provider.dart';
import 'package:my_cash_mobile/theme.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

TextEditingController amountController = TextEditingController(text: '');
bool isLoading = false;
bool isIncome = true;

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    print(user.id);

    changeIncome() async {
      setState(() {
        isIncome = true;
        print(isIncome);
      });
      Navigator.pushNamed(context, '/main');
    }

    changeExpenses() async {
      setState(() {
        isIncome = false;
        print(isIncome);
      });
      Navigator.pushNamed(context, '/main');
    }

    handleIncome() async {
      setState(() {
        isLoading = true;
      });

      if (await transactionProvider.income(
          amount: int.parse(amountController.text), userid: user.id)) {
        Navigator.pushNamed(context, '/main');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: dangerColor,
            content: Text(
              'Gagal Register!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    handleExpenses() async {
      setState(() {
        isLoading = true;
      });

      if (await transactionProvider.expense(
          amount: int.parse(amountController.text), userid: user.id)) {
        Navigator.pushNamed(context, '/main');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: dangerColor,
            content: Text(
              'Gagal Register!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget amountInput() {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          margin: EdgeInsets.only(top: 24),
          child: Column(
            children: [
              Text(
                "Amount",
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              TextField(
                controller: amountController,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    gapPadding: 16,
                  ),
                  hintText: "Rp: 100.000",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: greyColor,
                    ),
                  ),
                ),
              ),
            ],
          ));
    }

    Widget submitButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: isIncome ? handleIncome : handleExpenses,
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Submit',
            style: primaryTextStyle.copyWith(
                fontSize: 16, fontWeight: medium, color: bglight),
          ),
        ),
      );
    }

    Widget category() {
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

    Widget modalBottomSheet() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 8,
        ),
        margin: EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: category()),
            SizedBox(
              height: 24,
            ),
            isIncome
                ? Text('Income',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ))
                : Text('Expenses',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    )),
            SizedBox(
              height: 12,
            ),
            amountInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget addButton() {
      return FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return modalBottomSheet();
              });
        },
        elevation: 8,
        backgroundColor: primaryColor,
        child: Image.asset(
          'assets/icon/ic_add.png',
          width: 20,
          color: bglight,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              // color: blackColor,
            ),
            backgroundColor: bglight,
            currentIndex: pageProvider.currentIndex,
            onTap: (value) {
              print(value);
              pageProvider.currentIndex = value;
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/icon/ic_home.png',
                    width: 24,
                    color: pageProvider.currentIndex == 0
                        ? primaryColor
                        : Color(0xff808191),
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/icon/ic_chart.png',
                    width: 24,
                    color: pageProvider.currentIndex == 1
                        ? primaryColor
                        : Color(0xff808191),
                  ),
                ),
                label: 'statictic',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/icon/ic_article.png',
                    width: 24,
                    color: pageProvider.currentIndex == 2
                        ? primaryColor
                        : Color(0xff808191),
                  ),
                ),
                label: 'article',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/icon/ic_profile.png',
                    width: 24,
                    color: pageProvider.currentIndex == 3
                        ? primaryColor
                        : Color(0xff808191),
                  ),
                ),
                label: 'profile',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomePage();
        // break;
        case 1:
          return StatisticPage();
        // break;
        case 2:
          return ArticlePage();
        // break;
        case 3:
          return ProfilePage();
        // break;

        default:
          return HomePage();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: pageProvider.currentIndex == 0 ? navColor : navColor,
      floatingActionButton: addButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
