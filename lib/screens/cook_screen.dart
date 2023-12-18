import 'package:flutter/material.dart';
import 'package:food/constants/colors.dart';
import 'package:food/constants/images.dart';
import 'package:food/widgets/category_widget.dart';
import 'package:food/widgets/custom_text_field.dart';

class CookScreen extends StatelessWidget {
  const CookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(44, 47, 56, 1.0),
        appBar: AppBar(
          title: Text(
            "Calorie dei piatti",
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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   "Calorie dei piatti",
              //   textAlign: TextAlign.center,
              //   style: Theme.of(context).textTheme.titleLarge!.copyWith(
              //       fontSize: 24,
              //       fontWeight: FontWeight.w400,
              //       color: Colors.white),
              // ),
              const SizedBox(height: 22),
              const CustomTextField(),
              const SizedBox(height: 20),
              Text(
                "Categorie",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CategoryWidget(),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Card(
                        color: const Color.fromRGBO(53, 56, 66, 1),
                        child: ListTileTheme(
                          contentPadding: const EdgeInsets.only(right: 10),
                          iconColor: Colors.grey,
                          minVerticalPadding: 0,
                          child: ExpansionTile(
                            iconColor: Colors.white,
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                AppImages.food,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Row(
                              children: [
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Lasagne",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "127 kcal. per 100 gr.",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: mainColor,
                                          ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Ingredienti:",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                  ),
                                  Text(
                                    " Fogli di lasagne pronti\n Fogli di lasagne pronti\n Fogli di lasagne pronti\n Fogli di lasagne pronti\n",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF686F82),
                                        ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
