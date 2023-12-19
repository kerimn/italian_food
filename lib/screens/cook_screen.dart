import 'package:flutter/material.dart';
import 'package:food/constants/colors.dart';
import 'package:food/data/products.dart';
import 'package:food/models/products.dart';
import 'package:food/provider/product_provider.dart';
import 'package:food/widgets/category_widget.dart';
import 'package:provider/provider.dart';

class CookScreen extends StatefulWidget {
  const CookScreen({super.key});

  @override
  State<CookScreen> createState() => _CookScreenState();
}

class _CookScreenState extends State<CookScreen> {
  @override
  void initState() {
    Provider.of<ProductModel>(context, listen: false).initializeController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var productProvider = context.watch<ProductModel>();
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 22),
              TextField(
                controller: productProvider.searchController,
                onChanged: (query) => productProvider.filterProducts(),
                style: const TextStyle(fontSize: 14, color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF353842),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Trova un piatto',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(
                      0xFF686F82,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  suffixIcon: const Icon(
                    Icons.search_sharp,
                    color: mainColor,
                    size: 35,
                  ),
                ),
              ),
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
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productProvider.searchResult.length,
                itemBuilder: ((context, index) {
                  Product product =
                      productProvider.searchResult.elementAt(index);
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
                              product.img,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "${product.kcal} kcal per ${product.weight}",
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
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: product.ingredients
                                      .map((e) => Text(
                                            e,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xFF686F82),
                                                ),
                                          ))
                                      .toList(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
