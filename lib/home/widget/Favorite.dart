import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/home/model/product.dart';

Widget FavoriteSlide(BuildContext context,ProductModel model){
  return Column(
      children: [
     Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(model.iconpath)),
   Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Padding(
         padding: const EdgeInsets.only(left: 10),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
               'US ${model.price}',
               style: GoogleFonts.roboto(
                 fontSize: 20,
                 fontWeight: FontWeight.w700
               ),
             ),
             Text(
              model.name,
             ),
            //  Row(
            //    children: [
            //      for(int i=0;i<listProduct.length;i++)
            //      Padding(
            //        padding: const EdgeInsets.only(right:8),
            //        child: Container(
            //          color: model.morecolor[i],
            //          width: 18,
            //          height: 18,
            //        ),
            //      ),
            //    ],
            //  ),
           ],
         ),
       ),
       Icon(Icons.favorite,
       size: 28),
     ],
   ),
 
      ],
    );
}