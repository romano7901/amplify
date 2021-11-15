import 'package:amplify/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'mynotes_cubit.dart';
import 'models/MyNotes.dart';

class MyNotesView extends StatefulWidget {

  @override
  _MyNotesViewState createState() => _MyNotesViewState();
}

class _MyNotesViewState extends State<MyNotesView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        appBar: AppBar(title: Text('Amplify notes'),),
        body: BlocBuilder<MyNotesCubit,NotesState> (
          builder: (context,state) {
            if (state is ListNotesSuccess) {

              return _myNotesView(state.listNotes);
            } else {
              return Container(child: LoadingViewIndicator(),);

            }


          },

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () { Navigator.pushNamed(context, '/AddNote'); },
          child: Text('Адд'),
        ),
      )
    );
  }

  Widget _myNotesView(List<MyNotes> myNotes) {
     return ListView.builder(
       itemCount: myNotes.length,
       itemBuilder: (context,index) {
         var myNot = myNotes[index].MyNote!;
          if (myNotes[index].Images != null) { print ("dfsdfsdfsdfs"); print(myNotes[index].Images!.length);}
         return Card(
           child: Text(myNot),
         );
       },
     );
  }
}


