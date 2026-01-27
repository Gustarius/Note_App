import 'package:flutter/material.dart';
import 'package:note_app/notes_list_screen.dart';
import '../note.dart';
import '../database_helper.dart';

class EditNoteScreen extends StatefulWidget {
  final Note? note;
  const EditNoteScreen({super.key, this.note});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final _titleController = TextEditingController();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;

      _controller.text = widget.note!.content;
    }
  }

  void _saveNote() async {
    if (_titleController.text.isEmpty || _controller.text.isEmpty) return;

    if (widget.note == null) {
      await DatabaseHelper.instance.insertNote(
        Note(title: _titleController.text, content: _controller.text),
      );
    } else {
      await DatabaseHelper.instance.updateNote(
        Note(
          id: widget.note!.id,
          title: _titleController.text,
          content: _controller.text,
        ),
      );
    }
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NotesListScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Nouvelle Note",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Titre de la note"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Contenu de la note",
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveNote,
              child: const Text("Enregistrer"),
            ),
          ],
        ),
      ),
    );
  }
}
