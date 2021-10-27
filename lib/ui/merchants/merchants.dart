import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:select_me/ui/screens/documents/documents_screen.dart';

import '../../app_colors.dart';

class MerchantScreen extends StatefulWidget {
  const MerchantScreen({Key? key}) : super(key: key);

  @override
  _MerchantScreenState createState() => _MerchantScreenState();
}

class _MerchantScreenState extends State<MerchantScreen> {
  List<String> merchants = [
    "HP",
    "Apple",
    "Asus",
    "Lenovo",
    "AIRBA",
    "NAK",
    "Samsung",
    "Acer",
    "Xiaomi",
  ];

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[AppColors.MONO_VIOLET, AppColors.PRIMARY_ORANGE],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Scaffold(
      backgroundColor: AppColors.MONO_WHITE,
      appBar: AppBar(
        backgroundColor: AppColors.MONO_WHITE,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "List of Merchants",
          style: TextStyle(
            foreground: Paint()..shader = linearGradient,
            fontSize: 36,
          ),
        ),
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: merchants.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 8, left: 32, right: 32, top: 8),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 0.5), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: AppColors.MONO_WHITE,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                splashColor: AppColors.PRIMARY_ORANGE,
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => DocumentsScreen(
                                isMerchant: false,
                              )));
                },
                child: ListTile(
                  title: Text(
                    merchants[index],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: Text(
                    "See docs",
                    style: TextStyle(
                      color: AppColors.PRIMARY_ORANGE,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
