import 'package:flutter/material.dart';
import 'package:my_cash_mobile/theme.dart';

class onboarding_page extends StatefulWidget {
  const onboarding_page({super.key});

  @override
  State<onboarding_page> createState() => _onboarding_pageState();
}

class _onboarding_pageState extends State<onboarding_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/illustration/login.png',
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  'Welcome to MyCash',
                  style: primaryTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'your financial support',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
