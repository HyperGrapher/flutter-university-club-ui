import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import "package:sqflite/sqlite_api.dart";
import 'package:universityapp/model/lecture.dart';


class DatabaseService {
  DatabaseService._();

  // Sqflite
  static DatabaseService db = DatabaseService._();

  // varibale basindaki '_' (underscore) java'daki private keyword'un karsiligi
  // yani bu class disindan atanamaz ve gorulemez.
  // yanlislikla class disindan bir deger atamasini onler.
  static Database _database;

  //  -- database icin singleton pattern --
  // eger _database'e bir deger atanmis ve uygulama belleginde varsa
  // _database return eder
  // ama uygulama yeni acilmissa initDB() ile yeni bir
  // instance olusturup onu return eder.
  //
  Future<Database> get database async {
    if (_database != null)
      return _database; // eger null degilse _database doner ve bundan sonraki kodlar calismaz.

    _database = await initDB(); // burasi ancak _database null ise calisir.
    return _database;
  }

  // Async fonksiyonlarini javascript'in asynchronous yapisi ile es deger
  // Amaci network veya database gibi islemlerde gecikmeli donen veriyi beklerken islemciyi askiya alip uygulamayi 
  // donma noktasina getirmeden diger islemlerin akici olarak calismasini saglamak. 

  // ornegin networkten veri cekilecek ve bu bir kac saniye surebilen bir islem
  // async fonksiyonu icinde server'a istek gonderilir ve donen cevap
  // await keywordu ile beklenir ve bir degiskene atanir. 
  // bu await keywordunun altinda kalan kodlar degiskene bir deger atanmadan calismaz. 
  // server'dan deger donunce sonraki kodlar calisabilir hale geliyor.
  // Tabi bu sirada async fonksiyonu disindaki tum kodlar normal akisina devam ediyor.

/*
   ornek olarak alt alta iki fonksiyon olsun. 
  
    bu 10 saniye surecek olan async network call
   getDataFromServer async () {
     var data = await getData();

     useData(data); // 10 saniye sonra gelen data ile bu kod calisir.
   }
   
   doSomething() // yukarida 10 saniye beklemeden bu fonksiyon hemen calisir. 


   yani getDataFromServer 'async' olmazsa server'dan gelen veriyi bekleyecek bir mekanizma olmaz.
   await keyword'u data gelene kadar async fonksiyonu askiya alir. 
   

*/

  // Future kullanimi: 
  // 154. satirda queryAll fonksiyonu search sayfasi acildiginda initState() methodu ile cagriliyor.
  // queryAll Future donduruyor ve search dosyasindaki FutureBuilder widgeti (search.dart/52. satir) 
  // builder callback'i ile bu future'den veri donunce bu verilerle listeyi olusturuyor. 


  initDB() async {


    return await openDatabase(join(await getDatabasesPath(), 'app.db'),
        // uygulama telefona kuruldugunda ve uygulama ilk kez calistiginda onCreate methodu bir kez calisiyor
        // openDatabase methodu Oncelikle getDatabasesPath ile gelen "default" path uzerinde app.db var mi bakiyor
        // yoksa yeni bir db olusturuyor.
        // onCreate bundan sonra bir daha calismiyor.
        onCreate: (db, version) async {

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

  // async
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

    return result;
  }

  Future<List<Lecture>> queryLecture(String search) async {
    final db = await database;
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
    List<Lecture> lectures = List();

    for (final node in result) {
      final lecture = Lecture.fromJson(node);
      lectures.add(lecture);
    }

    return lectures;
  }

  Future<List<Lecture>> queryAll() async {
    final db = await database;
    var result = await db.rawQuery('''SELECT * FROM lectures''');
    List<Lecture> lectures = List();

    for (final node in result) {
      final lecture = Lecture.fromJson(node);
      lectures.add(lecture);
    }

    return lectures;
  }
}
