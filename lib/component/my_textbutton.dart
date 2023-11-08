import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../signin/sign_in.dart';
import '../signup/sign_up.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    required this.labelText,
    required this.pageRoute,
  });

  final String labelText;
  final String pageRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              if (pageRoute == 'Register') {
                //link to register page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SignUpScreen()), //go to sign up screen
                );
              } else if (pageRoute == 'SignIn') {
                //link to register page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SignInScreen()), //go to sign up screen
                );
              }
            },
            child: Text(
              labelText,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displaySmall,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}