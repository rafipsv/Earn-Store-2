import 'package:earn_store/Controllers/Home%20Controllers/all_video_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/custom_top.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Widgets/Home%20Details%20Widgets/all_watch_video_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllWatchVideoPage extends StatefulWidget {
  const AllWatchVideoPage({super.key});

  @override
  State<AllWatchVideoPage> createState() => _AllWatchVideoPageState();
}

class _AllWatchVideoPageState extends State<AllWatchVideoPage> {
  bool isLoading = true;
  AllVideoController controller = Get.put(AllVideoController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getAllVideos();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const ScreenLoading()
        : RootDesign(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: const [
                CustomTop(title: "Watch Video"),
                AllWatchVideoBox(),
              ],
            ),
          );
  }
}
