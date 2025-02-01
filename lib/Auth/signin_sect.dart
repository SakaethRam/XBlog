import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xblog/Auth/login_sect.dart';
import 'package:xblog/Design/components.dart';
import 'package:xblog/Design/google/apple_auth.dart';
import 'package:xblog/Design/signin.dart';

class SignSect extends StatelessWidget {
  SignSect({super.key});

  //Text Editing Controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  //Sign User Up Method
  void signUserUp(BuildContext context) async {
    //SHOW LOADING CIRCLE
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //TRY CREATING USER
    try {
      if (passwordController.text == passwordConfirmController.text) {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        //After Creating a user, create a new doc in Firestore called Users
        FirebaseFirestore.instance.
        collection("Users")
        .doc(userCredential.user!.email)
        .set({
          'username' : emailController.text.split('@')[0], //Initial Username
          'bio' : 'Empty Bio..' //Initially Empty
        });

      } else {
        //SHOW ERROR MESSAGE
        showErrorMessage(context, "Passwords don't match!");
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //Pop the loading circle
      Navigator.pop(context);
      //Show Error Message
      showErrorMessage(context, e.code);
    }
  }

  //Show Error Message Method
  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // Left-to-right direction
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  // Logo
                  const Image(
                    image: AssetImage('assets/X.png'),
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 30),
                  // Welcome Text
                  Text(
                    'Let\'s create an account for you!',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                      fontFamily: 'ModernAntiqua',
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Username TextField
                  MyAuthTextField(
                    controller: emailController,
                    hintText: 'E-mail',
                    obscureText: false,
                  ),
                  const SizedBox(height: 15),
                  //Password TextField
                  MyAuthTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  //Password Confirm TextField
                  MyAuthTextField(
                    controller: passwordConfirmController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),
                  //Sign Up Button
                  SignBtn(
                    text: 'Sign Up',
                    onTap: () => signUserUp(context),
                  ),
                  const SizedBox(height: 25),
                  //Or Continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[600],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or Continue With',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  //Google + Apple auth
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      //Google Btn
                      AppleAuth(ImagePath: 'assets/Google.png'),
                      SizedBox(width: 25),
                      //Apple Btn
                      AppleAuth(ImagePath: 'assets/Apple.png'),
                    ],
                  ),
                  const SizedBox(height: 30),
                  //Not a Member? Register Now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 2),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginSect()),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.brown,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
