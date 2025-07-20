import 'package:flutter/material.dart';
import '../data/database_helper.dart';
import '../models/note_model.dart';

class NoteProvider with ChangeNotifier {
  List<NoteModel> _notes = [];

  List<NoteModel> get notes => _notes;

  Future<void> loadNotes() async {
    _notes = await DatabaseHelper.instance.getNotes();
    notifyListeners();
  }

  Future<void> addNote(NoteModel note) async {
    await DatabaseHelper.instance.insertNote(note);
    await loadNotes();
  }

  Future<void> updateNote(NoteModel note) async {
    await DatabaseHelper.instance.updateNote(note);
    await loadNotes();
  }

  Future<void> deleteNote(int id) async {
    await DatabaseHelper.instance.deleteNote(id);
    await loadNotes();
  }

  Future<void> fetchNotes() async {
    _notes = await DatabaseHelper.instance.getAllNotes();
    notifyListeners();
  }
}
