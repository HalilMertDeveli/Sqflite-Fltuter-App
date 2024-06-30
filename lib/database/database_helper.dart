import 'dart:io';

import 'package:coming_back_project/model/dog.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, 'dog.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE DOG(
      id INTEGER PRIMARY KEY,
      name TEXT,
      age INTEGER,
    
    )



''');
  }

  Future<List<Dog>> getDogsFromDatabase() async {
    Database db = await instance.database;

    var dogs = await db.query('DOG', orderBy: 'name');

    List<Dog> dogList =
        dogs.isEmpty ? dogs.map((c) => Dog.fromMap(c)).toList() : [];

    return dogList;
  }
}
