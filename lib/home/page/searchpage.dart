import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/home/model/product.dart';
import 'package:shop/home/model/search.dart';
import 'package:shop/home/widget/search.dart';
import 'package:shop/home/widget/textField.dart';

class SearchPage extends StatefulWidget {
 SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}
   //creating the list that we're going to display and filter
    
  
class _SearchPageState extends State<SearchPage> {
  var controller = TextEditingController();
  var values;
  List<ProductModel> displadiy_list = List.from(listProduct);
   //filter list
  void updateList(String value){
    setState(() {
      displadiy_list = listProduct
      .where((element) => element.name
      .toLowerCase()
      .contains(value.toLowerCase()))
      .toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    Text('Search',
                    style: GoogleFonts.roboto(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    IconButton(onPressed: () {
                      Get.back();
                    }, icon: Icon(Icons.cancel_outlined,
                    size: 30,)),
                  ],
                ),
              ),
               Container(
      margin: const EdgeInsets.only(
        top: 20,left: 10,right: 10
      ),
      child: TextField(
        onChanged: (value) => updateList(value),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          contentPadding: const EdgeInsets.all(10),
          hintText: 'eg. Iphones',
          suffixIcon: const Icon(Icons.search,
          size: 27),
        ),
      ),
    ),
      Padding(
        padding: const EdgeInsets.only(left: 22,top: 40,bottom: 25),
        child: Text('Try searching',
        style: GoogleFonts.roboto(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),),
      ),
      SizedBox(
        height: 500,
        child: Column(
          children: [
          Expanded(
            child: ListView.builder(
              itemCount: displadiy_list.length,
              itemBuilder: (context, index) => 
              ListView(
                shrinkWrap: true,
                children: [
                ListTile(
                  title: Text(displadiy_list[index].name,
                  style: GoogleFonts.openSans(
                    fontSize: 20
                  ),),
                  subtitle: Text(displadiy_list[index].price),
              
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star),
                      Text(displadiy_list[index].rating.toString()),
                    ],
                  ),
                ),
                ],
              ),
            ),
            ),
          ],
        ),
      )
      // SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   child: Column(
      //     children: [
      //       for(int i=0;i<listSearch.length;i++)
      //       SearchSLide(
      //         searchModel: listSearch[i]),
      //     ],
      //   ),
      // )
            ],
          )
        ],
      ),
    );
  }
}