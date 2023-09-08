import 'package:objectbox/objectbox.dart';

@Entity()
class Item{
  @Id()
  int id = 0;

  @Property()
  String name;

  @Property()
  String alsoCalled;

  @Property()
  String source;

  @Property()
  String partUsed;

  @Property()
  String formsAvailable;

  @Property()
  String uses;

  @Property()
  String caution;

  @Property()
  String conscientiousConsumerInformation;

  @Property()
  String references;

  Item({
    required this.id,
    required this.name,
    required this.alsoCalled,
    required this.source,
    required this.partUsed,
    required this.formsAvailable,
    required this.uses,
    required this.caution,
    required this.conscientiousConsumerInformation,
    required this.references,
  });
}
