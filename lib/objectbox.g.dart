// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_sync_flutter_libs/objectbox_sync_flutter_libs.dart';

import 'Entities/conditions.entity.dart';
import 'Entities/item.entity.dart';
import 'Entities/plan.entity.dart';
import 'Entities/symptom.entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(3, 5062988298748516354),
      name: 'Plan',
      lastPropertyId: const IdUid(8, 1710239404745649540),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7325565855644243873),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(5, 253515875125291318),
            name: 'condition',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 8820603313148705527),
            name: 'commonlyUsedDrugs',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 6580912062546562000),
            name: 'herbalAlternative',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 1710239404745649540),
            name: 'howToUse',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 1203151557266320519),
      name: 'Conditions',
      lastPropertyId: const IdUid(3, 1029188923746380241),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4583499502016593274),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3771466489577810201),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1029188923746380241),
            name: 'causes',
            type: 30,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 807709831922303126),
      name: 'Item',
      lastPropertyId: const IdUid(10, 6369378659556070261),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3157613714833054686),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7122292881347662402),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7772560157505084293),
            name: 'alsoCalled',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 7078256748978629697),
            name: 'source',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 7136333561074695005),
            name: 'partUsed',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 8576542471820391976),
            name: 'formsAvailable',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 452089478305907725),
            name: 'uses',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 1170098714901606795),
            name: 'caution',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 4411069709684713950),
            name: 'conscientiousConsumerInformation',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 6369378659556070261),
            name: 'references',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(6, 5293340169370124747),
      name: 'Symptoms',
      lastPropertyId: const IdUid(3, 6193674609565364483),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5410593956974798263),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4020999837862553949),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6193674609565364483),
            name: 'causes',
            type: 30,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(6, 5293340169370124747),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [7156376995514361613, 5737983589119967379],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        5470165977763736949,
        304611855508611774,
        1811975008986571413,
        9168253028374504162,
        4909696018707405954,
        3280318805178033855,
        3911973129190700674,
        8728788337455760273,
        3354576037621185619,
        4681244288878565703,
        8367681146813746213,
        3799544707657440002,
        6324284888265641205,
        620823307664622911,
        1114562976023767699,
        6181987701388496367,
        2336374572361523251,
        7741183020542145625
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Plan: EntityDefinition<Plan>(
        model: _entities[0],
        toOneRelations: (Plan object) => [],
        toManyRelations: (Plan object) => {},
        getId: (Plan object) => object.id,
        setId: (Plan object, int id) {
          object.id = id;
        },
        objectToFB: (Plan object, fb.Builder fbb) {
          final conditionOffset = fbb.writeString(object.condition);
          final commonlyUsedDrugsOffset =
              fbb.writeString(object.commonlyUsedDrugs);
          final herbalAlternativeOffset =
              fbb.writeString(object.herbalAlternative);
          final howToUseOffset = fbb.writeString(object.howToUse);
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addOffset(4, conditionOffset);
          fbb.addOffset(5, commonlyUsedDrugsOffset);
          fbb.addOffset(6, herbalAlternativeOffset);
          fbb.addOffset(7, howToUseOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final conditionParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 12, '');
          final commonlyUsedDrugsParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, '');
          final herbalAlternativeParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 16, '');
          final howToUseParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 18, '');
          final object = Plan(
              id: idParam,
              condition: conditionParam,
              commonlyUsedDrugs: commonlyUsedDrugsParam,
              herbalAlternative: herbalAlternativeParam,
              howToUse: howToUseParam);

          return object;
        }),
    Conditions: EntityDefinition<Conditions>(
        model: _entities[1],
        toOneRelations: (Conditions object) => [],
        toManyRelations: (Conditions object) => {},
        getId: (Conditions object) => object.id,
        setId: (Conditions object, int id) {
          object.id = id;
        },
        objectToFB: (Conditions object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final causesOffset = fbb.writeList(
              object.causes.map(fbb.writeString).toList(growable: false));
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, causesOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final causesParam = const fb.ListReader<String>(
                  fb.StringReader(asciiOptimization: true),
                  lazy: false)
              .vTableGet(buffer, rootOffset, 8, []);
          final object =
              Conditions(id: idParam, name: nameParam, causes: causesParam);

          return object;
        }),
    Item: EntityDefinition<Item>(
        model: _entities[2],
        toOneRelations: (Item object) => [],
        toManyRelations: (Item object) => {},
        getId: (Item object) => object.id,
        setId: (Item object, int id) {
          object.id = id;
        },
        objectToFB: (Item object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final alsoCalledOffset = fbb.writeString(object.alsoCalled);
          final sourceOffset = fbb.writeString(object.source);
          final partUsedOffset = fbb.writeString(object.partUsed);
          final formsAvailableOffset = fbb.writeString(object.formsAvailable);
          final usesOffset = fbb.writeString(object.uses);
          final cautionOffset = fbb.writeString(object.caution);
          final conscientiousConsumerInformationOffset =
              fbb.writeString(object.conscientiousConsumerInformation);
          final referencesOffset = fbb.writeString(object.references);
          fbb.startTable(11);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, alsoCalledOffset);
          fbb.addOffset(3, sourceOffset);
          fbb.addOffset(4, partUsedOffset);
          fbb.addOffset(5, formsAvailableOffset);
          fbb.addOffset(6, usesOffset);
          fbb.addOffset(7, cautionOffset);
          fbb.addOffset(8, conscientiousConsumerInformationOffset);
          fbb.addOffset(9, referencesOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final alsoCalledParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final sourceParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final partUsedParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 12, '');
          final formsAvailableParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, '');
          final usesParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 16, '');
          final cautionParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 18, '');
          final conscientiousConsumerInformationParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 20, '');
          final referencesParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 22, '');
          final object = Item(
              id: idParam,
              name: nameParam,
              alsoCalled: alsoCalledParam,
              source: sourceParam,
              partUsed: partUsedParam,
              formsAvailable: formsAvailableParam,
              uses: usesParam,
              caution: cautionParam,
              conscientiousConsumerInformation:
                  conscientiousConsumerInformationParam,
              references: referencesParam);

          return object;
        }),
    Symptoms: EntityDefinition<Symptoms>(
        model: _entities[3],
        toOneRelations: (Symptoms object) => [],
        toManyRelations: (Symptoms object) => {},
        getId: (Symptoms object) => object.id,
        setId: (Symptoms object, int id) {
          object.id = id;
        },
        objectToFB: (Symptoms object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final causesOffset = fbb.writeList(
              object.causes.map(fbb.writeString).toList(growable: false));
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, causesOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final causesParam = const fb.ListReader<String>(
                  fb.StringReader(asciiOptimization: true),
                  lazy: false)
              .vTableGet(buffer, rootOffset, 8, []);
          final object =
              Symptoms(id: idParam, name: nameParam, causes: causesParam);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Plan] entity fields to define ObjectBox queries.
class Plan_ {
  /// see [Plan.id]
  static final id = QueryIntegerProperty<Plan>(_entities[0].properties[0]);

  /// see [Plan.condition]
  static final condition =
      QueryStringProperty<Plan>(_entities[0].properties[1]);

  /// see [Plan.commonlyUsedDrugs]
  static final commonlyUsedDrugs =
      QueryStringProperty<Plan>(_entities[0].properties[2]);

  /// see [Plan.herbalAlternative]
  static final herbalAlternative =
      QueryStringProperty<Plan>(_entities[0].properties[3]);

  /// see [Plan.howToUse]
  static final howToUse = QueryStringProperty<Plan>(_entities[0].properties[4]);
}

/// [Conditions] entity fields to define ObjectBox queries.
class Conditions_ {
  /// see [Conditions.id]
  static final id =
      QueryIntegerProperty<Conditions>(_entities[1].properties[0]);

  /// see [Conditions.name]
  static final name =
      QueryStringProperty<Conditions>(_entities[1].properties[1]);

  /// see [Conditions.causes]
  static final causes =
      QueryStringVectorProperty<Conditions>(_entities[1].properties[2]);
}

/// [Item] entity fields to define ObjectBox queries.
class Item_ {
  /// see [Item.id]
  static final id = QueryIntegerProperty<Item>(_entities[2].properties[0]);

  /// see [Item.name]
  static final name = QueryStringProperty<Item>(_entities[2].properties[1]);

  /// see [Item.alsoCalled]
  static final alsoCalled =
      QueryStringProperty<Item>(_entities[2].properties[2]);

  /// see [Item.source]
  static final source = QueryStringProperty<Item>(_entities[2].properties[3]);

  /// see [Item.partUsed]
  static final partUsed = QueryStringProperty<Item>(_entities[2].properties[4]);

  /// see [Item.formsAvailable]
  static final formsAvailable =
      QueryStringProperty<Item>(_entities[2].properties[5]);

  /// see [Item.uses]
  static final uses = QueryStringProperty<Item>(_entities[2].properties[6]);

  /// see [Item.caution]
  static final caution = QueryStringProperty<Item>(_entities[2].properties[7]);

  /// see [Item.conscientiousConsumerInformation]
  static final conscientiousConsumerInformation =
      QueryStringProperty<Item>(_entities[2].properties[8]);

  /// see [Item.references]
  static final references =
      QueryStringProperty<Item>(_entities[2].properties[9]);
}

/// [Symptoms] entity fields to define ObjectBox queries.
class Symptoms_ {
  /// see [Symptoms.id]
  static final id = QueryIntegerProperty<Symptoms>(_entities[3].properties[0]);

  /// see [Symptoms.name]
  static final name = QueryStringProperty<Symptoms>(_entities[3].properties[1]);

  /// see [Symptoms.causes]
  static final causes =
      QueryStringVectorProperty<Symptoms>(_entities[3].properties[2]);
}
