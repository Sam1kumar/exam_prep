import 'package:exam_prep/data/app_db/app_db.dart';
import 'package:exam_prep/data/dao/test_db.dart';
import 'package:exam_prep/data/dao/test_db_impl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDbImpl extends AppDb {
  AppDbImpl();

  Database? _db;
  // MasterDataDao? _masterDb;
  // StockEventDao? _stockEventDao;

  TestDb? _testDb;

  @override
  Future<void> initialise() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      await dir.create(recursive: true);
      final dbPath = join(dir.path, 'exam_prep_database.db');
      _db = await databaseFactoryIo.openDatabase(dbPath);
    } catch (e, s) {
      throw Exception("Error in initialising sembast Db");
    }
  }

  @override
  TestDb get testDb {
    return _testDb ??= TestDbImpl(db: _db!);
  }

  @override
  Database get db => _db!;

  @override
  Future<void> clear() async {}
}
