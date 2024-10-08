import 'package:earn_store/Views/Common%20Widgets/custom_top2.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/all_popular_courses_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllPopularCourses extends StatelessWidget {
  const AllPopularCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop2(
            title: "Popular Courses",
          ),
          SizedBox(height: 20.h),
          PaddedScreen(
            padding: 10.w,
            child: const AllPopularCoursesBox(),
          ),
        ],
      ),
    );
  }
}
