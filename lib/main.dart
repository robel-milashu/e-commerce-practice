import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_example/screens/carts_screen.dart';
import 'package:state_example/screens/products_screen.dart';
import 'package:state_example/state/product_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProductState())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/': (context) => ProductsListScreen(),
            '/cart': (context) => CartScreen(),
          },
          // home:
          //  ChangeNotifierProvider(
          //     create: (context) => ProductState(),
          // child:
          // ProductsListScreen()
          // ),
        ));
  }
}
