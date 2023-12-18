import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/constants/images.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 47, 56, 1.0),
      appBar: AppBar(
        title: Text(
          "Regolazioni",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 24,
              ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(44, 47, 56, 1.0),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              ListTile(
                onTap: () {},
                leading: SvgPicture.asset(AppImages.settingPhoto),
                title: Text(
                  'Politica sulla riservatezza',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(104, 111, 130, 1.0)),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(AppImages.settingPhoto1),
                title: Text(
                  'Termini di utilizzo',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(104, 111, 130, 1.0)),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: SvgPicture.asset(AppImages.settingPhoto2),
                title: Text(
                  "Informazioni sull'abbonamento",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(104, 111, 130, 1.0)),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: SvgPicture.asset(AppImages.settingPhoto3),
                title: Text(
                  "Valuta l'app",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(104, 111, 130, 1.0)),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
