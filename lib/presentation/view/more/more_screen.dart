import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/textstyle.dart';
import 'package:purchase/controller/more/more_controller.dart';
import 'package:purchase/presentation/view/more/widgets/expandable_widget.dart';
import 'package:purchase/presentation/widget/common/reuseable_widget/custom_appbar_2_widget.dart';
import 'package:purchase/utils/routes/app_route.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends GetView<MoreController> {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: SizedBox(
          width: CommonFunction.getActualWidth(context),
          height: CommonFunction.getHeightWithoutBottomNavbar(context),
          child: Column(
            children: [
              const CustomAppbar2Widget(
                title: "More",
              ),
              Expanded(
                  child: Obx(
                () => ListView(
                  children: [
                    ExpandableWidget(
                      isExpanded: controller.menuList[0],
                      title: "Indend",
                      iconUrl: "assets/icons/more/home_selected.png",
                      onTapFunction: () {
                        controller.expandMenu(0);
                      },
                      expandedChild: Column(
                        children: [
                          _expandedItemWidget(
                            "Add Indend",
                            () {
                              Get.toNamed(AppRoute.addIndend);
                            },
                          ),
                          _expandedItemWidget(
                            "View Indend",
                            () {
                              Get.toNamed(AppRoute.viewIndend);
                            },
                            true,
                          ),
                        ],
                      ),
                    ),
                    (controller.userType == "Site Engineer")
                        ? ExpandableWidget(
                            isExpanded: controller.menuList[1],
                            title: "Approval",
                            iconUrl: "assets/icons/more/home_selected.png",
                            onTapFunction: () {
                              controller.expandMenu(1);
                            },
                            expandedChild: Column(
                              children: [
                                _expandedItemWidget(
                                  "Indend",
                                  () {
                                    Get.toNamed(AppRoute.indendApproval);
                                  },
                                  true,
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    ExpandableWidget(
                      isExpanded: controller.menuList[2],
                      title: "Settings",
                      iconUrl: "assets/icons/more/setting.png",
                      onTapFunction: () {
                        controller.expandMenu(2);
                      },
                      expandedChild: Column(
                        children: [
                          _expandedItemWidget(
                            "Company Policy",
                            () async {
                              bool isLaunchAble = await canLaunchUrl(Uri.parse(
                                  "https://hrr.hrishabraj.in/setting/company-policy.html?type=mobile"));
                              if (isLaunchAble) {
                                await launchUrl(
                                    Uri.parse(
                                        "https://hrr.hrishabraj.in/setting/company-policy.html?type=mobile"),
                                    mode: LaunchMode.externalApplication);
                              }
                            },
                          ),
                          _expandedItemWidget(
                            "Privacy Policy",
                            () async {
                              bool isLaunchAble = await canLaunchUrl(Uri.parse(
                                  "https://hrishabraj.in/privacy-policy.html"));
                              if (isLaunchAble) {
                                await launchUrl(
                                    Uri.parse(
                                        "https://hrishabraj.in/privacy-policy.html"),
                                    mode: LaunchMode.externalApplication);
                              }
                            },
                          ),
                          // _expandedItemWidget(
                          //   "Latest Release - ${Constant.androidVersion}",
                          //   () async {
                          //     bool isLaunchAble = await canLaunchUrl(Uri.parse(
                          //         "https://hrr.hrishabraj.in/setting/release-note.html?type=mobile"));
                          //     if (isLaunchAble) {
                          //       await launchUrl(
                          //           Uri.parse(
                          //               "https://hrr.hrishabraj.in/setting/release-note.html?type=mobile"),
                          //           mode: LaunchMode.externalApplication);
                          //     }
                          //   },
                          // ),
                          _expandedItemWidget(
                            "Logout",
                            () {
                              controller.logOut();
                            },
                            true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _expandedItemWidget(String title, VoidCallback onTapFunction,
      [bool isLast = false]) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        margin: EdgeInsets.only(left: 42.0, bottom: isLast ? 0.0 : 15.0),
        child: Row(
          children: [
            Text(
              title,
              style: AppTextstyle.ts14BB,
            ),
          ],
        ),
      ),
    );
  }
}
