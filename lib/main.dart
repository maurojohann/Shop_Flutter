import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/utils/custom_route.dart';

import 'utils/app_routes.dart';

import 'views/auth_home_screen.dart';
import './views/cart_screen.dart';
import './views/orders_screen.dart';
import './views/product_detail_screen.dart';
import './views/products_screen.dart';
import './views/product_form_screen.dart';

import './providers/orders.dart';
import './providers/cart.dart';
import './providers/products.dart';
import './providers/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => new Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
            create: (_) => new Products(),
            update: (ctx, auth, previousProducts) => new Products(
                  auth.token,
                  auth.userId,
                  previousProducts.items,
                )),
        ChangeNotifierProvider(
          create: (ctx) => new Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (ctx) => new Orders(),
          update: (ctx, auth, previousOrders) =>
              new Orders(auth.token, auth.userId, previousOrders.items),
        ),
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            errorColor: Colors.red,
            accentColor: Colors.red[400],
            fontFamily: 'Lato',
            visualDensity: VisualDensity.adaptivePlatformDensity,
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.android: CustomPageTransitionsBuilder(),
              TargetPlatform.iOS: CustomPageTransitionsBuilder(),
            })),
        //home: AuthScreen(),
        routes: {
          AppRoutes.AUTH_HOME: (ctx) => AuthOrHomeScreen(),
          //   AppRoutes.HOME: (ctx) => ProductOverviewScreen(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
          AppRoutes.CART: (ctx) => CartScreen(),
          AppRoutes.ORDERS: (ctx) => OrdersScreen(),
          AppRoutes.PRODUCTS: (ctx) => ProductsScreen(),
          AppRoutes.PRODUCT_FORM: (ctx) => ProductFormScreen(),
        },
      ),
    );
  }
}
