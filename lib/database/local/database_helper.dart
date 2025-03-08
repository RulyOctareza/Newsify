import 'package:newsify/model/local_news_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'news.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE news(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        author TEXT,
        content TEXT,
        date TEXT,
        imageUrl TEXT,
        title TEXT
      )
    ''');
  }

  Future<int> insertNews(LocalNewsModel news) async {
    final db = await database;
    return await db.insert('news', news.toMap());
  }

  Future<List<LocalNewsModel>> getNews() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('news');

    return List.generate(maps.length, (i) {
      return LocalNewsModel.fromMap(maps[i]);
    });
  }

  Future<int> updateNews(LocalNewsModel news) async {
    final db = await database;
    return await db.update(
      'news',
      news.toMap(),
      where: 'id = ?',
      whereArgs: [news.id],
    );
  }

  Future<int> deleteNews(int id) async {
    final db = await database;
    return await db.delete('news', where: 'id = ?', whereArgs: [id]);
  }
}
