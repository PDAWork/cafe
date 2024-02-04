import 'package:cafe/features/home/data/model/category_model.dart';

class ItemMenuModel {
  final String title;
  final String description;
  final String weight;
  final int? calories;
  final double cost;
  final String path;
  final CategoryModel category;

  ItemMenuModel({
    required this.title,
    required this.description,
    required this.weight,
    required this.calories,
    required this.cost,
    required this.path,
    required this.category,
  });

  factory ItemMenuModel.fromJson(Map<String, dynamic> json) {
    return ItemMenuModel(
      title: json['title'],
      description: json['description'] ?? '',
      weight: json['weight'],
      calories: json['calories'],
      cost: json['cost'],
      path: json['path'],
      category: CategoryModel.fromJson(json['category']),
    );
  }
}
