import 'package:sqflite/sqflite.dart';
//  import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('speakeval.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE evaluations (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT,
        title TEXT,
        remarks TEXT,
        date TEXT,
        score REAL
      )
    ''');
  }

  Future<int> insertEvaluation(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('evaluations', data);
  }

  Future<List<Map<String, dynamic>>> getEvaluations() async {
    final db = await database;
    return await db.query('evaluations', orderBy: 'date DESC');
  }

  Future<int> deleteEvaluation(int id) async {
    final db = await database;
    return await db.delete('evaluations', where: 'id = ?', whereArgs: [id]);
  }
}
