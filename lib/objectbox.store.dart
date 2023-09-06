import 'objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'entities/item.entity.dart';

class ObjectBoxService {
  static late Store _store;
  static bool _storeOpened = false;

  static Future<Store> openStore() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final databaseDirectoryPath = appDocumentDir.path + '/objectbox';

    if (!Directory(databaseDirectoryPath).existsSync()) {
      Directory(databaseDirectoryPath).createSync();
    }

    _store = Store(getObjectBoxModel(), directory: databaseDirectoryPath);
    _storeOpened = true;

    // Create Admin instance if available

    return _store;
  }

  static Store get objectBoxStore {
    if (_storeOpened) {
      return _store;
    } else {
      throw Exception("ObjectBox store has not been initialized.");
    }
  }

  // Add methods to insert data from Excel for your entity classes
  static void insertHerbProfiles(List<Item> herbProfiles) {
    final box = _store.box<Item>();
    box.putMany(herbProfiles);
  }
}
