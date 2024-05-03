import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shop/home/model/UserModels.dart';

class Authcontroller extends GetxController{
    var myUser = UserModels(
      
    ).obs;
  getUserInfo(){
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('users').doc(uid).snapshots().listen((event) {
      myUser.value = UserModels.fromJson(event.data()!);    
      });
  }
}
