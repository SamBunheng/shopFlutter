import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/home/model/product.dart';

Widget CartSlide(ProductModel model){
  return SizedBox(
    width: double.infinity,
    height: 100,
    child: Card(
      child: Row(
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/images/apple-watch-series-7-9to5mac-9-removebg-preview.png'),
                ),
            ),
          ),
          Column(
            children: [
              Text(model.name),
            ],
          )
        ],
      ),
    ),
  );
}