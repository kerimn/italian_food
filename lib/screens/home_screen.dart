import 'package:flutter/material.dart';
import 'package:food/constants/colors.dart';
import 'package:food/models/products.dart';
import 'package:food/provider/product_provider.dart';
import 'package:food/screens/about_screen.dart';
import 'package:food/widgets/category_widget.dart';
import 'package:food/widgets/custom_grid_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Benvenuti nel mondo della cucina italiana",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
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
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CategoryWidget(),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Piatti italiani",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    height: 230,
                  ),
                  itemCount: productProvider.searchResult.length,
                  itemBuilder: (context, index) {
                    Product product =
                        productProvider.searchResult.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AboutScreen(
                              productTitle: product.name,
                              productDescription: product.description,
                              productImg: product.img,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF353842),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 160,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: Image.asset(
                                  product.img,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              product.name,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
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
}
