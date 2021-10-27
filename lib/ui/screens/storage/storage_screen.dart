import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:select_me/app_colors.dart';

class StorageScreen extends StatefulWidget {
  final bool isMerchant;
  const StorageScreen({Key? key, required this.isMerchant}) : super(key: key);

  @override
  _StorageScreenState createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
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
          widget.isMerchant ? "Storage" : "Storage related to 'Apple'",
          style: TextStyle(
            foreground: Paint()..shader = linearGradient,
            fontSize: widget.isMerchant ? 36 : 28,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              TextField(
                cursorColor: AppColors.PRIMARY_ORANGE,
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/search_ic.svg",
                    height: 10,
                    width: 10,
                    fit: BoxFit.scaleDown,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.PRIMARY_ORANGE),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.PRIMARY_ORANGE),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.PRIMARY_ORANGE),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  focusColor: AppColors.PRIMARY_ORANGE,
                  hintText: 'Search',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Found 6 results",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.57),
                  itemBuilder: (context, index) {
                    StorageItem item = items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Container(
                        height: 300,
                        child: Stack(
                          alignment: AlignmentDirectional.topCenter,
                          children: [
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 150,
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 6,
                                      offset: Offset(0, 5), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.MONO_WHITE,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      "${item.count} items",
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: AppColors.MONO_BLUE,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 170,
                              padding: EdgeInsets.zero,
                              child: Image.asset(
                                item.asset,
                                height: 150,
                                width: 150,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  List<StorageItem> items = [
    StorageItem("Apple\niPad Air", 232, "assets/images/ipad.png"),
    StorageItem("Apple\nWatch", 455, "assets/images/watch.png"),
    StorageItem("Apple\nAirPods", 789, "assets/images/airpods.png"),
    StorageItem("Apple\niPhone", 157, "assets/images/iphone.png"),
    StorageItem("Apple\nBeats", 85, "assets/images/beats.png"),
    StorageItem("Apple\nBeats", 85, "assets/images/beats.png"),
  ];
}

class StorageItem {
  final String name;
  final int count;
  final String asset;

  StorageItem(this.name, this.count, this.asset);
}
