import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/orders.dart';

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : FlatButton(
            child: Text('Comprar'),
            textColor: Theme.of(context).primaryColor,
            onPressed: widget.cart.totalAmount == 0
                ? null
                : () async {
                    setState(() {
                      isLoading = true;
                    });
                    await Provider.of<Orders>(context, listen: false)
                        .addOrder(widget.cart);
                    setState(() {
                      isLoading = false;
                    });

                    widget.cart.clear();
                  },
          );
  }
}
