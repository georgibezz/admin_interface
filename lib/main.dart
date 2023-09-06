// main.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'objectbox.store.dart'; // Import the database.dart file
import 'entities/item.entity.dart'; // Import your entity files
import 'entities/conditions.entity.dart';
import 'entities/plan.entity.dart';
import 'objectbox.g.dart';

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

class MyHomePage extends StatefulWidget {
  final Store store;

  MyHomePage({required this.store});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ObjectBox Sync Flutter App'),
      ),
      body: Center(
        child: Text('Welcome to your ObjectBox Sync Flutter App!'),
      ),
    );
  }
}
// ... rest of the main.dart remains the same
