import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/service/note.model.dart';

class SqliteService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Notes(id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  // Future<int>
  Future<void> createItem(NoteModel noteModel) async {
    int result = 0;
    final Database db = await initializeDB();
    final id = await db.insert('Notes', noteModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Future<List<NoteModel>> getItems() async{
  //   // final db = await SqliteService.init();
  //   // final List<Map<String, Object?>> queryResult = await db.query('Notes', orderBy: NoteModelColumn.createdAt);
  //   // return queryResult.map((e) => NoteModel.fromMap(e)).toList();
  // }
}
