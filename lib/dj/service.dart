import 'package:cafe/features/home/presentation/bloc/category_menu_bloc.dart';
import 'package:get_it/get_it.dart';

final service = GetIt.instance;

Future<void> init() async {
  // StateManagment
  service.registerFactory(() => CategoryMenuBloc());
}
