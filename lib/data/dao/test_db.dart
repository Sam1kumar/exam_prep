abstract class TestDb {
  Future<List<String>> getTestData();

  Future<void> setTestData(List<String> data);
}
