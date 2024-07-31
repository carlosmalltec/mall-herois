// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';

import 'package:sqflite/sqflite.dart';

class ConnectionSqfliteService {
  static final ConnectionSqfliteService _instance =
      ConnectionSqfliteService.getInstance();
  ConnectionSqfliteService.getInstance();

  factory ConnectionSqfliteService() => _instance;

  Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future _initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'heroes_2024.db');
    debugPrint("db $path");

    var db = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    String s = await rootBundle.loadString("assets/sql/create.sql");
    List<String> results = s.split(";");
    for (String sql in results) {
      if (sql.trim().isNotEmpty) {
        await db.execute(sql);
      }
    }
  }

  Future<void>? _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (newVersion > oldVersion) {
      Batch batch = db.batch();
      switch (newVersion) {
        case 2:
        default:
      }
      await batch.commit();
    }
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}