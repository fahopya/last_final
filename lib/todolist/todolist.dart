import 'package:flutter/material.dart';
import '../component/firestore.dart';
import '../component/note_model.dart';
import 'edit_note_screen.dart';

class ToDoList extends StatefulWidget {
  Note _note;
  ToDoList(this._note, {super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
          child: Row(
            children: [
              ImageWidget(), //child property of container
              const SizedBox(
                width: 20,
              ),
              TextWidget()
            ],
          ),
        ),
      ),
    );
  }

  Column TextWidget() {
    bool isDone = widget._note.isDone;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget._note.title,
            ),
            Checkbox(
              activeColor: const Color.fromARGB(255, 68, 137, 103),
              value: isDone,
              onChanged: (value) {
                setState(() {
                  isDone = !isDone;
                  Firestore_Datasource().isdone(widget._note.id, isDone);
                });
              },
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget._note.subtitle,
        ),
        const SizedBox(
          height: 20,
        ),
        btnWidget(),
      ],
    );
  }

  Row btnWidget() {
    return Row(
      children: [
        Container(
          width: 80,
          height: 28,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 68, 137, 103),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.timelapse,
                color: Color.fromARGB(255, 241, 231, 196),
                size: 18,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget._note.time,
                style: const TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 241, 231, 196)),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditNoteScreen(widget._note)));
          },
          child: Container(
            width: 80,
            height: 28,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 241, 231, 196),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit,
                  color: Color.fromARGB(255, 68, 137, 103),
                  size: 18,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'edit',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 68, 137, 103)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container ImageWidget() {
    return Container(
      width: 100,
      height: 130,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        image: DecorationImage(
            image: AssetImage('assets/image/${widget._note.image}.png'),
            fit: BoxFit.cover),
      ),
    );
  }
}