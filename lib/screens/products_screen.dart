import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/product_provider.dart';

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
        title: const Text("Products"),
        actions: [
          Text(
            productState.selectedProducts.length.toString(),
            style: const TextStyle(fontSize: 50),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
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
          SizedBox(
            height: 200,
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
                    child: Container(
                      width: 200,
                      height: 200,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          border: Border.all(width: 2, color: Colors.green),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          cat['title'],
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  );
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
                  return ListTile(
                      title: Text(
                        product['brand'],
                        style: const TextStyle(fontSize: 20),
                      ),
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
                              productState.selectedProducts.indexOf(product) ==
                                      -1
                                  ? Colors.red
                                  : Colors.grey,
                        ),
                      ));
                }),
          )
        ],
      ),
    );
  }
}
