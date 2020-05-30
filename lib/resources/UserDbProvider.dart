/**
 * DB provider: Just to handle all DB interation functions
 */

import '../models/UserModel.dart';
import 'dart:async';
import 'SQLiteDbProvider.dart';

class UserDbProvider {
  
  fetchUser() async {
    final db = await SQLiteDbProvider.db.database; 
    // called map beacause we'll get List<Map<String, dynamic>>
    final maps = await db.query(
      'Users'
      // columns: null //['name',mobile] to get specefic items only
      // where: "id = ?",
      // whereArgs: [id],
    );

    if(maps.length > 0){
      return UserModel.fromDB(maps.first);
    }

    return null;
  }

  fetchUserById(int id) async{
    final db = await SQLiteDbProvider.db.database; 
    // called map beacause we'll get List<Map<String, dynamic>>
    final maps = await db.query(
      'Users',
      columns: null, //['name',mobile] to get specefic items only
      where: "id = ?",
      whereArgs: [id],
    );

    if(maps.length > 0){
      return UserModel.fromDB(maps.first);
    }

    return null;
  }

  addUser(UserModel user) async{
    final db = await SQLiteDbProvider.db.database;

    if(await fetchUserById(user.id) != null){
      await db.delete('Users', where: 'id = ?', whereArgs: [user.id]);
      return await db.insert('Users', user.toMapForDb());
    }else{
      return await db.insert('Users', user.toMapForDb());
    }
  }

  logoutUser() async {
    final db = await SQLiteDbProvider.db.database;
    db.delete('Users');

    return true;
  }
}