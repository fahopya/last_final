import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'component/stream_note.dart';
import 'main.dart';
import 'todolist/add_note_screen.dart';

class LoginSuccessPage extends StatefulWidget {
  const LoginSuccessPage({super.key});

  @override
  State<LoginSuccessPage> createState() => _LoginSuccessPageState();
}

class _LoginSuccessPageState extends State<LoginSuccessPage> {
  final user = FirebaseAuth.instance.currentUser;

  bool show = true;

  void signOutUser() async {
    await FirebaseAuth.instance.signOut(); //it will sign out from firebase
    const MyApp(); //call myapp
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 68, 137, 103),
        centerTitle: true,
        title: Text(
          'Task Management',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 24,
              fontStyle: FontStyle.normal,
              color: Colors.white,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: signOutUser,
            icon: const Icon(
              Icons.login,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            setState(() {
              show = true;
            });
          }
          if (notification.direction == ScrollDirection.reverse) {
            setState(() {
              show = true;
            });
          }
          return true;
        },
        child: Column(
          children: [
            StreamNote(false),
            const Text(
              'isDone',
              style: TextStyle(color: Colors.black38),
            ),
            StreamNote(true),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  const AddNoteScreen())); //it will open page add_note_screen
        },
        backgroundColor: const Color.fromARGB(255, 190, 75, 67),
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),

      // body: Text('Hello,' + user!.email.toString()),
    );
  }
}