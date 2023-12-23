import 'package:securelog/data/model/user.dart';
import 'package:securelog/data/repositories/database.dart';
import 'package:sqflite/sqflite.dart';

class UserServices {
  static Future getUser() async {
    Database db = await DbHelper.instance.database;
    List<Map<String, dynamic>> tempUser = await db.query('user');
    if (tempUser.isNotEmpty) {
      User user = User.fromMap(tempUser[0]);
      return user;
    } else {
      return -1;
    }
  }

  static Future deleteUser(User user) async {
    Database db = await DbHelper.instance.database;
    int result =
        await db.delete('user', where: 'surname=?', whereArgs: [user.surName]);
    return result;
  }

  static Future insertUser(User userModel) async {
    Database db = await DbHelper.instance.database;

    int result = await db.insert('user', userModel.toMap());
    if (result == -1) {
      return 'Error';
    } else {
      return 'Added';
    }
  }

  static Future updateUser(User user) async {
    Database db = await DbHelper.instance.database;

    int result = await db.update('user', user.toMap(),
        where: 'surname=?', whereArgs: [user.surName]);
    if (result == -1) {
      return 'Error';
    } else {
      return 'Updated';
    }
  }
}
