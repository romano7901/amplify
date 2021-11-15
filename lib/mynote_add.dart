import 'package:amplify/mynotes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import 'mynote_repository.dart';
import 'package:image_picker/image_picker.dart';



class MyAddForm extends StatelessWidget {
  const MyAddForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Добавляем запись в Amplify';

    return  Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),

    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {


  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  String _myNote ='';
  String _myDesc ='';
  XFile? _imageFile;
  List<XFile>? _imageFileList;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              // The validator receives the text that the user has entered.
              decoration: InputDecoration(
                labelText: 'Заголовок метки',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (input) => _myNote = input!,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              // The validator receives the text that the user has entered.
              decoration: InputDecoration(
                labelText: 'Подробный текст',


              ),
              maxLines: 6,
              onSaved: (input) => _myDesc = input!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Expanded(

            child: _showSelectedImages(_imageFileList)

          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {

                  _getImage();

                },
                child: Text('Фото'),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all( 8.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.

                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  _formKey.currentState!.save();
                  //final _myRep = MyNoteRepository();
                 // _myRep.createMyNote(_myNote, _myDesc);

                 // if (_imageFileList != null) {
                 //   _myRep.uploadFiles(_imageFileList!);
                 // }
                  BlocProvider.of<MyNotesCubit>(context).addNote(_myNote, _myDesc, _imageFileList!);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  void _getImage() async {

    _imageFileList =  await _picker.pickMultiImage();

    setState(() {});

  }

  _showSelectedImages(List<XFile>? imageFileList) {
    if (_imageFileList == null) {
      return Image.asset('images/noimage.png', height: 100);

      
    } else {
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: imageFileList!.length,

          itemBuilder: (context, index) {
           // return  Image.file(File(imageFileList[index].path!),width: 50);

            return Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),

                  image:  DecorationImage(
                    image: FileImage(File(imageFileList[index].path!)),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );

          } // item builder
      ); // GridView
    }
  }

}