import 'dart:async'; 
import 'dart:io'; 
import 'package:path/path.dart'; 
import 'package:path_provider/path_provider.dart'; 
import 'package:sqflite/sqflite.dart'; 

class SQLiteDbProvider { 
  SQLiteDbProvider._(); 
  static final SQLiteDbProvider db = SQLiteDbProvider._(); 
  static Database _database; 

  Future<Database> get database async { 
    if (_database != null) 
    return _database; 
    _database = await init(); 
    return _database; 
  }

  init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path,'myan_lyca.db');
    return await openDatabase(
      path,
      version: 1, //internal record veriosning of schema
      onCreate: (Database newDb, int version){
        // called very first time when DB is created
        newDb.execute("""
          CREATE TABLE Users
            (
              id INTEGER PRIMARY KEY,
              full_name TEXT,
              first_name TEXT,
              last_name TEXT,
              email TEXT,
              is_email_verify INTEGER,
              mobile TEXT,
              is_verify_mobile INTEGER,
              auth_key TEXT,
              profile_image TEXT,
              device_id TEXT
            )
        """);
      }
    );
  }
}