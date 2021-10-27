import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:select_me/app_colors.dart';
import 'package:select_me/ui/screens/documents/documents_screen.dart';
import 'package:select_me/ui/screens/home/home_screen.dart';
import 'package:select_me/ui/screens/profile/profile_screen.dart';
import 'package:select_me/ui/screens/storage/storage_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    HomeScreen(),
    StorageScreen(isMerchant: true),
    DocumentsScreen(
      isMerchant: true,
    ),
    ProfileScreen(isMerchant: true),
  ]; // to store nested tabs
  Widget currentScreen = Scaffold();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.MONO_WHITE,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    if (_selectedIndex == 0)
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                  ],
                ),
                child: SvgPicture.asset("assets/icons/home_ic.svg")),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    if (_selectedIndex == 1)
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                  ],
                ),
                child: SvgPicture.asset("assets/icons/sell_ic.svg")),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    if (_selectedIndex == 2)
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                  ],
                ),
                child: SvgPicture.asset("assets/icons/documents_ic.svg")),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    if (_selectedIndex == 3)
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                  ],
                ),
                child: SvgPicture.asset("assets/icons/profile_ic.svg")),
            label: '',
          ),
        ],
      ),
    );
  }
}
