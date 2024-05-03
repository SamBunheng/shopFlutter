import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
  import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop/auth/page/forgetpassPage.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({
    super.key,
    required this.showRegisterPage
    });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _pwController = TextEditingController();


Future signIn() async{
  //loading circle
  showDialog(
    context: context, 
    builder: (context) {
      return Center(
        child: CircularProgressIndicator());
    },);
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailController.text.trim(), 
    password: _pwController.text.trim()
    );
    
    //pop the circle
    Navigator.of(context).pop();
}
  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose(); 
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.android,
              size: 100,
              color: Colors.green.shade400,),
              Text('Hello Again!',
              style: GoogleFonts.bebasNeue(
                fontWeight: FontWeight.bold,
                fontSize: 52,
              ),),
              Text('Welcome back, you\'ve been missed!',
              style: GoogleFonts.roboto(
                fontSize: 20,
              ),),
              const SizedBox(height: 20),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                          return ForgetPasswordPage();
                        }));
                      },
                      child: Text('Forget Password?',
                      style: GoogleFonts.roboto(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green.shade400,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
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
                    'Not a member?',
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text('Register Now',
                    style: GoogleFonts.roboto(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),),
                  )
                ],
              )
            ],
          ),
        )),
    );
  }
}