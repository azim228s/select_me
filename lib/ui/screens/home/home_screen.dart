import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.MONO_BLUE_DARK,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: 16, left: 32, right: 32, top: MediaQuery.of(context).padding.top + 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Sales & Analysis",
                          style: TextStyle(
                            color: AppColors.MONO_WHITE,
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      "assets/images/graph.png",
                      height: 270,
                      width: 270,
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            // top: MediaQuery.of(context).size.height / 2,
            bottom: 0,
            left: 32,
            right: 32,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    "My sales",
                    style: TextStyle(
                      color: AppColors.MONO_BLUE_DARK,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mon, 17 July",
                        style: TextStyle(
                          color: AppColors.MONO_BLUE_DARK.withOpacity(0.5),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "-\$ 205. 40",
                        style: TextStyle(
                          color: AppColors.MONO_BLUE_DARK.withOpacity(0.5),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  buildColumn("Laptops", "Nak market", "-\$ 205. 40", "assets/icons/laptop.svg"),
                  buildColumn("Laptops", "Nak market", "+\$ 424. 40", "assets/icons/phones.svg"),
                  buildColumn("Laptops", "Nak market", "-\$ 140. 40", "assets/icons/laptop2.svg"),
                  buildColumn("Laptops", "Nak market", "+\$ 523. 40", "assets/icons/laptop.svg"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Column buildColumn(String title, String subtitle, String price, String icon) {
    return Column(
      children: [
        Row(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: SvgPicture.asset(icon)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.MONO_BLUE_DARK,
                        fontWeight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 6,
                  ),
                  Text(subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.MONO_BLUE_DARK.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
            ),
            Text(
              price,
              style: TextStyle(
                color: price.characters.first == "+" ? AppColors.MONO_GREEN : AppColors.MONO_RED,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Divider()
      ],
    );
  }
}
