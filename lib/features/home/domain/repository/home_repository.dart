import 'package:cafe/core/error/fauiler.dart';
import 'package:cafe/features/home/domain/entity/category_entity.dart';
import 'package:cafe/features/home/domain/entity/item_menu_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class HomeRepository {
  Future<Either<Fauiler, List<ItemMenuEntity>>> getAllItemMenu();
  Future<Either<Fauiler, List<CategoryEntity>>> getAllCategory();
}
