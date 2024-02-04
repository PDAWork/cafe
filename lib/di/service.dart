import 'package:cafe/features/home/data/data_source/home_data_source.dart';
import 'package:cafe/features/home/data/repository/home_repository_impl.dart';
import 'package:cafe/features/home/domain/repository/home_repository.dart';
import 'package:cafe/features/home/presentation/bloc/category/category_menu_bloc.dart';
import 'package:cafe/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:get_it/get_it.dart';

final service = GetIt.instance;

Future<void> init() async {
  // StateManagment
  service.registerFactory(() => HomeBloc(service()));
  service.registerFactory(() => CategoryMenuBloc());

  // Repository
  service.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl());
  service.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      dataSource: service(),
    ),
  );
}
