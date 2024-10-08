import 'package:earn_store/Controllers/Social%20Media%20Controllers/group_message_controller.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GroupChatDetailsBody extends StatefulWidget {
  const GroupChatDetailsBody({super.key});

  @override
  State<GroupChatDetailsBody> createState() => _GroupChatDetailsBodyState();
}

class _GroupChatDetailsBodyState extends State<GroupChatDetailsBody> {
  GroupMessegeController controller = Get.put(GroupMessegeController());
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());
  }

  void _scrollToEnd() {
    scrollController.jumpTo(
      scrollController.position.maxScrollExtent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Expanded(
          child: PaddedScreen(
            padding: 15.w,
            child: ListView.builder(
              controller: scrollController,
              itemCount: controller.messages.value!.data!.messages!.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                bool isUser = controller.userSelector(index: index);
                return isUser
                    ? userMessege(index: index)
                    : senderMessege(index: index);
              },
            ),
          ),
        );
      },
    );
  }

  Widget senderMessege({required int index}) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 15.h,
        top: 15.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          chatImage(),
          SizedBox(width: 10.h),
          messegeBox(isUser: false, index: index),
        ],
      ),
    );
  }

  Widget userMessege({required int index}) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 15.h,
        top: 15.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          messegeBox(isUser: true, index: index),
          SizedBox(width: 10.h),
          chatImage(),
        ],
      ),
    );
  }

  Widget chatImage() {
    return Container(
      height: 30.h,
      width: 30.w,
      margin: EdgeInsets.only(bottom: 5.h),
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

  Widget messegeBox({required bool isUser, required int index}) {
    GroupMessegeController controller = Get.put(GroupMessegeController());
    return Obx(
      () {
        return Column(
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Padding(
              padding: isUser
                  ? EdgeInsets.only(right: 8.w, bottom: 5.h)
                  : EdgeInsets.only(left: 8.w, bottom: 5.h),
              child: TextStyles.customText(
                title: controller
                    .messages.value!.data!.messages![index].createdAt
                    .toString(),
                fontSize: 8.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 10.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.r),
                color: GlassMorphismColors.glassColor1.withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    color: GeneralColors.shadowColor1.withOpacity(0.26),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: const Offset(1.18, 1.18),
                  ),
                  BoxShadow(
                    color: GeneralColors.blackColor.withOpacity(0.30),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: const Offset(-1.18, -1.18),
                  ),
                ],
              ),
              child: SizedBox(
                width: 150.w,
                child: TextStyles.customText(
                  title: controller
                      .messages.value!.data!.messages![index].message
                      .toString(),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  isShowAll: true,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
