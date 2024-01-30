import 'package:cafe/features/home/presentation/bloc/category_menu_bloc.dart';
import 'package:cafe/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({
    super.key,
    required this.name,
    required this.isCheck,
  });
  final bool isCheck;
  final String name;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selected: isCheck,
      onSelected: (value) => context.read<CategoryMenuBloc>().add(
            OnSelectCategoryMenuEvent(
              name: name,
              isCheck: value,
            ),
          ),
      showCheckmark: false,
      selectedColor: AppColor.accentActive,
      backgroundColor: AppColor.clear,
      label: Text(
        name,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: isCheck ? AppColor.base1 : AppColor.accentActive,
            ),
      ),
    );
    // return Container(
    //   padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(16),
    //     color: isCheck ? AppColor.accentActive : AppColor.clear,
    //   ),
    //   child: InkWell(
    //     borderRadius: BorderRadius.circular(16),
    //     onTap: () {
    //       context.read<CategoryMenuBloc>().add(
    //             OnSelectCategoryMenuEvent(
    //               name: name,
    //               isCheck: !isCheck,
    //             ),
    //           );
    //     },
    //     child: Text(
    //       name,
    //       style: Theme.of(context).textTheme.headlineMedium!.copyWith(
    //             color: isCheck ? AppColor.base1 : AppColor.accentActive,
    //           ),
    //     ),
    //   ),
    // );
  }
}
