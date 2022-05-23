import 'package:exam_prep/data/app_db/app_db.dart';
import 'package:exam_prep/repository/user_repository/user_repository.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDbImpl extends AppDb {
  AppDbImpl({
    this.userRepository,
  });

  final UserRepository? userRepository;

  Database? db;
  // MasterDataDao? _masterDb;
  // StockEventDao? _stockEventDao;

  @override
  Future<void> initialise() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      await dir.create(recursive: true);
      final dbPath = join(dir.path, 'fa_flutter_mt_database.db');
      db = await databaseFactoryIo.openDatabase(dbPath);
    } catch (e, s) {
      throw Exception("Error in initialising sembast Db");
    }
  }

  @override
  Future<void> clear() async {}
}
