

import 'dart:io';

import 'package:app_db/data/models/story.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{

 static const _dbName = "story.db";
 static const  _dbVersion = 2;

 static const tableName = "Story";
 static const columnId = "_id";
 static const columnTitle = "title";
 static const columnCover = "cover"; 

DbHelper._privateConstructor();

static final DbHelper instance =  DbHelper._privateConstructor();

static Database? _db;

Future<Database> get database async {
    if(_db != null) return _db!;
    _db = await _initDb();
    return _db!;
}

_initDb() async {
  Directory docsDir = await getApplicationDocumentsDirectory();

  String path = join(docsDir.path, _dbName);

  return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);

}

Future _onCreate(Database db, int version) async{

  await db.execute(
      'CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY, $columnTitle TEXT, $columnCover TEXT)',
      
  );

}

Future<int> insertStory(Story story) async {
 
  final db  = await instance.database;
  final int id = await db.insert(tableName, story.toMap()); 
  return id;
}

Future<List<Story>> getStories() async {
  Database db = await instance.database;
  final List<Map<String, dynamic>> rows = await db.query(tableName);
  
  return List.generate(rows.length, (index){
       return Story(
         id: rows[index]['_id'],
         title: rows[index]['title'],
         cover: rows[index]['cover'],
       );
  });
}

Future<int> updateStory(Story story) async{
     Database db = await instance.database;

     return db.update(tableName, story.toMap(), where: '_id = ?', whereArgs: [story.id]);
}

Future<int> deleteStory(int id) async{
     Database db = await instance.database;

     return db.delete('Story', where: '_id = ?', whereArgs: [id]);
}







}