import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cafe/di/service.dart';

import 'package:cafe/features/home/domain/entity/category_entity.dart';
import 'package:cafe/features/home/domain/entity/item_menu_entity.dart';
import 'package:cafe/features/home/domain/repository/home_repository.dart';
import 'package:cafe/features/home/presentation/bloc/category/category_menu_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;
  HomeBloc(this._repository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeFilterEvent>((event, emit) async {
      if (state is HomeSuccess) {
        final state = this.state as HomeSuccess;

        final categoryList = event.category.where((element) => element.isCheck);

        if (categoryList.isEmpty) {
          emit(state.copyWith(itemMenu: state._saveItemMenu));
          return;
        }
        final List<ItemMenuEntity> newItemMenu = [];

        for (var idCheckCategory in categoryList) {
          newItemMenu.addAll(
            state._saveItemMenu.where(
              (element) => element.category.id == idCheckCategory.id,
            ),
          );
        }
        emit(state.copyWith(itemMenu: newItemMenu));
      }
    });
    on<HomeInitialEvent>(
      (event, emit) async {
        emit(HomeLoading());
        final dataItemMenu = await _repository.getAllItemMenu();
        final dataCategory = await _repository.getAllCategory();
        List<ItemMenuEntity> itemMenuList = [];
        List<CategoryEntity> categoryList = [];
        dataItemMenu.fold(
          (error) => emit(HomeError()),
          (data) => itemMenuList = data,
        );
        dataCategory.fold(
          (error) => emit(HomeError()),
          (data) => categoryList = data,
        );

        if (state is HomeError) return;

        emit(HomeSuccess(
          itemMenuList,
          itemMenu: itemMenuList,
          category: categoryList,
        ));
      },
    );
  }
}
