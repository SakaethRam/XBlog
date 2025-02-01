import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xblog/Auth/signin_sect.dart';
import 'package:xblog/Design/components.dart';
import 'package:xblog/Design/google/apple_auth.dart';
import 'package:xblog/Design/signin.dart';
import 'package:xblog/main.dart';

class LoginSect extends StatefulWidget {
  LoginSect({super.key});

  @override
  State<LoginSect> createState() => _LoginSectState();
}

class _LoginSectState extends State<LoginSect> {
  //Text Editing Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Track the error message
  String? errorMessage;

  //Sign User In Method
  void signUserIn() async {
    setState(() {
      errorMessage = null; // Reset error message
    });

    try {
      // Try signing in the user
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Navigate to home screen if successful
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()), // Navigate to your home screen
      );
    } on FirebaseAuthException catch (e) {
      // Catch Firebase authentication errors and display a message
      setState(() {
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Incorrect password. Please try again.';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'Invalid email address.';
        } else {
          errorMessage = 'An error occurred. Please try again.';
        }
      });
    } catch (e) {
      // Catch other errors
      setState(() {
        errorMessage = 'An unexpected error occurred. Please try again.';
      });
    }
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
                  const SizedBox(height: 75),

                  // Logo
                  const Image(
                    image: AssetImage('assets/X.png'), // Path to your logo
                    height: 100,
                    width: 100,
                  ),

                  const SizedBox(height: 30),

                  // Welcome Text
                  Text(
                    'Welcome Back, you\'ve been missed!',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                      fontFamily: 'ModernAntiqua',
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Email TextField
                  MyAuthTextField(
                    controller: emailController,
                    hintText: 'E-mail',
                    obscureText: false,
                  ),

                  const SizedBox(height: 20),

                  // Password TextField
                  MyAuthTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 25),

                  // Error Message
                  if (errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        errorMessage!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                  const SizedBox(height: 25),

                  // Forgot Password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.brown,
                            fontFamily: 'ModernAntiqua',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Sign In Button
                  SignBtn(
                    text: 'Sign In',
                    onTap: signUserIn,
                  ),

                  const SizedBox(height: 25),

                  // Or Continue with
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

                  // Google + Apple auth
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      AppleAuth(ImagePath: 'assets/Google.png'),
                      SizedBox(width: 25),
                      AppleAuth(ImagePath: 'assets/Apple.png'),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Not a Member? Register Now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 2),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignSect()), // Replace with your next page
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.brown, fontFamily: 'Poppins'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
