import 'package:final_project/auth.dart';
import 'package:final_project/signin/sign_in.dart';
import 'package:flutter/material.dart';
//import 'package:onboarding_screen/screens/onboarding-screen.dart';
//import 'signin/sign_in.dart';
//import 'package:onboarding_screen/screens/onboarding-screen.dart';
//import 'package:onboarding_screen/signin/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:onboarding_screen/auth.dart';
//import 'package:onboarding_screen/signin/sign_in.dart';
import 'firebase_options.dart';

// ...

// await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  //const use when u want to fix a value : Final not fix value
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding -screen',
      theme: ThemeData.light(useMaterial3: true),
      home: SignInScreen(),
    );
  }
}