import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/widgets/auth_card.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              //Color.fromRGBO(215, 117, 255, 0.5),
              //Color.fromRGBO(255, 188, 117, 0.9),
              Color(0xFF1c92d2),
              Color(0xFFf2fcfe),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
        ),
        Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
                    transform: Matrix4.rotationZ(-8 * pi / 180)
                      ..translate(-10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.deepOrange.shade900,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8,
                              color: Colors.black26,
                              offset: Offset(2, 4))
                        ]),
                    child: Text(
                      'Minha Loja',
                      style: TextStyle(
                          color:
                              Theme.of(context).accentTextTheme.headline6.color,
                          fontSize: 45.0,
                          fontFamily: 'Anton'),
                    ),
                  ),
                  AuthCard(),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
