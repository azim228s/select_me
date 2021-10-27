import 'package:flutter/material.dart';
import 'package:select_me/api/local_signature_api.dart';

import '../../../app_colors.dart';

class DocumentsScreen extends StatefulWidget {
  final bool isMerchant;

  const DocumentsScreen({Key? key, required this.isMerchant}) : super(key: key);

  @override
  _DocumentsScreenState createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  List<bool> signs = [
    false,
    true,
    true,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[AppColors.MONO_VIOLET, AppColors.PRIMARY_ORANGE],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Scaffold(
      backgroundColor: AppColors.MONO_WHITE,
      appBar: AppBar(
        leading: widget.isMerchant
            ? null
            : GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.PRIMARY_ORANGE,
                ),
              ),
        backgroundColor: AppColors.MONO_WHITE,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          widget.isMerchant ? "Documents" : "Documents related to 'Apple'",
          style: TextStyle(
            foreground: Paint()..shader = linearGradient,
            fontSize: widget.isMerchant ? 36 : 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            buildProductCard(
              image: "assets/images/document.png",
              title: 'Contract with \nTechnodom',
              isSigned: signs[0],
              index: 0,
            ),
            buildProductCard(
              image: "assets/images/document.png",
              title: 'Contract with \nTechnodom',
              isSigned: signs[1],
              index: 1,
            ),
            buildProductCard(
              image: "assets/images/document.png",
              title: 'Contract with \nTechnodom',
              isSigned: signs[2],
              index: 2,
            ),
            buildProductCard(
              image: "assets/images/document.png",
              title: 'Contract with \nTechnodom',
              isSigned: signs[3],
              index: 3,
            ),
            buildProductCard(
              image: "assets/images/document.png",
              title: 'Contract with \nTechnodom',
              isSigned: signs[4],
              index: 4,
            ),
            buildProductCard(
              image: "assets/images/document.png",
              title: 'Contract with \nTechnodom',
              isSigned: signs[5],
              index: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductCard({
    required String image,
    required String title,
    required bool isSigned,
    required int index,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 18, left: 16, right: 16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 10,
        shadowColor: Colors.black,
        color: Colors.white,
        child: Container(
          height: 131,
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32), topLeft: Radius.circular(32))),
                  height: 131,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.MONO_BLACK,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      isSigned
                          ? Container(
                              child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: AppColors.MONO_BLUE_DARK,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: AppColors.MONO_GREY_DARK,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: AppColors.MONO_BLUE_DARK,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        color: AppColors.MONO_WHITE,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: AppColors.MONO_BLUE_DARK,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: AppColors.MONO_GREY_DARK,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ))
                          : Container(
                              height: 36,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Spacer(),
                                  InkWell(
                                    radius: 32,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: AppColors.MONO_BLUE_DARK,
                                        borderRadius: BorderRadius.all(Radius.circular(32)),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                                        child: Center(
                                          child: Text(
                                            'Sign',
                                            style: TextStyle(
                                              color: AppColors.MONO_WHITE,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () async {
                                      final isAuthenticated = await LocalAuthApi.authenticate();

                                      if (isAuthenticated) {
                                        setState(() {
                                          signs[index] = true;
                                        });
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
