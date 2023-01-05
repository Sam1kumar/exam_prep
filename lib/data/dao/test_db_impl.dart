import 'package:exam_prep/data/dao/test_db.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/utils/value_utils.dart';

class TestDbImpl implements TestDb {
  TestDbImpl({required this.db});
  final Database db;
  final StoreRef<String?, Map<String, Object?>> _testDb =
      stringMapStoreFactory.store('test_db');

  static String key = 'ThisIsKeyOfTestDb';
  @override
  Future<List<String>> getTestData() async {
    try {
      final data = await _testDb.find(db);
      final value = data.map((element) => cloneMap(element.value)).toList();
      if (value.isEmpty) {
        return [];
      } else {
        return (value.first[key] as List<dynamic>)
            .map((e) => e.toString())
            .toList();
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<void> setTestData(List<String> data) async {
    await _testDb.record(key).put(db, {key: data});
  }
}
