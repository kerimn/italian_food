import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/constants/colors.dart';
import 'package:food/constants/images.dart';
import 'package:food/screens/cook_screen.dart';
import 'package:food/screens/home_screen.dart';
import 'package:food/screens/settings_screen.dart';

class MyAppScreen extends StatefulWidget {
  const MyAppScreen({super.key});

  @override
  State<MyAppScreen> createState() => _MyAppScreenState();
}

class _MyAppScreenState extends State<MyAppScreen> {
  int currentIndex = 0;
  var pages = [
    const HomeScreen(),
    const CookScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            pages[currentIndex],
            Container(
              margin: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                child: BottomNavigationBar(
                  backgroundColor: const Color.fromRGBO(37, 40, 48, .8),
                  currentIndex: currentIndex,
                  elevation: 0,
                  onTap: _onItemTapped,
                  items: [
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SvgPicture.asset(
                          AppImages.cutlery,
                          color: currentIndex == 0 ? mainColor : Colors.white,
                        ),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SvgPicture.asset(
                          AppImages.fire,
                          color: currentIndex == 1 ? mainColor : Colors.white,
                        ),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SvgPicture.asset(AppImages.setting,
                            color:
                                currentIndex == 2 ? mainColor : Colors.white),
                      ),
                      label: '',
                    ),
                  ],
                  selectedItemColor: mainColor,
                  unselectedItemColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
