import 'package:objectbox/objectbox.dart';

@Entity()
class Symptoms{
  @Id()
  int id = 0;

  @Property()
  String name;

  @Property()
  List<String> causes;

  @Transient()
  bool isSelected = false; // Add this line

  Symptoms({
    required this.id,
    required this.name,
    required this.causes,
  });
}