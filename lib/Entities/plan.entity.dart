import 'package:objectbox/objectbox.dart';


@Entity()
class Plan{
  @Id()
  int id = 0;

  @Property()
  String condition;

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
    required this.condition,
    required this.commonlyUsedDrugs,
    required this.herbalAlternative,
    required this.howToUse,
    required this.caution,
  });
}
