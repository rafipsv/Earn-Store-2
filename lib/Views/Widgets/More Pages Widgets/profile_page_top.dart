import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePageTop extends StatelessWidget {
  const ProfilePageTop({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphismCard(
      boxHeight: 260.h,
      verticalPadding: 20.h,
      horizontalPadding: 20.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          userImage(),
          userInfo(),
        ],
      ),
    );
  }

  Widget userImage() {
    return Container(
      height: 128.h,
      width: 128.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            "${Paths.imagePath}blank_image.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget userInfo() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextStyles.customText(
            title: "Rashidatul Kobra",
            fontSize: 18.sp,
          ),
          SizedBox(height: 5.h),
          TextStyles.customText(
            title: "Be you be unique",
            fontSize: 14.sp,
          ),
        ],
      ),
    );
  }
}
