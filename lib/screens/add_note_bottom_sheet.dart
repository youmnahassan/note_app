import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/note_model.dart';
import '../../providers/note_provider.dart';

class AddNoteBottomSheet extends StatefulWidget {
  final NoteModel? note;

  const AddNoteBottomSheet({super.key, this.note});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _contentController = TextEditingController(
      text: widget.note?.content ?? '',
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _saveNote() {
    if (_formKey.currentState!.validate()) {
      final note = NoteModel(
        id: widget.note?.id,
        title: _titleController.text,
        content: _contentController.text,
        date: DateTime.now().toString(),
      );

      final provider = Provider.of<NoteProvider>(context, listen: false);

      if (widget.note == null) {
        provider.addNote(note);
      } else {
        provider.updateNote(note);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Wrap(
            children: [
              Text(
                widget.note == null ? 'Add Note' : 'Edit Note',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Please enter a title'
                            : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Content'),
                maxLines: 5,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Please enter content'
                            : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveNote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
