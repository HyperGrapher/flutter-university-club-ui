import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import "package:sqflite/sqlite_api.dart";
import 'package:universityapp/model/lecture.dart';

class DatabaseService {
  DatabaseService._();

  // Sqflite
  static DatabaseService db = DatabaseService._();

  static Database _database; // Sqlite database class

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    var dbpath = await getDatabasesPath();
    print("- - - - - - -> InitDB. PAth : $dbpath");
    return await openDatabase(join(await getDatabasesPath(), 'app.db'),
        onCreate: (db, version) async {
      print("- - - - - - -> InitDB-> onCreate");

      await db.execute('''
          CREATE TABLE IF NOT EXISTS lectures (
            id INTEGER PRIMARY KEY, host_university TEXT, host_department TEXT,
            host_major TEXT, host_lecture_id TEXT, host_lecture_name TEXT,
            eras_university TEXT, eras_department TEXT, eras_major TEXT, eras_lecture_id TEXT,
            eras_lecture_name TEXT, year TEXT, semester TEXT
          )
          ''');
    }, version: 1);
  }

  saveLecture(Lecture lec) async {
    final db = await database;

    var result = await db.rawInsert('''
      INSERT INTO lectures (
      host_university,
      host_department,
      host_major,
      host_lecture_id,
      host_lecture_name,
      eras_university,
      eras_department,
      eras_major,
      eras_lecture_id,
      eras_lecture_name, 
      year,
      semester
      ) VALUES (
        ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?
      )
    ''', [
      '${lec.host_university}',
      '${lec.host_department}',
      '${lec.host_major}',
      '${lec.host_lecture_id}',
      '${lec.host_lecture_name}',
      '${lec.eras_university}',
      '${lec.eras_department}',
      '${lec.eras_major}',
      '${lec.eras_lecture_id}',
      '${lec.eras_lecture_name}',
      '${lec.year}',
      '${lec.semester}'
    ]);
    print("- - - - - - -> Creating new Lecture. Result: $result");

    return result;
  }

  Future<List<Lecture>> queryLecture(String search) async {
    final db = await database;
    print("- - - - - - -> Serching for word ($search)");
    final sql = '''
      SELECT * FROM lectures WHERE host_university LIKE '%$search%' 
      union
      SELECT * FROM lectures WHERE eras_university LIKE '%$search%'
      union
      SELECT * FROM lectures WHERE host_department LIKE '%$search%'     
      union
      SELECT * FROM lectures WHERE eras_department LIKE '%$search%'     
      union
      SELECT * FROM lectures WHERE host_lecture_name LIKE '%$search%' 
      union
      SELECT * FROM lectures WHERE eras_lecture_name LIKE '%$search%' 
    ''';
    var result = await db.rawQuery(sql);
    print("- - - - -> DB Result Count: ${result.length}");
    List<Lecture> lectures = List();

    for (final node in result) {
      final lecture = Lecture.fromJson(node);
      lectures.add(lecture);
    }

    return lectures;
  }

  Future<List<Lecture>> queryAll() async {
    final db = await database;
    print("- - - - - - -> Query all");
    var result = await db.rawQuery('''SELECT * FROM lectures''');
    List<Lecture> lectures = List();

    for (final node in result) {
      final lecture = Lecture.fromJson(node);
      lectures.add(lecture);
    }

    return lectures;
  }

  Future dropTable() async {
    final db = await database;
    print("- - - - - - -> Drop table");
    var result = await db.rawQuery('''
        DROP TABLE lectures;
    ''');

    return result;
  }
}

/**
 *     SELECT * from lectures WHERE host_department like ? order by columnA limit 100
    union
    SELECT * from lectures WHERE host_lecture_name like ? order by columnA limit 100
 */
