import 'package:flutter/material.dart';
import 'package:my_cash_mobile/theme.dart';
import 'package:my_cash_mobile/widget/loading_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isLoading = false;
  Widget imageIllustration() {
    return Center(
      heightFactor: 1,
      child: Container(
        margin: EdgeInsets.only(top: 70),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/logo/logo-2.png',
            ),
          ),
        ),
      ),
    );
  }

  Widget nameInput() {
    return Container(
        margin: EdgeInsets.only(top: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email Address",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            TextField(
              cursorColor: primaryColor,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  gapPadding: 16,
                ),
                hintText: "My Cash",
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

  Widget emailInput() {
    return Container(
        margin: EdgeInsets.only(top: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email Address",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            TextField(
              cursorColor: primaryColor,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  gapPadding: 16,
                ),
                hintText: "MyCash@gmail.com",
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

  Widget passwordInput() {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            TextField(
              cursorColor: primaryColor,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  gapPadding: 16,
                ),
                hintText: "********",
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

  Widget signUpButton() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
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
          'Sign Up',
          style: primaryTextStyle.copyWith(
              fontSize: 16, fontWeight: medium, color: bglight),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageIllustration(),
                SizedBox(
                  height: 47,
                ),
                Text("Register Yourself",
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    )),
                nameInput(),
                emailInput(),
                passwordInput(),
                isLoading ? LoadingButton() : signUpButton(),
              ],
            )),
      ),
    );
  }
}
