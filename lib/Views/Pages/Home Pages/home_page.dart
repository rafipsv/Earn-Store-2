import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/all_category_controller.dart';
import 'package:earn_store/Controllers/Ecommerce%20Related%20Controller/flash_sell_controller.dart';
import 'package:earn_store/Controllers/Home%20Controllers/all_agency_controller.dart';
import 'package:earn_store/Controllers/Home%20Controllers/all_hotel_controller.dart';
import 'package:earn_store/Controllers/Home%20Controllers/content_controller.dart';
import 'package:earn_store/Controllers/Home%20Controllers/home_advertise_controller.dart';
import 'package:earn_store/Controllers/Home%20Controllers/online_course_controller.dart';
import 'package:earn_store/Controllers/Home%20Controllers/pdf_and_resources_controller.dart';
import 'package:earn_store/Controllers/Home%20Controllers/popular_courses_controller.dart';
import 'package:earn_store/Controllers/Home%20Controllers/sport_update_controller.dart';
import 'package:earn_store/Controllers/Home%20Controllers/tour_package_controller.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_advertise.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_agency.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_book.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_categories.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_categories_list.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_flash_sell.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_hotel_booking.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_level_and_point.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_match.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_online_course.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_options.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_pdf_resources.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_popular_courses.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_product_category.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_streaming_hub.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_top.dart';
import 'package:earn_store/Views/Widgets/Home%20Widgets/home_tour_packages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeAdvertiseController advertiseController = Get.put(
    HomeAdvertiseController(),
  );
  AllCategoryController allCategoryController = Get.put(
    AllCategoryController(),
  );
  FlashSellController flashSellController = Get.put(FlashSellController());
  ContentController contentController = Get.put(ContentController());
  OnlineCourseController onlineCourseController = Get.put(
    OnlineCourseController(),
  );
  AllHotelController hotelController = Get.put(
    AllHotelController(),
  );
  TourPackageController tourPackageController = Get.put(
    TourPackageController(),
  );
  SportUpdateController sportUpdateController = Get.put(
    SportUpdateController(),
  );
  PDFAndResourcesController pdfAndResourcesController = Get.put(
    PDFAndResourcesController(),
  );
  PopularCoursesController popularCoursesController = Get.put(
    PopularCoursesController(),
  );
  AllAgencyController allAgencyController = Get.put(
    AllAgencyController(),
  );

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await advertiseController.getBanners();
    await allCategoryController.getAllCategory();
    await flashSellController.getFlashSells();
    await contentController.getStreamingContent();
    await onlineCourseController.geOnlineCourse();
    await hotelController.getAllHotels();
    await tourPackageController.getAllTourPackage();
    await sportUpdateController.getSportUpdates();
    await pdfAndResourcesController.getAllResources();
    await popularCoursesController.getPopularCourses();
    await allAgencyController.getAllAgencies();
  }

  @override
  Widget build(BuildContext context) {
    return RootDesign(
      child: PaddedScreen(
        padding: 10.w,
        child: Column(
          children: [
            const HomeTop(),
            Expanded(
              child: ListView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                children: [
                  const HomeAdvertisement(),
                  const HomeLevelAndPoint(),
                  const HomeCategoriesList(),
                  const HomeCategories(),
                  const HomeStreamingHub(),
                  const HomeOnlineCourse(),
                  const HomeOptions(),
                  const HomeHotelBooking(),
                  const HomeTourPackages(),
                  const HomeMatch(),
                  const HomePDFResources(),
                  const HomeBook(),
                  const HomePopularCources(),
                  const HomeAgency(),
                  const HomeFlashSell(),
                  const HomeProductCategory(),
                  SizedBox(height: 30.h)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
