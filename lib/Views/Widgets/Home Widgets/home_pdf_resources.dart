import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/all_pdf_resource.dart';
import 'package:earn_store/Views/Pages/Home%20Details%20Page/pdf_resources_details.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Styles/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePDFResources extends StatelessWidget {
  const HomePDFResources({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
      child: Column(
        children: [
          TitleText(
            title: "PDF & Resource",
            onPressed: () {
              Get.to(
                const AllPdfResources(),
              );
            },
          ),
          SizedBox(height: 10.h),
          resources(),
        ],
      ),
    );
  }

  Widget resources() {
    return Column(
      children: List.generate(
        4,
        (index) => Padding(
          padding: EdgeInsets.only(bottom: 15.w),
          child: GlassmorphismCard(
            boxHeight: 85.h,
            onPressed: () {
              Get.to(
                const PDFResourcesDetails(),
              );
            },
            horizontalPadding: 10.w,
            verticalPadding: 10.h,
            child: Row(
              children: [
                Image.asset(
                  "${Paths.iconPath}home_pdf.png",
                  height: 55.h,
                  width: 92.w,
                ),
                SizedBox(width: 5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextStyles.customText(
                      title: "HSC 2024 Special Suggestion",
                      fontSize: 12.sp,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        TextStyles.customText(
                          title: "200 Taka",
                          fontSize: 14.sp,
                          color: TextColors.textColor3,
                        ),
                        SizedBox(width: 50.w),
                        Container(
                          height: 30.h,
                          width: 80.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ButtonColors.buttonColor1,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: TextStyles.customText(
                            title: "Details",
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
