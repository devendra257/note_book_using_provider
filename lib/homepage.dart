import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_book/create_note.dart';
import 'package:note_book/description.dart';
import 'package:note_book/model/note_model.dart';
import 'package:note_book/note_provider/note_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NoteModel> noteList = [];

  // late AppDataBase myDB;

  @override
  void initState() {
    super.initState();
    // myDB = AppDataBase.db;

    getNotes(context);
  }

  void getNotes(BuildContext context) async {
    Provider.of<NoteProvider>(context, listen: false).fetchNotes();

    // noteList = await myDB.fetchAllNotes();
    // //* setstate isliye call hua ki wo data to aa raha but ui me update ni then add note call hone ke bas data show hota h isliye hum setstate isme b call kar rahe qki wo data ho aane ke bad refresh kar de wo..
    // setState(() {});
  }

  // void addNotes(String title, String desc) async {
  //   // bool check = await myDB.addNote(NoteModel(title: title, desc: desc));

  //   // if (check) {
  //   //   noteList = await myDB.fetchAllNotes();

  //   //   setState(() {});
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    getNotes(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff252525),
        body: Padding(
          padding: const EdgeInsets.only(top: 11, left: 11, right: 11),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                //* top content
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    //* Notes Text
                    'Notes',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    //* Search Icon
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 71, 71, 71),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.search,
                      size: 35,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              //* Note View
              Expanded(
                child: Consumer<NoteProvider>(
                  //! it is very imp line...
                  builder: (_, provider, __) {
                    return GridView.builder(
                      itemCount: provider.getNotes().length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 2.5 / 3,
                      ),
                      itemBuilder: (_, index) {
                        var currentData = provider.getNotes()[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DescriptionPage(
                                  titleName: currentData.title,
                                  desc: currentData.desc,
                                  id: currentData.note_id!,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color((Random().nextDouble() * 0xFFFF00)
                                        .toInt())
                                    .withOpacity(1)
                                // color: Colors.primaries[
                                //     Random().nextInt(Colors.primaries.length)],
                                ),
                            child: Padding(
                                padding: const EdgeInsets.all(11.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //* Title Text
                                    Text(
                                      "${currentData.title}",
                                      // "${noteList[index].title}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    //* Desc Text
                                    Text(
                                      "${currentData.desc}",
                                      maxLines: 6,
                                      // "${noteList[index].title}",
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),

                                    //* Delele Note
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: IconButton(
                                        onPressed: () {
                                          context
                                              .read<NoteProvider>()
                                              .deleteNote(currentData.note_id!);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xff252525),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateNote()),
            );
          },
          label: const Text(
            'Create',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
