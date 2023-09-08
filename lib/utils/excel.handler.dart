import 'package:excel/excel.dart';
import 'dart:io';
import 'package:admin/entities/item.entity.dart';

class ExcelHandler {
  static Future<void> insertDataFromExcel() async {
    final excelFilePath = 'C:\\Users\\BZDGEO001\\1 Holistic Health\\admin\\assets\\Herb Book2.xlsx';

    final excel = Excel.decodeBytes(File(excelFilePath).readAsBytesSync());

    final herbProfileData = excel.tables['Herb Profiles']!;

    final herbProfiles = <Item>[];

    // Process Herb Profiles
    for (final row in herbProfileData.rows.skip(1)) {
      try {
        final herbProfile = Item(
          name: row[0] as String,
          alsoCalled: row[1] as String,
          source: row[2] as String,
          partUsed: row[3] as String,
          formsAvailable: row[4] as String,
          uses: row[5] as String,
          caution: row[6] as String,
          conscientiousConsumerInformation: row[7] as String,
          references: row[8] as String,
          id: 0,
        );
        herbProfiles.add(herbProfile);
      } catch (e) {
        print('Error parsing Herb Profile row: $e');
      }
    }

    //ObjectBoxService.insertHerbProfiles(herbProfiles);
  }
}
