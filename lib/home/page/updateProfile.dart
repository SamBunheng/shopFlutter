import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/home/controller/UserController.dart';
import 'package:shop/home/model/userModel.dart';
import 'package:shop/home/widget/textField.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late UserModel? userModel;

  late String? docId;

  final userController = Get.put(UserController());

  final firstnameCon = TextEditingController();

  final lastnameCon = TextEditingController();

  final ageCon = TextEditingController();
  late DatabaseReference dbRef;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('update page'
        ),
         actions: [
          IconButton(
            onPressed: ()  async{
            // await userController.editProduct(
            //           UserModel(
            //             firstname: firstnameCon.text,
            //             lastname: lastnameCon.text,
            //             age: int.parse(ageCon.text),
            //           ),
            //           docId: docId!,
            //         );
            //   Get.back();
            //   print(docId);
                await FirebaseFirestore.instance
                .collection('users')
                .doc(Get.arguments['docId'].toString())
                .update({
                  'first name': firstnameCon.text.trim(),
                  'last name': lastnameCon.text.trim(),
                  'age': ageCon.text.trim(),
                },
                ).then((value) => {
                  Get.back(),
                });
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child:  Column(
          children: [
            Center(
              child: Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 15),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.asset('asset/images/icon.webp'),
                        ),
                      ),
                      
            ),
              Container(
                          height: 580,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              ListView(
                                shrinkWrap: true,
                            children:  [
                                InputField(
                                controller: firstnameCon
                                ..text = "${Get.arguments['first name'].toString()}",
                                hintText: 'First name',
                                labelText: 'First name',
                                icon: Icon(Icons.person),
                            ),
                             InputField(
                                controller: lastnameCon
                                ..text = "${Get.arguments['last name'].toString()}",
                                hintText: 'last name',
                                labelText: 'Last name',
                                icon: Icon(Icons.person),
                            ),
                             InputField(
                                controller: ageCon
                                ..text = "${Get.arguments['age'].toString()}",
                                hintText: 'age',
                                labelText: 'Age',
                                icon: Icon(Icons.person),
                            ),
                            
      
                            ],
                          )
                            ],
                          ),
                        ),
          ],
        )),
      
    );
  }
}