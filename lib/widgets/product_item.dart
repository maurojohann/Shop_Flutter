import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
              color: Theme.of(context).accentColor,
              //iconSize: 18,
              icon: Icon(
                Icons.favorite,
              ),
              onPressed: () {}),
          title: Text(
            product.title,
            textAlign: TextAlign.left,
            overflow: TextOverflow.clip,
          ),
          trailing: IconButton(
              iconSize: 18,
              icon: Icon(
                Icons.add_shopping_cart,
              ),
              onPressed: () {}),
        ),
      ),
    );
  }
}
