class CategoryEntity {
  final int id;
  final String name;
  bool isCheck;

  CategoryEntity({
    required this.id,
    required this.name,
    this.isCheck = false,
  });
}
