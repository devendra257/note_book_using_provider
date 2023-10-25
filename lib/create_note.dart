import 'package:flutter/material.dart';
import 'package:note_book/model/note_model.dart';
import 'package:note_book/note_provider/note_provider.dart';
import 'package:provider/provider.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  var descController = TextEditingController();
  var titleController = TextEditingController();

  void addNotes(String title, String desc, BuildContext context) async {
    context.read<NoteProvider>().addNote(NoteModel(title: title, desc: desc));
    // bool check = await myDB.addNote(NoteModel(title: title, desc: desc));

    // if (check) {
    //   noteList = await myDB.fetchAllNotes();

    //   setState(() {});
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff252525),
        title: const Text(
          'Create Note',
        ),
        actions: [
          GestureDetector(
            //* Save Button
            onTap: () {
              var title = titleController.text.toString();
              var desc = descController.text.toString();

              addNotes(title, desc, context);
              //* add calling
              titleController.clear();
              descController.clear();
              Navigator.pop(context);
            },
            child: Container(
              width: 80,
              height: 50,
              margin: const EdgeInsets.only(right: 21),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 71, 71, 71),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              //* Title Text Field
              controller: titleController,
              style: TextStyle(color: Colors.white, fontSize: 40),
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 136, 136, 136), fontSize: 40),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TextField(
                //* Something Text Field

                controller: descController,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                maxLines: MediaQuery.of(context).size.hashCode,
                decoration: const InputDecoration(
                  hintText: 'Type Something......',
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 136, 136, 136), fontSize: 20),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
