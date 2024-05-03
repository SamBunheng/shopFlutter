import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/home/model/categories.dart';

class CategorySlide extends StatelessWidget {
  const CategorySlide({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.8,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 8),
          child: Text(category.name,
          style: GoogleFonts.roboto(
            fontSize: 17,
            fontWeight: FontWeight.w400,
          )),
        ),
      ),
    );
  }
}