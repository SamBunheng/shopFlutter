// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/home/page/allUser.dart';
import 'package:shop/home/page/updateProfile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final currentUser = FirebaseAuth.instance;

   //Authcontroller authcontroller = Get.find<Authcontroller>();
   //final User? currentuser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios_new,
        color: Colors.black,)),
        backgroundColor: Colors.grey[200],
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
               FirebaseAuth.instance.signOut();
            },
            child: const Icon(Icons.logout_outlined,
            color: Colors.black,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                 Get.to(AllUser());
              },
              child: const Icon(Icons.person,
              color: Colors.black,),
            ),
          ),
        ],
      ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance
        .collection('users')
        .where("email", isEqualTo: currentUser.currentUser!.email)
        .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index]; 
                    var firstname = snapshot.data!.docs[index]['first name'];
                    var lastname = snapshot.data!.docs[index]['last name'];
                    var age = snapshot.data!.docs[index]['age'];
                    var docId = snapshot.data!.docs[index].id;
                    //QueryDocumentSnapshot x = snapshot.data!.docs[index];
                    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                Padding(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(data['first name'],
                          style: GoogleFonts.openSans(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),),
                          const Text('  '),
                          Text(data['last name'],
                          style: GoogleFonts.openSans(
                            fontSize: 23,
                            fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(data['email']),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 40),
                        child: GestureDetector(
                          onTap: () {
                              Get.to(UpdatePage(),
                                arguments: {
                                  // firstname['first name']:firstname,
                                'first name': firstname,
                                'last name':lastname,
                                'age': age,
                                'docId': docId,
                              });
                          },
                          child: Container(
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.5,),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'Edit profile',
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            ),
                          ),
                          ),
                        ),
                      ),
                      Container(
                        height: 370,
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
    ListTile(
      visualDensity: VisualDensity(vertical: 4),
      leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: const Icon(Icons.person,
                size: 25,),
      ),
      title: Text('My Profile',
      style: GoogleFonts.openSans(
        fontSize: 15,
        fontWeight: FontWeight.bold
      ),),
      trailing: IconButton(
        onPressed: () {
          
        }, 
        icon: const Icon(Icons.arrow_forward_ios,
        size: 20,
        color: Colors.black,))
    ),
    const SizedBox(height: 17),
    ListTile(
      visualDensity: VisualDensity(vertical: 4),
      leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: const Icon(Icons.favorite,
                size: 25,),
      ),
      title: Text('Your Favorite',
      style: GoogleFonts.openSans(
        fontSize: 15,
        fontWeight: FontWeight.bold
      ),),
      trailing: IconButton(
        onPressed: () {
          
        }, 
        icon: const Icon(Icons.arrow_forward_ios,
        size: 20,
        color: Colors.black,))
    ),
    const SizedBox(height: 17),
    ListTile(
      visualDensity: VisualDensity(vertical: 4),
      leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: const Icon(Icons.tag_faces,
                size: 25,),
      ),
      title: Text('Tell Your Friends',
      style: GoogleFonts.openSans(
        fontSize: 15,
        fontWeight: FontWeight.bold
      ),),
      trailing: IconButton(
        onPressed: () {
          
        }, 
        icon: const Icon(Icons.arrow_forward_ios,
        size: 20,
        color: Colors.black,))
    ),
     const SizedBox(height: 17),
     ListTile(
      visualDensity: VisualDensity(vertical: 4),
      leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: const Icon(Icons.settings,
                size: 25,),
      ),
      title: Text('Settings',
      style: GoogleFonts.openSans(
        fontSize: 15,
        fontWeight: FontWeight.bold
      ),),
      trailing: IconButton(
        onPressed: () {
          // Get.to(UpdatePage());
        }, 
        icon: const Icon(Icons.arrow_forward_ios,
        size: 20,
        color: Colors.black,))
    ),
  ],
)
                          ],
                        ),
                      ),                    
                    ],

                ),
                    );
                  },
                );
              }
              else{
                return const Center(child: CircularProgressIndicator());
              }
            },
      ),
    //   body: StreamBuilder<QuerySnapshot>(
    //   stream: FirebaseFirestore.instance.collection('users').snapshots(),
    //   builder: ( context,snapshot) {
    //     if (snapshot.hasError) {
    //       return Text('Something went wrong');
    //     }

    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Text("Loading");
    //     }

    //     return ListView(
    //       children: snapshot.data!.docs.map((DocumentSnapshot document) {
    //       Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    //         return ListTile(
    //           title: Text(data['first name']),
    //           subtitle: Text(data['last name']),
    //         );
    //       }).toList(),
    //     );
    //   },
    // ),
   );
      }
}