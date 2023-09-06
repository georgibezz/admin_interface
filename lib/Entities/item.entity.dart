import 'package:objectbox/objectbox.dart';

@Entity()
class Item {
  @Id()
  int id = 0;

  @Property()
  String name;

  @Property()
  String description;

  @Property()
  List<String> usages;

  @Transient()
  bool isSelected = false; // Add this line

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.usages,
  });
}