import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_application_3/models/task.dart';

class DBHelper {
  static Database? db;
  static final int version = 1;
  static final String tableName = 'Tasks';
  initDb(){
    
  }
}
