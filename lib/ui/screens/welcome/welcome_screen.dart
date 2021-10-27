import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:select_me/app_colors.dart';
import 'package:select_me/ui/components/custom_button.dart';
import 'package:select_me/ui/screens/login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.MONO_WHITE,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Image.asset("assets/images/logo.png"),
            Spacer(),
            Text(
              "Effective sales",
              style: TextStyle(
                color: AppColors.PRIMARY_ORANGE,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "We make innovation, that will help to merchants and marketplace connect between each other easier",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.PRIMARY_ORANGE,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            CustomButton(
              title: "Merchant",
              onClick: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => LoginScreen(isMerchant: true)));
              },
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => LoginScreen(isMerchant: false)));
              },
              child: Text(
                "Marketplace",
                style: TextStyle(color: AppColors.PRIMARY_ORANGE, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
