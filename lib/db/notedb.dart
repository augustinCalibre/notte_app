// import 'dart:async';
import 'package:moor_flutter/moor_flutter.dart';
// import 'package:path/path.dart';
// import 'package:provider/provider.dart';
import 'package:moor/moor.dart';
// import 'package:path_provider/path_provider.dart';

part 'notedb.g.dart';

class Note extends Table{
  IntColumn get id=> integer().autoIncrement().call();
  TextColumn get titre=>text().withLength(min:1,max:50)();
  TextColumn get description=>text().withLength(min:1,max:50)();
  DateTimeColumn get date=> dateTime().nullable()();
  BoolColumn get etat=>boolean().withDefault(Constant(false))();
}



@UseMoor(tables: [Note])
 class AppDatabase extends _$AppDatabase {
   
  // we tell the database where to store the data with this constructor
  AppDatabase():super(FlutterQueryExecutor.inDatabaseFolder( path: 'db.sqlite',logStatements: true));
  @override
  int get schemaVersion => 1; 

//  // you should bump this number whenever you change or add a table definition. Migrations
//   // are covered later in this readme.
  
  
  Future<List<NoteData>> getAllNote()=>select(note).get();
  Stream<List<NoteData>> watchAllNote()=>select(note).watch();

  Future <void> addNote(NoteData notes)async{
    await into(note).insert(notes);
  }
  
  // Future<void> addWord(String word) async {
  //    await into(note).insert(
  //      NoteData.insert(word: word, occurrences: 1),
       
  //  );
   
  // }
   
 }
 

