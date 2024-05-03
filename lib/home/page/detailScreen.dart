import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/home/controller/favoriteController.dart';
import 'package:shop/home/model/product.dart';

class DetailScreen extends StatelessWidget {
   DetailScreen({super.key, required this.model});
  final ProductModel model;
     final FavoriteController favoriteController = Get.put(FavoriteController());
 

  bool check = true;

    //var _product;
  Future addToFavorite()async{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var currentUser  = _auth.currentUser;
  CollectionReference _collectionRef = 
  FirebaseFirestore
  .instance.collection('favorite_items');
  return _collectionRef
  .doc(currentUser!.email)
  .collection('items')
  .doc()
  .set({
    'name': model.name,
    'price': model.price,
    'iconpath': model.iconpath,
  }).then((value) => print("added to favorite"));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                appbar(),
                Container(
                  height: 300,
                  width: 300,
                  child: Image.asset(
                    model.image,
                  //  fit: BoxFit.fill,
                  ),
                ),
                name(),
                rating(),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 8),
                  child: Text(model.des,
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 19,
                    fontWeight: FontWeight.normal
                  ),),
                ),
                //memory(),
                const SizedBox(height: 50),
                Divider(
                  height: 50,
                  thickness: 2,
                ),
                purchased()
              ],
            )
          ],
        ),
      ),
      
      
      );
  }

  Row purchased() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.realprice,
                      style: GoogleFonts.roboto(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 18
                      )),
                      Text(model.price,
                      style: GoogleFonts.roboto(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ))
                    ],
                    
                  ),
          CupertinoButton(
          child: Container(
            padding: EdgeInsets.only(left: 60,right: 60,top: 20,bottom: 20),
            decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius: BorderRadius.circular(15)
            ),
            child: const Text(
              'Add to cart',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          onPressed: () {
            //controller
          },
        ),
                ],
              );
  }

  // Row memory() {
  Padding rating() {
    return Padding(
                padding: EdgeInsets.only(left: 10,top: 20,bottom: 20),
                child: Row(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Container(
                              padding: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.2,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: Icon(Icons.star,
                                    color: Colors.orange,
                                    size: 20,),
                                  ),
                                 Text('${model.rating}',
                                 style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800
                                 ),)
                                ],
                              ),
                            ),
                          ),
                         Container(
                            padding: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1.2,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 6),
                                  child: Icon(Icons.thumb_up,
                                  color: Colors.green,
                                  size: 20,),
                                ),
                               Text('94%',
                               style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w800
                               ),)
                              ],
                            )
                            
                          ),
                        ],
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text('117Reviews',
                  style: GoogleFonts.roboto(
                    color: Colors.grey,
                    fontSize: 13,
                  )),
                ),
                  ],
                )
              );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(model.name,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 30
                ),),
                Container(
                  padding: EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 20),
                  child: Text('%ON SALE',
                  style: GoogleFonts.openSans(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                    
                  ),),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //borderRadius: BorderRadius.circular(50),
                    color: Colors.red,
                  ),
                )
              ],
                ),
    );
  }

  Padding appbar() => 
   Padding(
    padding: EdgeInsets.only(left: 20,top: 20,right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed:() {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new,color: Colors.black,),
          )),
        Row(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore
              .instance
              .collection('items')
              .where('name',isEqualTo: model.name)
              .snapshots(), 
              builder: (context, snapshot) {
                if(snapshot.data==null){
                  return Text('');
                }return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
              onPressed:() {
                favoriteController.toggleFavorite();
                 snapshot.data!.docs.length==0
                ?addToFavorite()
                :print('added bro');
              },
                
               
              icon: Obx(() => 
              Icon(favoriteController.isFavorite.value
              ? Icons.favorite
              : Icons.favorite_border,
              color: favoriteController.isFavorite.value
              ?Colors.red
              :Colors.grey,))
              )
              ),
            );
              },),
          CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed:() {
            },
            icon: const Icon(Icons.share,color: Colors.black,),
          )),
          ],
        ),
      ],
    ),
  );
}