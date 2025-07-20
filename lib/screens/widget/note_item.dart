import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/note_model.dart';
import '../../providers/note_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import '../add_note_bottom_sheet.dart';

class NoteItem extends StatelessWidget {
  final NoteModel note;

  const NoteItem({super.key, required this.note});

  void _editNote(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => AddNoteBottomSheet(note: note),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          note.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.content),
            const SizedBox(height: 4),
            Text(
              DateFormat(
                'yyyy-MM-dd – HH:mm',
              ).format(DateTime.parse(note.date)),
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.deepPurple),
              onPressed: () => _editNote(context),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                Provider.of<NoteProvider>(
                  context,
                  listen: false,
                ).deleteNote(note.id!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
