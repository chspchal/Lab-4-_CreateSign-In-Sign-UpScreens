import 'package:flutter/material.dart';
import 'package:todolist_app/components/button.dart';
import 'package:todolist_app/components/divider.dart';
import 'package:todolist_app/components/my_textfield.dart';
import 'package:todolist_app/components/social_media.dart';
import 'package:todolist_app/constant/constant.dart';
import 'package:todolist_app/screens/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background container
          Container(
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
                      GestureDetector(
                        child: Button(Title: 'Sign in'),
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
