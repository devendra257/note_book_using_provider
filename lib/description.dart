import 'package:flutter/material.dart';
import 'package:note_book/model/note_model.dart';
import 'package:note_book/note_provider/note_provider.dart';
import 'package:provider/provider.dart';

class DescriptionPage extends StatelessWidget {
  String titleName;
  String desc;
  int id;
  var titleController = TextEditingController();
  var descController = TextEditingController();

  DescriptionPage({
    super.key,
    required this.titleName,
    required this.desc,
    required this.id,
  });

  updateNote(String title, String desc, BuildContext context, int id) {
    Provider.of<NoteProvider>(context, listen: false)
        .updateNote(NoteModel(title: title, desc: desc, note_id: id));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff252525),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                //* top content
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      //* Back Icon
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 71, 71, 71),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    //* Edit Icon
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 71, 71, 71),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {
                        titleController.text = titleName;
                        descController.text = desc;
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 400,
                              child: Padding(
                                padding: const EdgeInsets.all(11.0),
                                child: Column(
                                  children: [
                                    //* Update Notes
                                    const Text(
                                      'Update Note',
                                      style: TextStyle(fontSize: 21),
                                    ),
                                    const SizedBox(
                                      height: 11,
                                    ),
                                    TextField(
                                      controller: titleController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Title',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(21.0),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 11,
                                    ),
                                    TextField(
                                      controller: descController,
                                      maxLines: 5,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Desc',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(21.0),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 11,
                                    ),

                                    //* Update Button
                                    ElevatedButton(
                                      child: const Text('Update'),
                                      onPressed: () {
                                        var title =
                                            titleController.text.toString();
                                        var desc =
                                            descController.text.toString();
                                        updateNote(title, desc, context, id);

                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.edit_note,
                        size: 38,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                titleName,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 31,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                desc,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
