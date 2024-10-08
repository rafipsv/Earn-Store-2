import 'package:earn_store/Controllers/Social%20Media%20Controllers/customer_chat_controller.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Views/Pages/More%20Pages/change_pass_page.dart';
import 'package:earn_store/Views/Pages/More%20Pages/leader_board_page.dart';
import 'package:earn_store/Views/Pages/More%20Pages/level_page.dart';
import 'package:earn_store/Views/Pages/More%20Pages/profile_page.dart';
import 'package:earn_store/Views/Pages/More%20Pages/refer_list_page.dart';
import 'package:earn_store/Views/Pages/More%20Pages/total_earning_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/package_page.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/splash_page.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MoreController extends GetxController {
  RxBool liveChatLoading = false.obs;
  CustomerChatController customerChatController = Get.put(
    CustomerChatController(),
  );
  void moreNavigator({required int index}) async {
    if (index == 0) {
      Get.to(
        const ProfilePage(),
      );
    } else if (index == 1) {
      Get.to(
        const LeaderBoardPage(),
      );
    } else if (index == 2) {
      Get.to(
        const ReferListPage(),
      );
    } else if (index == 3) {
      Get.to(
        const TotalEarningPage(),
      );
    } else if (index == 4) {
      Get.to(
        const LevelPage(),
      );
    } else if (index == 5) {
      Get.to(
        const PackagePage(),
      );
    } else if (index == 6) {
      Get.to(
        const ChangePagePage(),
      );
    } else if (index == 8) {
      logOut();
    }
  }

  String todaysDate() {
    final now = DateTime.now();
    final formatter = DateFormat('dd MMMM yyyy');
    return formatter.format(now);
  }

  Future<void> logOut() async {
    await LocalStorage.setUserID(userID: 0);
    Get.offAll(
      const SplashPage(),
    );
  }

  Future<void> adminChat() async {
    liveChatLoading.value = true;
    await customerChatController.getCustomerChat();
    liveChatLoading.value = false;
  }
}
