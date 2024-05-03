import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/home/page/home.dart';
import 'package:shop/home/page/homepage.dart';
import 'package:shop/home/page/profile.dart';
import 'package:shop/home/page/updateProfile.dart';
import 'package:shop/home/widget/textField.dart';

class AllUser extends StatelessWidget {
  AllUser({super.key});
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios,
          color: Colors.black,)),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('User List',
              style: GoogleFonts.openSans(
                fontSize: 28,
                fontWeight: FontWeight.bold
              )),
              Padding(
                  padding: const EdgeInsets.only(top: 15,right: 20),
                  child: GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.green.shade400,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Add User',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30,bottom: 30),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              height: 70,
              width: double.maxFinite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: GestureDetector(
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.menu,
                              color: Colors.white,),
                              Text('All',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                              ),),
                            ],
                          )),
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: GestureDetector(
                      child: Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(Icons.menu,
                              color: Colors.white,),
                              Text('Filter',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                              ),),
                            ],
                          )),
                      ),
                    ),
                  ),
                       Flexible(
                         child: InputField(
                                  controller: controller,
                                  hintText: 'search user..',
                                  labelText: 'User',
                                  icon: Icon(Icons.search),
                              ),
                       ),
                ],
              ),
            ),
          ),
          Flexible(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
              .collection('users')
              .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
                    if(snapshot.hasData){
                      return Container(
                        color: Colors.white,
                        child: ListView.builder(
                          // shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                            var data = snapshot.data!.docs[index];
                            var firstname = snapshot.data!.docs[index]['first name'];
                            var lastname = snapshot.data!.docs[index]['last name'];
                            var age = snapshot.data!.docs[index]['age'];
                            var docId = snapshot.data!.docs[index].id;
                              //QueryDocumentSnapshot x = snapshot.data!.docs[index];
                              return ListView(
                                shrinkWrap: true,
                                  children:  [
                                    const SizedBox(height: 30),
                                    ListTile(
                                      leading: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Image.asset('asset/images/icon.webp'),
                                ),
                                      title: Row(
                                          children: [
                                            Text(data['first name']),
                                            Text(data['last name']),
                                          ],
                                      ),
                                      subtitle: Text(data['email']),
                                      trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                            onPressed: () {
                              Get.to(UpdatePage(),
                              arguments: {
                                                    // firstname['first name']:firstname,
                                'first name': firstname,
                                'last name':lastname,
                                'age': age,
                                'docId': docId,
                              });
                                            }, 
                                            icon: Icon(Icons.edit)),
                                            IconButton(
                              onPressed: () async{
                                await FirebaseFirestore.instance
                              .collection('users')
                              .doc(docId)
                              .delete();
                              }, 
                              icon: Icon(Icons.delete)),
                                          ],
                                      ),
                                    ),
                                  ],
                                );
                                  }),
                      );
                            }
                else{
                              return const Center(child: CircularProgressIndicator());
                            }
                          }
                    ),
          ),
        ],
      )
      );
  }
}