import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_example/state/product_provider.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart  ${Provider.of<ProductState>(context).selectedCategoryIndex}",
          style: const TextStyle(
              color: Color.fromARGB(255, 116, 109, 109),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SizedBox(
          height: size.height * 0.5,
          child:
              Consumer<ProductState>(builder: (context, productState, child) {
            return ListView.builder(
                itemCount: productState.selectedProducts.length,
                itemBuilder: (context, index) {
                  var pro = productState.selectedProducts[index];
                  return ListTile(
                    title: Text(
                      pro['brand'],
                      style: const TextStyle(fontSize: 25),
                    ),
                    subtitle: Text(
                      pro['price'].toString(),
                      style: const TextStyle(fontSize: 25),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          Provider.of<ProductState>(context, listen: false)
                              .removeFromCart(pro);
                        },
                        icon: const Icon(Icons.delete)),
                  );
                });
          })),
    );
  }
}
