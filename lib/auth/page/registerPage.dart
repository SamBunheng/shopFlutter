import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  final _auth = FirebaseAuth.instance;
   RegisterPage ({
    super.key,
    required this.showLoginPage,
    });

  @override
  State<RegisterPage > createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage > {

  final _emailController = TextEditingController();
  final _pwController = TextEditingController();
  final _cfpwController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _ageController = TextEditingController();

Future signUp() async{
 if(passwordConfirmed()){
     await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _emailController.text.trim(), 
    password: _pwController.text.trim(),
    );

    //add user datails
    addUserDetails(
      _firstnameController.text.trim(), 
      _lastnameController.text.trim(), 
      _emailController.text.trim(), 
      int.parse(_ageController.text.trim()),
      
      );
    //add user details
      // CollectionReference collRef =
      //     FirebaseFirestore.instance.collection('users');
      // collRef.add({
      //   'firstName': _firstnameController.text,
      //   'lastName': _lastnameController.text,
      //   'email': _emailController.text,
      //   'age': _ageController.text,
      // });
 }
}
  Future addUserDetails(
    String firstName,String lastName,String email,int ages,) async{
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName ,
      'last name': lastName,
      'email': email,
      'age': ages,
    });
  }

  bool passwordConfirmed(){
    if(_pwController.text.trim() == 
       _cfpwController.text.trim()){
      return true;
    }else{
      return false;
    }
  }
  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose(); 
    _cfpwController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _ageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(Icons.android,
                // size: 100,
                // color: Colors.green.shade400,),
                Text('Hello There!',
                style: GoogleFonts.bebasNeue(
                  fontWeight: FontWeight.bold,
                  fontSize: 52,
                ),),
                Text('Register Below with your Detail',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                ),),
                const SizedBox(height: 50),
                //firstname
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextField(
                        controller: _firstnameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'First Name',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //lastname
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextField(
                        controller: _lastnameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Last Name',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //age
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextField(
                        controller: _ageController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Age',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextField(
                        obscureText: true,
                        controller: _pwController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
                 const SizedBox(height: 20),
                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextField(
                        obscureText: true,
                        controller: _cfpwController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm-Password',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.green.shade400,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I am member ',
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text('logIn Now',
                      style: GoogleFonts.roboto(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),),
                    )
                  ],
                )
              ],
            ),
          ),
        )),
    );
  }
}