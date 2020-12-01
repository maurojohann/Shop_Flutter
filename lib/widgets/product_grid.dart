import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_grid_item.dart';
import '../providers/products.dart';

class ProductGrid extends StatelessWidget {
  //final List<Product> product;
  final bool showFavoriteOnly;

  const ProductGrid(this.showFavoriteOnly);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    final product = showFavoriteOnly
        ? productsProvider.favoriteItems
        : productsProvider.items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: product.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: product[i],
        child: ProductGridItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
