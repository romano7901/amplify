import 'package:amplify/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:image_picker/image_picker.dart';
import 'models/MyNotes.dart';
import 'models/MyImages.dart';
import 'dart:io';

class MyNoteRepository {

  // get full notes list from Amplify
  Future<List<MyNotes>> getMyNotes() async {
    try {
     final myNotes = await Amplify.DataStore.query(MyNotes.classType);
     print (myNotes.length);
     return myNotes;
    } catch (e) {
      throw (e);
    }
  }

  // Ge images list

  // save new note
  Future<String> createMyNote(String note, String desc) async {
     final myNote = MyNotes(MyNote: note, Desc: desc);

     try {
       await Amplify.DataStore.save(myNote);
       return myNote.id;
     } catch (e) {
       throw (e);
     }
  }

  Future<String> uploadFile(File file) async {

    final fileName = DateTime.now().toIso8601String();
    final result = await Amplify.Storage.uploadFile(local: file, key: fileName + '.jpg');
    print (result.key);
    return result.key;
  }

  Future<void> uploadFiles(List<XFile> files,String myNoteId) async {


    for (var file in files) {
      final fileName = DateTime.now().toIso8601String();
      final result = await Amplify.Storage.uploadFile(
          local: File(file.path), key: fileName + '.jpg');
      final myImage = MyImages(imKey: result.key,mynotesID: myNoteId);
      await Amplify.DataStore.save(myImage);

    }


  }

}
