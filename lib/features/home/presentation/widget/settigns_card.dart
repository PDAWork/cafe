import 'package:cafe/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettginsCard extends StatelessWidget {
  SettginsCard({
    super.key,
    required this.pathIcon,
    required this.title,
    this.onTap,
  });

  final String pathIcon;
  final String title;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColor.clear,
            ),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              pathIcon,
              width: 17.w,
              height: 20.h,
              colorFilter: const ColorFilter.mode(
                AppColor.primary,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 19.w),
            Text(title),
          ],
        ),
      ),
    );
  }
}
