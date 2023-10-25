import 'package:flutter/foundation.dart';
import 'package:note_book/database/app_database.dart';
import 'package:note_book/model/note_model.dart';

class NoteProvider extends ChangeNotifier {
  List<NoteModel> _arrNotes = [];
  AppDataBase db = AppDataBase.db;

//* DATABASE ko constrator ke though me la skte h hum like
// AppDataBase db;
// NoteProvider({required this.db});

  // List<NoteModel>   List model ko use isliye ni kar rhe h qki wo fetchNotes call hoga to future value le ke aayega isliye list note model ko remove karke aisi call kar rahe hai..
  //* To get initial notes when app is opened

  fetchNotes() async {
    _arrNotes = await db.fetchAllNotes();
    notifyListeners();
  }

  List<NoteModel> getNotes() {
    return _arrNotes; //copy of list
  }

  //* To Add Note...
  addNote(NoteModel newNote) async {
    var check = await db.addNote(newNote);
    if (check) {
      //* iska ye mtlb ki hum jab notes ko call karenge to addnote hoga mtlb 5 note h 6 aayega phir fetch karna hoga note ko or notify karna hoga isliye hum wo call kiye hai...
      // _arrNotes = await db.fetchAllNotes();
      // notifyListeners();
      fetchNotes();
    }
  }

//* Delete data
  deleteNote(int id) async {
    // _arrNotes.removeAt(id);
    await db.deleteNote(id);
    fetchNotes();
    // notifyListeners();
  }

//* Update Data
  updateNote(NoteModel newModel) async {
    var check = await db.updateNote(newModel);
    if (check) {
      fetchNotes();
    }
  }
}
