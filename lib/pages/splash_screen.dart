import 'package:flutter/material.dart';
import 'package:my_cash_mobile/pages/onboarding_page.dart';
import 'package:my_cash_mobile/pages/sign_up_page.dart';
import 'package:my_cash_mobile/pages/test.dart';
import 'package:onboarding/onboarding.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, "/login");
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 300,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/logo/logo.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
