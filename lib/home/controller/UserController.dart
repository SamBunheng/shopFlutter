import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shop/home/model/userModel.dart';

class UserController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference product =
  FirebaseFirestore.instance.collection('users');
  Future<void> deleteProduct(String docId) {
    return product
        .doc(docId)
        .delete()
        .then((value) => print(" Deleted"))
        .catchError((error) => print("Failed : $error"));
  }

  Future<void> editProduct(UserModel model, {required String docId}) {
    return product
        .doc(docId)
        .set(model.fromJson())
        .then((value) => print("Updated"))
        .catchError((error) => print("Failed : $error"));
  }
}