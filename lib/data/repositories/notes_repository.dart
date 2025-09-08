import 'package:hive/hive.dart';
import '../models/note.dart';

class NotesRepository {
  static const boxName = 'notesBox';

  Future<Box<Note>> getBox() async { // <-- Make this public
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(NoteAdapter());
    }
    return await Hive.openBox<Note>(boxName);
  }

  Future<List<Note>> getNotes() async {
    final box = await getBox();
    return box.values.toList();
  }

  Future<void> addNote(Note note) async {
    final box = await getBox();
    await box.add(note);
  }

  Future<void> updateNote(int index, Note note) async {
    final box = await getBox();
    await box.putAt(index, note);
  }

  Future<void> deleteNote(int index) async {
    final box = await getBox();
    await box.deleteAt(index);
  }
}