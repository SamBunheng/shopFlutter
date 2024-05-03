import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/home/model/product.dart';
import 'package:shop/home/page/detailScreen.dart';
import 'package:get/get.dart';

  Widget ProductSlide(BuildContext context,ProductModel model) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(DetailScreen(model: model));
          },
          child: Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[100],
            ),
            child: Image.asset(model.iconpath,                   
            ),),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 8,right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.name,
                style: GoogleFonts.roboto(
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star,
                  color: Colors.amber,),
              Text(
                '${model.rating}',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold
                ),
              ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 120),
          child: Text(
                ' ${model.price}',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )
              ),
        )
      ],
      
        ),
    );
  }