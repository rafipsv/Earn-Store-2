import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/User%20Controllers/user_profile_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/More%20Pages/edit_profile_main_page.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePageTop extends StatelessWidget {
  const ProfilePageTop({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphismCard(
      boxHeight: 300.h,
      verticalPadding: 10.h,
      horizontalPadding: 20.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          editIcon(),
          userImage(),
          SizedBox(height: 10.h),
          userInfo(),
        ],
      ),
    );
  }

  Widget editIcon() {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        onPressed: () {
          Get.to(
            const EditProfileMainPage(),
          );
        },
        splashRadius: 1,
        icon: const Icon(
          Icons.edit,
          color: TextColors.textColor1,
        ),
      ),
    );
  }

  Widget userImage() {
    UserProfileController controller = Get.put(UserProfileController());
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: CachedNetworkImage(
                imageUrl: controller.userData.value!.user!.imageUrl.toString(),
                imageBuilder: (context, imageProvider) => Container(
                  height: 128.h,
                  width: 128.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const ButtonLoading(),
                errorWidget: (context, url, error) => Container(
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
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget userInfo() {
    UserProfileController profileController = Get.put(UserProfileController());
    return Obx(
      () {
        String name = profileController.userData.value!.user!.name.toString();
        String email = profileController.userData.value!.user!.email.toString();
        return Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyles.customText(
                title: name,
                fontSize: 18.sp,
              ),
              SizedBox(height: 5.h),
              TextStyles.customText(
                title: email,
                fontSize: 14.sp,
              ),
            ],
          ),
        );
      },
    );
  }
}
