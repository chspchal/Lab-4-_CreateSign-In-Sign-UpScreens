import 'package:flutter/material.dart';
import 'package:todolist_app/components/button.dart';
import 'package:todolist_app/components/divider.dart';
import 'package:todolist_app/components/my_textfield.dart';
import 'package:todolist_app/components/social_media.dart';
import 'package:todolist_app/constant/constant.dart';
import 'package:todolist_app/screens/index.dart';
import 'package:todolist_app/screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  void _showDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            backgroundColor: Colors.amber,
            title: const Text('Sign Up'),
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
          ),
        );
      },
    );
  }

  void signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      _showDialog('Sign up successfully');
    } on FirebaseException catch (e) {
      _showDialog('Failed to create the account');
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
              'assets/images/background2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Foreground content (Form)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Form(
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min, // Makes the container fit content
                    children: [
                      Text(
                        "Create an account",
                        textAlign: TextAlign.center,
                        style: Head,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Let's expand your world with us",
                        style: SubHead,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),

                      MyTextField(
                        controller: usernameController,
                        labelText: "Username",
                        obscureText: false,
                        hintText: "Enter your username",
                      ),
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 20),

                      MyTextField(
                        controller: confirmpasswordController,
                        labelText: "Confirm Password",
                        obscureText: true,
                        hintText: "Re-enter your password",
                      ),

                      const SizedBox(height: 30),

                      // Sign In Button
                      Button(onTap: signUp, Title: 'Sign up'),

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
                          Text("Already have an account", style: SubText),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SignInScreen()),
                              );
                            },
                            child: Text(
                              'Sign In',
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
