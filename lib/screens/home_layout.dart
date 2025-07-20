import 'package:flutter/material.dart';
import 'package:note_app/screens/widget/note_item.dart';
import 'package:provider/provider.dart';
import '../providers/note_provider.dart';
import '../screens/add_note_bottom_sheet.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('My Notes'), centerTitle: true),
      body:
          noteProvider.notes.isEmpty
              ? const Center(child: Text('No notes yet.'))
              : ListView.builder(
                itemCount: noteProvider.notes.length,
                itemBuilder: (context, index) {
                  final note = noteProvider.notes[index];
                  return NoteItem(note: note);
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            builder: (context) => const AddNoteBottomSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
