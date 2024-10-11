import 'package:flutter/material.dart';
import 'package:todolist_app/components/button.dart';
import 'package:todolist_app/components/divider.dart';
import 'package:todolist_app/components/my_textfield.dart';
import 'package:todolist_app/components/social_media.dart';
import 'package:todolist_app/constant/constant.dart';
import 'package:todolist_app/screens/index.dart';
import 'package:todolist_app/screens/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _showDialog(String txtMsg) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.amber,
        title: const Text('Sign In'),
        content: Text(txtMsg),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Index()), // Navigate to Index screen
              );
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}


  //function signInUser
  void signInUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      _showDialog('Login successfully');
    } on FirebaseAuthException catch (e) {
      _showDialog('Failed to sign in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background container
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Foreground content (Form)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Form(
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min, // Makes the container fit content
                    children: [
                      Text(
                        "Welcome Back!",
                        textAlign: TextAlign.center,
                        style: Head,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Connect with your trends today",
                        style: SubHead,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),

                      // Email Field
                      MyTextField(
                        controller: emailController,
                        labelText: "Email",
                        obscureText: false,
                        hintText: "Enter your email",
                      ),
                      const SizedBox(height: 20),

                      // Password Field
                      MyTextField(
                        controller: passwordController,
                        labelText: "Password",
                        obscureText: true,
                        hintText: "Enter your password",
                      ),

                      // Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextLink,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // Sign In Button
                      Button(
                        onTap: signInUser,
                        Title: 'Sign in',
                      ),

                      const SizedBox(height: 20),

                      // OR Divider with line
                      DividerPart(),

                      const SizedBox(height: 10),

                      // Social Media Buttons
                      SocialMedia(),

                      const SizedBox(height: 10),

                      // Sign Up Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account yet?", style: SubText),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SignUpScreen()),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: TextLink,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
