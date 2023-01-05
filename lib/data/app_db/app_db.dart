import 'package:exam_prep/data/dao/test_db.dart';
import 'package:sembast/sembast.dart';

abstract class AppDb {
  Future<void> initialise();

  TestDb get testDb;

  Database get db;
}
