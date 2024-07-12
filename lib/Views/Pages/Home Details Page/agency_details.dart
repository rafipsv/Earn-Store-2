import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/agency_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgencyDetails extends StatelessWidget {
  const AgencyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomTop(
            title: "Agency Details",
          ),
          SizedBox(height: 30.h),
          const AgencyDetailsBody()
        ],
      ),
    );
  }
}
