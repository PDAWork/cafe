import 'package:bloc/bloc.dart';

import 'package:cafe/features/home/domain/entity/category_entity.dart';
import 'package:cafe/features/home/domain/entity/item_menu_entity.dart';
import 'package:cafe/features/home/domain/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;
  HomeBloc(this._repository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});

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
          itemMenu: itemMenuList,
          category: categoryList,
        ));
      },
    );
  }
}
