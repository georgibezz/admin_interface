import 'package:admin/utils/excel.handler.dart';
import 'package:flutter/material.dart';
import 'objectbox.g.dart';
import 'dart:io';
import 'entities/item.entity.dart';
import 'screens/home.page.dart';

late final Store store;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  store = await openStore();
  if (Sync.isAvailable()) {
    final serverUrl = 'ws://137.158.109.230:' +
        (Platform.isAndroid ? '9999' : '8888');

    Sync.client(
      store,
      serverUrl,
      SyncCredentials.none(),
    ).start();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    store.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(store: store),
    );
  }
}
