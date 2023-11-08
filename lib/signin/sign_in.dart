import 'package:final_project/auth.dart';
import 'package:final_project/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/my_button.dart';
import '../component/my_iconbutton.dart';
import '../component/my_textbutton.dart';
import '../component/my_textfield.dart';


class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signInuser() async {
    if (emailController.text != "" && passwordController.text != "") {
      print("It's ok");
    } else {
      print("Please input your email ad password");
    }
  }

  signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder:(context)=> const WelcomeScreen())
      );

      _showMyDialog('Login successfully.');
    } on FirebaseAuthException catch (e) {
      // check e.error
      print('Failed with error code: ${e.code}');
      print(e.message);

      if (e.code == 'invalid-email') {
        _showMyDialog('No user found for that email.');
        // print('No user found for that email.');
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        // print('Wrong password provided for that user.');
        _showMyDialog('Wrong password provided for that user.');
      }
    }
  }

  void _showMyDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            title: const Text('AlertDialog Title'),
            content: Text(txtMsg),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Color.fromARGB(255, 190, 75, 67)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Form(
          child: Column(
            children: [
              const Spacer(),
              Text(
                "Welcome to After Ice-Cream!",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Please sign in with your email and password.",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                  controller: emailController,
                  HintText: 'Please input your email',
                  LabelText: 'Email',
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  controller: passwordController,
                  HintText: 'Enter your password',
                  LabelText: 'Password',
                  obscureText: true),
              const SizedBox(height: 25),
              const MyTextButton(
                labelText: 'Forgot password?',
                pageRoute: 'Forgot',
              ),
              const SizedBox(
                height: 25,
              ),
              MyButton(onTap: signInWithEmailAndPassword, hintText: 'Sign in'),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'or continue with',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyIconButton(imagePath: 'assets/apple.png'),
                  SizedBox(
                    width: 10,
                  ),
                  MyIconButton(imagePath: 'assets/facebook.webp')
                ],
              ),
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?'),
                    MyTextButton(
                      labelText: 'Register now',
                      pageRoute: 'Register',
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}