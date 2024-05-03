import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/home/model/categories.dart';
import 'package:shop/home/model/product.dart';
import 'package:shop/home/page/cartScreen.dart';
import 'package:shop/home/page/searchpage.dart';
import 'package:shop/home/widget/Category.dart';
import 'package:shop/home/widget/Product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                appBar(),
                searchField(),
                promotion(),
                categories(),
                productCategory(),   
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding productCategory() => 
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: GridView.count(
      shrinkWrap: true,
      primary: false,
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 10,
      children: List.generate(
        listProduct.length, 
        (index) => ProductSlide(
          context,listProduct[index],
        )),
    ),
  );

  Padding categories() => 
  Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text('Categories',
        style: GoogleFonts.nunito(
          fontSize: 26,
          fontWeight: FontWeight.w500,
        )),
        const SizedBox(height: 18),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for(int i = 0;i < listCategory.length;i++)
              CategorySlide(
                 category: listCategory[i],
              )
            ],
          ),
        )
          
      ],
    ),);

  Padding promotion() => 
  Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.green[400],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Clearance \n Sales',
              style: GoogleFonts.openSans(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),),
              ElevatedButton(
                onPressed: () {
                  
                }, child: Text(' Up to 50% ',
                style: GoogleFonts.roboto(
                  color: Colors.green[400],
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                  )
                ),
                ),
            ],
          ),
          Image.asset('asset/images/iphone.png'),
        ],
      ),
    ),
  );

  Container searchField() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,left: 20,right: 20
      ),
      child: TextField(
        readOnly: true,
        onTap: () {
          Get.to(SearchPage());
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          filled: true,
          fillColor: Colors.grey[100],
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Search',
          suffixIcon: const Icon(Icons.search,
          size: 27),
        ),
      ),
    );
  }

  Padding appBar() => 
   Padding(
    padding: EdgeInsets.only(left: 15,right: 15,top: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Discover',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w400,
        ),
        ),
        GestureDetector(
           onTap: () {
            Navigator.push(context, 
            MaterialPageRoute(
              builder: (context) => CartScreen())
              );
          },
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: badges.Badge(
            badgeContent: Text('3'),
            child: Icon(Icons.shopping_bag_outlined,
            size: 30,
            color: Colors.black,
            ),
                ),
          ),
        ),
      ],
    ),
  );
}