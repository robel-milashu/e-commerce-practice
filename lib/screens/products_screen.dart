import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_example/screens/reusable/category_container.dart';
import 'package:state_example/screens/reusable/product_view.dart';
import '../state/product_provider.dart';
import '../common/strings.dart';

class ProductsListScreen extends StatelessWidget {
  ProductsListScreen({super.key});
  late Size size;

  var productState;
  var productStateUpdate;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    productState = Provider.of<ProductState>(context);
    productStateUpdate = Provider.of<ProductState>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Market",
          style: TextStyle(
              color: Strings.green,
              // color: Color.fromARGB(255, 116, 109, 109),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          Text(
            productState.selectedProducts.length.toString(),
            style: const TextStyle(fontSize: 50),
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.amber,
            ),
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CartScreen()));
              Navigator.pushNamed(context, "/cart");
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Strings.h10,
          const Text(
            "Sell and Buy Products here",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Provider.of<ProductState>(context).categories.length,
                itemBuilder: (context, index) {
                  var cat =
                      Provider.of<ProductState>(context).categories[index];
                  return InkWell(
                      onTap: () {
                        Provider.of<ProductState>(context, listen: false)
                            .changeIndex(index);
                      },
                      child: CategoryContainer(
                        title: cat['title'],
                      ));
                }),
          ),
          SizedBox(
            height: size.height * 0.5,
            child: ListView.builder(
                itemCount: productState
                    .categories[productState.selectedCategoryIndex]['products']
                    .length,
                itemBuilder: (context, index) {
                  var product = productState
                          .categories[productState.selectedCategoryIndex]
                      ['products'][index];
                  return ProductViewScreen(
                    product: product,
                    trailing: IconButton(
                      onPressed:
                          productState.selectedProducts.indexOf(product) == -1
                              ? () {
                                  productStateUpdate.addToCart(product);
                                }
                              : () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        color:
                            productState.selectedProducts.indexOf(product) == -1
                                ? Colors.red
                                : Colors.grey,
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
