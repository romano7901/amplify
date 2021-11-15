import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'mynotes_cubit.dart';
import 'mynotes_view.dart';
import 'mynote_add.dart';
import 'loading_view.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    // Add the following lines to your app initialization to add the DataStore plugin
    //AmplifyDataStore datastorePlugin =
    //AmplifyDataStore(modelProvider: ModelProvider.instance);
    //Amplify.addPlugin(datastorePlugin);
    await
    Amplify.addPlugins([AmplifyAuthCognito(),AmplifyDataStore(modelProvider: ModelProvider.instance), AmplifyStorageS3()]);

    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
    setState(() {
      _amplifyConfigured = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyNotesCubit()..getNotes(),
      child: MaterialApp(
        initialRoute: '/',
        routes: <String,WidgetBuilder> {
          '/': (context) => _amplifyConfigured ? MyNotesView() :LoadingViewIndicator(),
          '/AddNote': (context) => MyAddForm(),
        },
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
      ),
    );
  }
}






