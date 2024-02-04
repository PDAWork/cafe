import 'package:cafe/core/error/fauiler.dart';
import 'package:cafe/features/home/data/data_source/home_data_source.dart';
import 'package:cafe/features/home/data/mapper/category_mapper.dart';
import 'package:cafe/features/home/data/mapper/item_menu_mapper.dart';
import 'package:cafe/features/home/domain/entity/category_entity.dart';
import 'package:cafe/features/home/domain/entity/item_menu_entity.dart';
import 'package:cafe/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _dataSource;

  HomeRepositoryImpl({required HomeDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Either<Fauiler, List<ItemMenuEntity>>> getAllItemMenu() async {
    try {
      final data = await _dataSource.getAllItemMenu();
      return Right(data.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(CacheFauiler());
    }
  }

  @override
  Future<Either<Fauiler, List<CategoryEntity>>> getAllCategory() async {
    try {
      final data = await _dataSource.getAllCategory();
      return Right(data.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(CacheFauiler());
    }
  }
}
