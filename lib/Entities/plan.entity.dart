import 'package:objectbox/objectbox.dart';

@Entity()
class Plan {
  @Id()
  int id = 0;

  @Property()
  String name;

  @Property()
  String instruction;

  @Property()
  List<String> cautions;

  @Transient()
  bool isSelected = false; // Add this line

  Plan({
    required this.id,
    required this.name,
    required this.instruction,
    required this.cautions,
  });
}