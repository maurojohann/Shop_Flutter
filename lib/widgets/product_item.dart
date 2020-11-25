import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop/utils/app_routes.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            //Navegacao sendo necessario nomear as rotas
            Navigator.of(context)
                .pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product);

            //Navigacao sem a necessidade de nomear as rotas
            //Navigator.of(context).push(MaterialPageRoute(
            //  builder: (ctx) => ProductDetailScreen(product),
            // ));
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              color: Theme.of(context).accentColor,
              //iconSize: 18,
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: () {
                product.toggleFavorite();
              },
            ),
          ),
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
