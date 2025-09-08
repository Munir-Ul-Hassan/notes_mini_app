import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/notes_viewmodel.dart';
import '../../../data/models/note.dart';
import '../widgets/note_card.dart';
import '../widgets/note_form.dart';
import '../../settings/viewmodel/theme_viewmodel.dart'; // <-- Import ThemeViewModel

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              Provider.of<ThemeViewModel>(context, listen: false).toggleTheme();
            },
            tooltip: 'Toggle Theme',
          ),
        ],
      ),
      body: Consumer<NotesViewModel>(
        builder: (context, vm, _) {
          if (vm.notes.isEmpty) {
            return const Center(child: Text('No notes yet.'));
          }
          return ListView.builder(
            itemCount: vm.notes.length,
            itemBuilder: (context, index) {
              final note = vm.notes[index];
              return Dismissible(
                key: Key(note.title + index.toString()),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (_) async {
                  await vm.deleteNote(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Note deleted'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () async {
                          await vm.undoDelete();
                        },
                      ),
                    ),
                  );
                },
                child: NoteCard(
                  note: note,
                  onEdit: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => NoteForm(
                        onSave: (title, desc) async {
                          await vm.updateNote(index, Note(title: title, description: desc));
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => Builder(
              builder: (modalContext) => NoteForm(
                onSave: (title, desc) async {
                  await Provider.of<NotesViewModel>(modalContext, listen: false)
                      .addNote(Note(title: title, description: desc));
                  Navigator.pop(modalContext);
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}