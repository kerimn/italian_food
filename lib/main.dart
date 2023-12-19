import 'package:flutter/material.dart';
import 'package:food/constants/colors.dart';
import 'package:food/constants/images.dart';
import 'package:food/constants/themes.dart';
import 'package:food/provider/product_provider.dart';
import 'package:food/screens/my_app.dart';
import 'package:food/screens/on_boarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      color: bgColor,
      home: const InitialPage(),
    );
  }
}

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  _checkIfOnboardingShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onboardingShown = prefs.getBool('OnBoardingScreenShown') ?? false;
    print(onboardingShown);
    if (!onboardingShown) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
      prefs.setBool('OnBoardingScreenShown', true);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyAppScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      _checkIfOnboardingShown();
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.initialPhoto,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
