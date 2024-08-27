import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Ecommerce%20Related%20Pages/product_details_page.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EcommerceProductList extends StatelessWidget {
  const EcommerceProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      child: Column(
        children: [
          topRow(),
          SizedBox(height: 20.h),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 1 / 1.25,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return productBox(index: index);
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget topRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextStyles.customText(
          title: "Products",
        ),
        CustomButton(
          width: 100.w,
          height: 35.h,
          onPressed: () {},
          buttonText: "See All",
          textSize: 14.sp,
        )
      ],
    );
  }

  Widget productBox({required int index}) {
    return GlassmorphismCard(
      verticalPadding: 10.h,
      onPressed: () {
        Get.to(
          const ProductDetailsPage(),
        );
      },
      child: Column(
        children: [
          Image.asset(
            "${Paths.imagePath}product.jpg",
            height: 100.h,
            width: 120.w,
          ),
          SizedBox(height: 5.h),
          TextStyles.customText(
            title: "Fresh Vegetables",
            fontSize: 13.sp,
          ),
          SizedBox(height: 5.h),
          TextStyles.customText(
            title: "BDT 100",
            fontSize: 13.sp,
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "${Paths.iconPath}location.png",
                height: 15.h,
                width: 15.w,
              ),
              SizedBox(width: 4.w),
              TextStyles.customText(
                title: "3.21 km",
                fontSize: 13.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}