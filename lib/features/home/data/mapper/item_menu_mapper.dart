import 'package:cafe/features/home/data/mapper/category_mapper.dart';
import 'package:cafe/features/home/data/model/item_menu_model.dart';
import 'package:cafe/features/home/domain/entity/item_menu_entity.dart';

extension ItemMenuMapperModel on ItemMenuModel {
  ItemMenuEntity toEntity() {
    return ItemMenuEntity(
        title: title,
        description: description,
        weight: weight,
        calories: calories ?? 0,
        cost: cost,
        path: path,
        category: category.toEntity());
  }
}
