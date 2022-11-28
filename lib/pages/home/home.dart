import 'package:flutter/material.dart';
import 'package:my_cash_mobile/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
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
                "Tito Alexta",
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
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
                Text("Rp. 1.000.000",
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
                          'Saving',
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Header(), Card()],
        ),
      )),
    );
  }
}
