import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shop/home/model/product.dart';
import 'package:shop/home/widget/fetchProduct.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({super.key});
  bool check = true;
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {


  //ProductModel model = ProductModel(id: id, iconpath: iconpath, name: name, des: des, realprice: realprice, price: price, image: image, rating: rating, memory: memory, morecolor: morecolor);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Icon(Icons.arrow_back_ios,
      color: Colors.black,),
      title: Text('Favorite',
      style: GoogleFonts.openSans(
        color: Colors.black,
        fontWeight: FontWeight.bold
      )),
      centerTitle: true,
      actions: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: badges.Badge(
          badgeContent: Text('3'),
          child: Icon(Icons.shopping_bag_outlined,
          size: 30,
          color: Colors.black,
          ),
              ),
        )
      ],
      ),
      // body: ListView.builder(
      //   // itemCount: listProduct.length,
      //   itemBuilder: (context, index) {
      //     List.generate(
      //   listProduct.length, 
      //   (index) => 
      //   fetchData('favorite_items', listProduct[index]));
      //   },
      // )
      body: fetchData('favorite_items'),
      // body:ListView(
      //   children: [
      //     GridView.count(
      //       shrinkWrap: true,
      //       primary: false,
      //     crossAxisCount: 2,
      //     crossAxisSpacing: 5,
      //     mainAxisSpacing: 10,
      //     childAspectRatio: 0.8,
      //     children: List.generate(
      //       listProduct.length, 
      //       (index) => fetchData(
      //         'favorite_items', listProduct[index]
      //         )
      //         ),
      //     )
      //   ],
      // )
      
    );
  }
}