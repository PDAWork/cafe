import 'package:cafe/features/home/data/model/category_model.dart';
import 'package:cafe/features/home/domain/entity/category_entity.dart';

extension CategoryMapperModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
    );
  }
}
