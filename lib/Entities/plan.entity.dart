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
}
