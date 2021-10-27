import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:select_me/ui/components/custom_button.dart';
import 'package:select_me/ui/screens/bottom_nav_bar/bottom_nav_bar_marketplace.dart';
import 'package:select_me/ui/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';

import '../../../app_colors.dart';

class LoginScreen extends StatefulWidget {
  final bool isMerchant;
  const LoginScreen({Key? key, required this.isMerchant}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.MONO_WHITE,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.MONO_VIOLET.withOpacity(0.6),
                  AppColors.MONO_AVERAGE,
                  AppColors.MONO_AVERAGE2,
                  AppColors.PRIMARY_ORANGE,
                ],
                stops: [0.05, 0.3, 0.5, 0.7],
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            right: 0,
            child: Container(
              width: 300,
              child: Image.asset("assets/images/logo_2.png"),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(32),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: AppColors.MONO_WHITE),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Padding(
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 32),
                      ),
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: SvgPicture.asset("assets/icons/email_ic.svg",
                          height: 5, width: 5, fit: BoxFit.scaleDown),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        child: Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 32),
                      ),
                    ],
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: SvgPicture.asset("assets/icons/lock_ic.svg",
                          height: 5, width: 5, fit: BoxFit.scaleDown),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Forget password?",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.PRIMARY_ORANGE),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  CustomButton(
                      title: "Login",
                      onClick: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => widget.isMerchant
                                    ? BottomNavBarScreen()
                                    : BottomNavBarScreenMarket()));
                      }),
                  Text(
                    "Already have account?",
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.PRIMARY_ORANGE),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
