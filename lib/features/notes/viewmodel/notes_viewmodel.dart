import 'package:flutter/material.dart';
import '../../../data/models/note.dart';
import '../../../data/repositories/notes_repository.dart';

class NotesViewModel extends ChangeNotifier {
  final NotesRepository _repository = NotesRepository();
  List<Note> _notes = [];
  Note? _recentlyDeleted;
  int? _recentlyDeletedIndex;

  List<Note> get notes => _notes;

  NotesViewModel() {
    loadNotes();
  }

  Future<void> loadNotes() async {
    _notes = await _repository.getNotes();
    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    await _repository.addNote(note);
    await loadNotes();
  }

  Future<void> updateNote(int index, Note note) async {
    await _repository.updateNote(index, note);
    await loadNotes();
  }

  Future<void> deleteNote(int index) async {
    if (_notes.isEmpty || index < 0 || index >= _notes.length) return;
    // Store the note before deleting
    _recentlyDeleted = _notes[index];
    _recentlyDeletedIndex = index;
    await _repository.deleteNote(index);
    await loadNotes();
  }

  Future<void> undoDelete() async {
    if (_recentlyDeleted != null) {
      final box = await _repository.getBox();
      await box.add(_recentlyDeleted!); // Add at the end
      await loadNotes();
      _recentlyDeleted = null;
      _recentlyDeletedIndex = null;
    }
  }
}