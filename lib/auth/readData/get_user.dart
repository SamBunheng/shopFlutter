import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  const GetUserName({super.key, required this.documentId});
  final String documentId;

  @override
  Widget build(BuildContext context) {


    //get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = 
          snapshot.data!.data() as Map<String, dynamic>;
          return Center(
            child: Column(
              children: [
                Text('${data['first name']} '+' ${data['last name']}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
                Text('${data['email']}'
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                )
              ],
            ),
          );
        }  
        return const Text('loading');
      },
      );
  }
}