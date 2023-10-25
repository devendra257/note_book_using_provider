import 'package:note_book/database/app_database.dart';

class NoteModel {
  int? note_id;
  String title;
  String desc;

  NoteModel({this.note_id, required this.title, required this.desc});

  //* map to model convert..
//* factory is always return a class object..
//* koi b data excite karna chahta h or uske base me model generate hoke aa jaye..

//TODO: Creating a note model form map data..
//* note model create hoga from map data..
//* map ko note model me.
  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
        //* named Parameter call kar rahe h waha par note_id, title, and ye b bol skte h ki construter call kar rahe h..
        note_id: map[AppDataBase.NOTE_COLUMN_ID],
        title: map[AppDataBase.NOTE_COLUMN_TITLE],
        desc: map[AppDataBase.NOTE_COLUMN_DESC]);
  }

//TODO: Creating a Map model form Note data..

//* isme ab map data create karna note model..  isme note model me map me..

  Map<String, dynamic> toMap() {
    return {
      AppDataBase.NOTE_COLUMN_ID: note_id,
      AppDataBase.NOTE_COLUMN_TITLE: title,
      AppDataBase.NOTE_COLUMN_DESC: desc
    };
  }
}
