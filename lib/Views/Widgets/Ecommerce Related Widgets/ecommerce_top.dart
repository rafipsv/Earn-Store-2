import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/user_cart_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:badges/badges.dart' as badges;
import 'package:earn_store/Views/Pages/Ecommerce%20Related%20Pages/product_cart_page.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EcommerceTop extends StatelessWidget {
  final String title;
  final double? topPadding;
  final double? leftPadding;
  final double? rightPadding;
  final double? bottomPadding;
  const EcommerceTop({
    super.key,
    this.topPadding,
    this.leftPadding,
    this.rightPadding,
    this.bottomPadding,
    required this.title,
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
        boxRightPadding: 20.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                SizedBox(width: 5.w),
                TextStyles.customText(
                  title: title,
                  fontSize: 20.sp,
                )
              ],
            ),
            Row(
              children: [
                cartWidget(),
                SizedBox(width: 30.w),
                Image.asset(
                  "${Paths.iconPath}location.png",
                  height: 25.h,
                  width: 19.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cartWidget() {
    UserCartController userCartController = Get.put(
      UserCartController(),
    );
    return Obx(
      () {
        return GestureDetector(
          onTap: () {
            userCartController.carts.value!.client!.cartInfo!.isEmpty
                ? null
                : Get.to(
                    const ProductCartPage(),
                  );
          },
          child: badges.Badge(
            badgeStyle: const badges.BadgeStyle(
              badgeColor: TextColors.textColor1,
            ),
            badgeContent: TextStyles.customText(
              title: userCartController.carts.value!.client!.cartInfo!.length
                  .toString(),
              fontSize: 10.sp,
              color: TextColors.textColor5,
            ),
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 25.sp,
              color: TextColors.textColor1,
            ),
          ),
        );
      },
    );
  }
}
