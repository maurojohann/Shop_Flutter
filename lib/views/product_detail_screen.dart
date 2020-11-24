import 'package:flutter/material.dart';

import '../models/product.dart';
import '../providers/couter_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context).settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(
        children: [
          Text(CounterProvider.of(context).state.value.toString()),
          RaisedButton(
              child: Text('+'),
              onPressed: () {
                print(CounterProvider.of(context).state.value);
                setState(() {
                  CounterProvider.of(context).state.inc();
                });
              })
        ],
      ),
    );
  }
}
