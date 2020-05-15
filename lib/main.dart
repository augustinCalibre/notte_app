import 'package:flutter/material.dart';
// import 'package:moor/backends.dart';
import 'package:note_app/db/notedb.dart';
// import 'package:note_app/db/notedb.dart';
import 'package:note_app/ui/accueil.dart';
import 'package:provider/provider.dart';
// import 'package:moor/moor.dart';
// import 'package:moor_ffi/moor_ffi.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;
// import 'dart:io';   


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
       return  Provider<AppDatabase>(
      create:(_)=>AppDatabase(),

      child:MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      accentColor: Color.fromRGBO(47, 93, 236, 1.0),
      primarySwatch: Colors.indigo,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Accueil(),
    )); 
  }
}
