import 'dart:async';
import 'dart:isolate';

import 'package:exam_prep/data/dao/test_db_impl.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  final _builderStream = BehaviorSubject<List<String>?>.seeded(null);

  @override
  void initState() {
    final StoreRef<String?, Map<String, Object?>> _testDb =
        stringMapStoreFactory.store('test_db');

    // _testDb
    //     .record('ThisIsKeyOfTestDb')
    //     .onSnapshot(locator<AppDb>().db)
    //     .listen((event) {
    //   print(event);
    //   if (event == null) {
    //     return;
    //   }
    //   final value = (cloneMap(event.value)['ThisIsKeyOfTestDb'] as List<dynamic>)
    //       .map((e) => e.toString())
    //       .toList();
    //   _builderStream.add(value);
    // });
    final _timer = Timer.periodic(Duration(seconds: 2), (t) async {
      final data = <String>[];
      _builderStream.add(null);

      final dir = await getApplicationDocumentsDirectory();
      await dir.create(recursive: true);
      final dbPath = '${dir.path}/exam_prep_database.db';
      final db = await databaseFactoryIo.openDatabase(dbPath);

      final testDb = TestDbImpl(db: db);
      data.addAll(await testDb.getTestData());
      print('Main Thread: Tick value -> ${t.tick} Data ${data}');
      db.close();
      _builderStream.add(data);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Testing features')),
      body: StreamBuilder<List<String>?>(
          stream: _builderStream,
          builder: (context, snapshot) {
            final data = snapshot.data ?? [];
            if (snapshot.data == null) {
              return const CircularProgressIndicator(
                strokeWidth: 1,
              );
            }
            return Text(data.length.toString());
          }),
      bottomNavigationBar: TextButton(
        onPressed: () {
          TestingIsolates().spawnIsolates();
        },
        child: Text('Spawn Isolates'),
      ),
    );
  }
}

class TestingIsolates {
  Future<void> spawnIsolates() async {
    final port = ReceivePort();
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final dbPath = '${dir.path}/exam_prep_database.db';

    final isolate = await Isolate.spawn<List<dynamic>>(
      isolateFunction,
      [port.sendPort, dbPath],
    );
    final x = await port.length;
    print('this is port length $x');
  }

  Future<void> isolateFunction(List<dynamic> data) async {
    print('Isolate spawned ... ');
    final port = data[0];

    for (var i = 0; i < 1000; i++) {
      await Future.delayed(Duration(seconds: 5));
      final db = await databaseFactoryIo.openDatabase(data[1]);

      final testDb = TestDbImpl(db: db);
      final listData = (await testDb.getTestData());
      print("Isolate thread: data -> $listData");
      listData.add('This is ${i + 1}th times loop has been called');
      await testDb.setTestData(listData);
      db.close();
      data[0].send(i);
    }
    print('isolate finished ... Thank You!!');
  }
}

class TestPageBloc {}
