import 'package:objectbox/objectbox.dart';


@Entity()
@Sync()
class Plan{
  @Id()
  int id = 0;

  @Property()
  String name;

  @Property()
  String commonlyUsedDrugs;

  @Property()
  String herbalAlternative;

  @Property()
  String howToUse;

  @Property()
  String caution;

  Plan({
    required this.id,
    required this.name,
    required this.commonlyUsedDrugs,
    required this.herbalAlternative,
    required this.howToUse,
    required this.caution,
  });
  Plan toEntity() {
    return Plan(
      name: name,
      howToUse: howToUse,
      caution: caution,
      commonlyUsedDrugs: commonlyUsedDrugs,
      herbalAlternative: herbalAlternative,
      id: id, // Make sure to include the id if applicable
    );
  }
  Plan toPlan() {
    return Plan(
      id: id, // Make sure to include the id if applicable
      name: name,
      howToUse: howToUse,
      caution: caution,
      commonlyUsedDrugs: commonlyUsedDrugs,
      herbalAlternative: herbalAlternative,
    );
  }
   update(Plan newValues, box) {
    name = newValues.name;
    howToUse = newValues.howToUse;
    caution = newValues.caution;
    commonlyUsedDrugs = newValues.commonlyUsedDrugs;
    herbalAlternative = newValues.herbalAlternative;
  }
}
