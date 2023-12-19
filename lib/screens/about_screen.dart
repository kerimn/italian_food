import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/constants/images.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen(
      {super.key,
      required this.productTitle,
      required this.productImg,
      required this.productDescription});
  final productImg;
  final productTitle;
  final productDescription;
  @override
  Widget build(BuildContext context) {
    String moreText = productDescription;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // backgroundColor: Color,
        elevation: 0,
        leading: Row(
          children: [
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(255, 255, 255, 0.15),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(198, 228, 246, 0.05),
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: SvgPicture.asset(AppImages.arrow),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(44, 47, 56, 1.0),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              productImg,
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
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        productTitle,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "$moreText",
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: const Color.fromRGBO(104, 111, 130, 1),
                              fontSize: 14,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
