import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:btl/pages/HomePage.dart';
import 'package:btl/widgets/ProductDetail.dart';
import 'package:btl/widgets/CartProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => HomePage(),
          "/detail": (context) => ProductDetail(
              product: ModalRoute.of(context)!.settings.arguments as dynamic),
        },
      ),
    );
  }
}
