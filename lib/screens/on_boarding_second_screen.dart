import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/constants/images.dart';
import 'package:food/screens/my_app.dart';
import 'package:url_launcher/url_launcher.dart';

class OnBoardingSecondScreen extends StatelessWidget {
  const OnBoardingSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.onboarding2,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.35,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 0, 0, 0.35),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.3), // Box shadow color with opacity
                        offset: const Offset(0, 0),
                        blurRadius: 30,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        "Sono davvero impressionato dalle sue funzionalità e dalla facilità d'uso",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppImages.star),
                          const SizedBox(width: 5),
                          SvgPicture.asset(AppImages.star),
                          const SizedBox(width: 5),
                          SvgPicture.asset(AppImages.star),
                          const SizedBox(width: 5),
                          SvgPicture.asset(AppImages.star),
                          const SizedBox(width: 5),
                          SvgPicture.asset(AppImages.star),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "La scoperta dell'APP Assistente finanziario è stato un momento cruciale nella mia ricerca di alfabetizzazione e gestione finanziaria. Questa app all-in-one per l'educazione finanziaria e il monitoraggio non solo ha semplificato la mia vita finanziaria, ma mi ha anche fornito approfondimenti e strumenti che stanno davvero cambiando le regole del gioco.",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 7,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Apprezziamo il tuo feedback!",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Ogni giorno miglioriamo grazie alle tue valutazioni e recensioni: questo ci aiuta a proteggere i tuoi account.",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: const Color.fromRGBO(104, 111, 130, 1),
                              fontSize: 14,
                            ),
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const OnBoardingSecondScreen(),
                              ),
                            );
                          },
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyAppScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Color(0xFFE78C04),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              child: SvgPicture.asset(
                                AppImages.left,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppImages.inactive),
                            const SizedBox(width: 8),
                            SvgPicture.asset(AppImages.active),
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
                                    color:
                                        const Color.fromRGBO(104, 111, 130, 1),
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
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.10,
            left: MediaQuery.of(context).size.width * 0.42,
            child: Center(
              child: Image.asset(
                AppImages.avatar,
                fit: BoxFit.cover,
                width: 70,
                height: 70,
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
