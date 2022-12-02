import 'package:flutter/material.dart';
import 'package:my_cash_mobile/pages/home/article.dart';
import 'package:my_cash_mobile/pages/home/home.dart';
import 'package:my_cash_mobile/pages/home/main_page.dart';
import 'package:my_cash_mobile/pages/home/profile.dart';
import 'package:my_cash_mobile/pages/home/statistic.dart';
import 'package:my_cash_mobile/pages/login_page.dart';
import 'package:my_cash_mobile/pages/onboarding_page.dart';
import 'package:my_cash_mobile/pages/sign_up_page.dart';
import 'package:my_cash_mobile/pages/splash_screen.dart';
import 'package:my_cash_mobile/providers/auth_provider.dart';
import 'package:my_cash_mobile/providers/page_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Cash',
        routes: {
          '/': (context) => SplashPage(),
          '/login': (context) => LoginPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
          '/edit-profile': (context) => ProfilePage(),
          '/cart': (context) => ArticlePage(),
          '/checkout': (context) => StatisticPage(),
          '/checkout-success': (context) => ProfilePage(),
        },
        // home: HomePage(),
      ),
    );
  }
}
