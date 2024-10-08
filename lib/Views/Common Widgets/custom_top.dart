import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTop extends StatelessWidget {
  final String title;
  final double? topPadding;
  final double? leftPadding;
  final double? rightPadding;
  final double? bottomPadding;
  const CustomTop({
    super.key,
    required this.title,
    this.topPadding,
    this.leftPadding,
    this.rightPadding,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding ?? 10.h,
        left: leftPadding ?? 10.w,
        right: rightPadding ?? 10.w,
        bottom: bottomPadding ?? 20.h,
      ),
      child: GlassmorphismCard(
        boxHeight: 60.h,
        boxWidth: Get.width,
        child: Row(
          children: [
            SizedBox(width: 10.w),
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: TextColors.textColor1,
                size: 20.sp,
              ),
            ),
            SizedBox(width: 10.w),
            TextStyles.customText(
              title: title,
              fontSize: 20.sp,
            )
          ],
        ),
      ),
    );
  }
}
