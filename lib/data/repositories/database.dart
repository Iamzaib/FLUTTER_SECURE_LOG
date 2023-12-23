import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _database;
  DbHelper._privateConstructor();

  static DbHelper instance = DbHelper._privateConstructor();

  Future<Database> get database async {
    _database ??= await initializeDatabase();

    return _database!;
  }

  Future<Database> initializeDatabase() async {
    String dbpath = await getDatabasesPath();
    dbpath = "$dbpath/mydb.db";
    var stddb = await openDatabase(dbpath, version: 2, onCreate: _createdb);
    return stddb;
  }

  void _createdb(Database db, int newversion) async {
    // creations of tables
    await db.execute('''
CREATE TABLE user(
  firstname TEXT,
  surname TEXT,  
  companyname TEXT,
  location TEXT,
  companylogo TEXT,
  signature Text
)
''');

    await db.execute('''
CREATE TABLE dailyReport(
  dailyReportId INTEGER PRIMARY KEY AUTOINCREMENT,
  logs TEXT,
  weather TEXT,
  company TEXT,
  location TEXT,
  logo TEXT,
  dateCreated TEXT,
  notes TEXT,
  endTime TEXT,
  version INTEGER
)
''');
  }
  //-----------------------------------------------------------------//
}
