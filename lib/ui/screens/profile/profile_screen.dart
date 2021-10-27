import 'package:flutter/material.dart';
import 'package:select_me/app_colors.dart';
import 'package:select_me/ui/screens/welcome/welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  final bool isMerchant;

  const ProfileScreen({Key? key, required this.isMerchant}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[AppColors.MONO_VIOLET, AppColors.PRIMARY_ORANGE],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Scaffold(
      backgroundColor: AppColors.MONO_GREY,
      appBar: AppBar(
        backgroundColor: AppColors.MONO_GREY,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: TextStyle(
            foreground: Paint()..shader = linearGradient,
            fontSize: 36,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(right: 32, left: 32, bottom: 32, top: 16),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          child: Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width - 64,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.MONO_WHITE,
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50, bottom: 15),
                                    child: Text(
                                      widget.isMerchant ? "Apple CEO" : "Techodom",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.location_on_outlined),
                                      Text(
                                        "EXPO, Astana IT University",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          bottom: 0,
                          top: 50,
                        ),
                        Positioned(
                          top: 0,
                          child: Container(
                            width: 80,
                            height: 80,
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/avatar.png"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  buildRequestTablet(title: "Edit profile", onClick: () {}),
                  buildRequestTablet(
                      title: "Signature",
                      onClick: () {
                        // Navigator.push(
                        //     context, MaterialPageRoute(builder: (context) => LinkCardScreen()));
                      }),
                  buildRequestTablet(
                      title: "Marketplace list",
                      onClick: () {
                        // Navigator.push(
                        //     context, MaterialPageRoute(builder: (context) => PaymentScreen()));
                      }),
                  buildRequestTablet(title: "Cards", onClick: () {}),
                  buildRequestTablet(
                    title: "Logout",
                    onClick: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRequestTablet({required String title, required void Function() onClick}) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            tileColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 30),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: AppColors.MONO_BLACK,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.MONO_BLACK,
            ),
          ),
        ),
      ),
    );
  }
}
