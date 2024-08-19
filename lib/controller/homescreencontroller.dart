import 'package:sqflite/sqflite.dart';

class Homescreencontroller {
  static late Database database;
  static List<Map> MyTaskList = [];
  static Future<void> initDb() async {
    // open database
    database = await openDatabase("myDb.db", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Task (id INTEGER PRIMARY KEY, name TEXT, date TEXT)');
    });
  }

  // to add data to table
  static Future<void> addData(
      {required String tasks, required String dates}) async {
    await database.rawInsert(
        'INSERT INTO Task (name,date) VALUES(? , ?)', [tasks, dates]);
    getData();
  }

  static Future<void> getData() async {
    // Get the records
    List<Map> list = await database.rawQuery('SELECT * FROM Task');
    MyTaskList = list;
    getData();
  }

// to delete data
  static Future<void> deleteData({required int deletetask}) async {
    await database.rawDelete('DELETE FROM Task WHERE id = ?', [deletetask]);
    getData();
  }

  // edit data
  static Future<void> editData(
      {required int id,
      required String name,
      required String task}) async {
    await database.rawUpdate(
        'UPDATE Task SET name = ?,  date = ? WHERE id = ?',
        [name, task, id]);
    getData();
  }
}
