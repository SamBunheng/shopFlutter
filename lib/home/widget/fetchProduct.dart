import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/home/model/product.dart';

Widget fetchData(String collectionName){
  return StreamBuilder(
    stream: FirebaseFirestore.instance
    .collection(collectionName)
    .doc(FirebaseAuth.instance.currentUser!.email)
    .collection('items')
    .snapshots(), 
    builder: (context, snapshot) {
      if(snapshot.hasError){
        return Center(
          child: Text('No Items'),
        );
      }
      return ListView.builder(
        itemCount: 
        snapshot.data == null ? 0
        :snapshot.data!.docs.length,
        itemBuilder: (context, index) {
          DocumentSnapshot _documentSnapshot = 
          snapshot.data!
          .docs[index];
          return Card(
              elevation: 5,
              child: ListTile(
                // leading: Text(_documentSnapshot['name'],
                // style: GoogleFonts.openSans(
                //   fontWeight: FontWeight.bold,
                //   fontSize: 20

                // ),),
                subtitle: Text(_documentSnapshot['price'],
                style: GoogleFonts.openSans(
                  color: Colors.red,
                  fontWeight: FontWeight.w500
                ),),
                title: Text(
                  _documentSnapshot['name'],
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold, 
                      color: Colors.black),
                ),
                trailing: GestureDetector(
                  child: Icon(Icons.favorite,
                  color: Colors.red,),
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection(collectionName)
                        .doc(FirebaseAuth.instance.currentUser!.email)
                        .collection("items")
                        .doc(_documentSnapshot.id)
                        .delete();
                  },
                ),
              ),
            );
        },
      );
    },
    );
}