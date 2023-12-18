import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/constants/images.dart';
import 'package:food/screens/on_boarding_second_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.onBoardingPhoto,
              fit: BoxFit.cover,
            ),
          ),
          // Image.asset(
          //   AppImages.onBoardingPhoto,
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   fit: BoxFit.cover,
          // ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                // borderRadius: BorderRadius.all(
                //   Radius.circular(20),
                // ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cibo italiano",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Cucina tradizionale italiana, diffusa e popolare in tutto il mondo, grazie a piatti come la pizza e gli spaghetti.",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: const Color.fromRGBO(104, 111, 130, 1),
                          fontSize: 14,
                        ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const OnBoardingSecondScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Color(0xFFE78C04),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: SvgPicture.asset(
                          AppImages.left,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppImages.active),
                        const SizedBox(width: 8),
                        SvgPicture.asset(AppImages.inactive),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _launchURL();
                        },
                        child: Text(
                          "Condizioni d'uso | politica sulla riservatezza",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                color: const Color.fromRGBO(104, 111, 130, 1),
                                fontSize: 14,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

_launchURL() async {
  final Uri url = Uri.parse('https://google.com');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
