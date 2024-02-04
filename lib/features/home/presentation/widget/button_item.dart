import 'package:cafe/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({
    super.key,
    required this.cost,
  });

  final double cost;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4.5,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.clear,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${cost.floor()} ₽',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColor.accentActive),
          ),
          SvgPicture.asset(
            'assets/Plus.svg',
            colorFilter: const ColorFilter.mode(
              AppColor.accentActive,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
