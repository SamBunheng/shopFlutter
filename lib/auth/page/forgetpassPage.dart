import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future PasswordReset() async{
   try{
     await FirebaseAuth.instance.sendPasswordResetEmail(
      email: _emailController.text.trim());
      showDialog(context: context, builder: (context) {
      return AlertDialog(
        content: Text('Submit Succesfully'),
      );
    },);
   }on FirebaseAuthException catch(e){
    print(e);
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        content: Text(e.message.toString()),
      );
    },);
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Recovery Password',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500
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
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              MaterialButton(
                onPressed: PasswordReset,
                child: Text('Reset Password',),
                color: Colors.green[400],
                )
        ],
      ),
    );
  }
}