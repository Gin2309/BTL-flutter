import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:btl/pages/home_page.dart';
import 'package:btl/pages/product_detail.dart';
import 'package:btl/widgets/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/detail': (context) => ProductDetail(
                product: ModalRoute.of(context)!.settings.arguments as dynamic,
              ),
        },
      ),
    );
  }
}
