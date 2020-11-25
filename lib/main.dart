import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop/providers/cart.dart';
import 'views/products_overview_screen.dart';
import 'utils/app_routes.dart';
import 'views/product_detail_screen.dart';
import './providers/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => new Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => new Cart(),
        )
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.red[400],
          fontFamily: 'Lato',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProductOverviewScreen(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
