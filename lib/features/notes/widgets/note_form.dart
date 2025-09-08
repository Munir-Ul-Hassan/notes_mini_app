import 'package:flutter/material.dart';
import 'package:notes/data/models/note.dart';

class NoteForm extends StatefulWidget {
  final String? initialTitle;
  final String? initialDescription;
  final void Function(String title, String description) onSave;

  const NoteForm({
    super.key,
    this.initialTitle,
    this.initialDescription,
    required this.onSave,
    });

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;

  @override
  void initState() {
    super.initState();
    _title = widget.initialTitle ?? '';
    _description = widget.initialDescription ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16, right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        top: 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _title,
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? 'Title cannot be empty' : null,
              onChanged: (value) => _title = value,
            ),
            const SizedBox(height: 8),
            TextFormField(
              initialValue: _description,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
              onChanged: (value) => _description = value,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSave(_title.trim(), _description.trim());
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}