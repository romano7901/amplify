import 'dart:io';

import 'package:amplify/mynote_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'models/MyNotes.dart';

abstract class NotesState {}

class ListNotesLoading extends NotesState {}

class NewNoteAdding extends NotesState {
}

class NoteAdded extends NotesState {}

class ListNotesSuccess extends NotesState {
  final List<MyNotes> listNotes;

  ListNotesSuccess(this.listNotes);
}

class ListNotesFailure extends NotesState {
  final String exception;

  ListNotesFailure(this.exception);
}

class MyNotesCubit extends Cubit<NotesState> {
  final _myRep = MyNoteRepository();

  MyNotesCubit() : super(ListNotesLoading());

  void getNotes() async {
    if (state is ListNotesSuccess == false) {
      emit(ListNotesLoading());
    }
    try {
      final noteList = await _myRep.getMyNotes();
      emit(ListNotesSuccess(noteList));
    } catch (e) {}
  }

  void addNote(String myNote,String myDesc,List<XFile> imageFileList) async {
      emit(NewNoteAdding());
      try {
        var myNoteId ='';
        myNoteId = await _myRep.createMyNote(myNote, myDesc);
        await _myRep.uploadFiles(imageFileList,myNoteId);
        getNotes();

      } catch (e) {
        emit(ListNotesFailure(e.toString()));
      }
  }
}
