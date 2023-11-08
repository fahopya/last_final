import 'package:final_project/component/my_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../component/my_iconbutton.dart';
import '../component/my_textbutton.dart';
import '../component/my_textfield.dart';
import '../screens/welcome_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  createUserWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
           Navigator.push(
        context,
        MaterialPageRoute(builder:(context)=> WelcomeScreen())
      );

      _showMyDialog('Create successfully.');
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);

      if (e.code == 'weak-password') {
        print('The password is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('There is already a user in the firebase.');
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
                "Welcome to register!",
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
                "Please sign up with your email and password.",
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
                  controller: nameController,
                  HintText: 'Please input your name',
                  LabelText: 'Name',
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  controller: emailController,
                  HintText: 'Enter your email',
                  LabelText: 'Email',
                  obscureText: false),
              const SizedBox(height: 25),
              MyTextField(
                  controller: passwordController,
                  HintText: 'Enter your password',
                  LabelText: 'Password',
                  obscureText: true),
              const SizedBox(height: 25),
              MyTextField(
                  controller: passwordController,
                  HintText: 'Confirm your password',
                  LabelText: 'confirm your password',
                  obscureText: true),
              const SizedBox(height: 25),
              // const MyTextButton(
              //   labelText: 'Forgot password?',
              //   pageRoute: 'Forgot',
              // ),
              const SizedBox(
                height: 25,
              ),
              MyButton(
                  onTap: createUserWithEmailAndPassword, hintText: 'Sign Up'),
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
                        'already have member',
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
                    MyTextButton(
                      labelText: 'Sign in',
                      pageRoute: 'SignIn',
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