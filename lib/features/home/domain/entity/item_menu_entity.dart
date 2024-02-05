import 'package:cafe/features/home/domain/entity/category_entity.dart';

class ItemMenuEntity {
  final String title;
  final String description;
  final String weight;
  final int calories;
  final double cost;
  final String path;
  final CategoryEntity category;
  bool isCheckFilter;
  ItemMenuEntity({
    required this.title,
    required this.description,
    required this.weight,
    required this.calories,
    required this.cost,
    required this.path,
    required this.category,
    this.isCheckFilter = true,
  });
}
