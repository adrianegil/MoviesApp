import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// Clase de Ayuda para la creación y gestión de la base de datos interna de la app.
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  factory DatabaseHelper() {
    return instance;
  }

  DatabaseHelper._init();

  /// Permite obtener una instancia de la base de datos.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// Crea la base de datos.
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'movies_app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  /// Ejecuta los scripts correspondientes una vez que se crea la base de datos.
  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE genre(id INTEGER PRIMARY KEY, name TEXT)',
    );
  }

  /// Cierra la base de datos.
  static Future closeDB() async {
    _database?.close();
  }
}
