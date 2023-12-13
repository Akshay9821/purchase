// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:purchase/common/color.dart';
// import 'package:purchase/common/common_function.dart';
// import 'package:purchase/controller/profile/profile_view_controller.dart';

// class ProfileViewScreen extends GetView<ProfileViewController> {
//   const ProfileViewScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double height = CommonFunction.getActualHeight(context);
//     double width = CommonFunction.getWidth(context);
//     return Scaffold(
//       backgroundColor: AppColor.white,
//       body: SafeArea(
//         child: SizedBox(
//           width: CommonFunction.getWidth(context),
//           height: CommonFunction.getActualHeight(context),
//           child: Obx(
//             () => (controller.isLoading.value)
//                 ? const Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: height * 0.23,
//                         child: Stack(
//                           children: [
//                             Container(
//                               width: width,
//                               height: height * 0.15,
//                               decoration: BoxDecoration(
//                                 color: AppColor.blue,
//                               ),
//                             ),
//                             Positioned(
//                               left: 10,
//                               right: 10,
//                               top: height * 0.04,
//                               child: Obx(
//                                 () => CircleAvatar(
//                                   radius: 70,
//                                   backgroundColor: AppColor.white,
//                                   child: controller.profilePhoto.value == ""
//                                       ? ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(120.0),
//                                           child: const Image(
//                                             image: AssetImage(
//                                                 "assets/images/default.png"),
//                                             fit: BoxFit.fill,
//                                             width: 120.0,
//                                             height: 120.0,
//                                           ),
//                                         )
//                                       : ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(120.0),
//                                           child: FadeInImage(
//                                             image: NetworkImage(
//                                                 controller.profilePhoto.value),
//                                             placeholder: const AssetImage(
//                                                 "assets/images/default.png"),
//                                             fit: BoxFit.fill,
//                                             width: 120.0,
//                                             height: 120.0,
//                                           ),
//                                         ),
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               top: height * 0.17,
//                               left: width * 0.62,
//                               child: InkWell(
//                                 onTap: () {
//                                   controller.showBottomSheetForImagePicker();
//                                 },
//                                 child: Icon(
//                                   Icons.add_a_photo,
//                                   color: AppColor.blue,
//                                   size: 32.0,
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               top: height * 0.10,
//                               right: 15.0,
//                               child: InkWell(
//                                 onTap: () {
//                                   Get.toNamed(AppRoute.profile)!.then((value) {
//                                     controller.getUserData();
//                                   });
//                                 },
//                                 child: const Image(
//                                   image: AssetImage(
//                                     "assets/icons/common/edit.png",
//                                   ),
//                                   width: 25.0,
//                                   height: 25.0,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           SizedBox(
//                             width: CommonFunction.getWidth(context),
//                             child: Center(
//                               child: Text(
//                                 controller.user.teamMemberCode,
//                                 style: AppTextstyle.ts20BM,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: CommonFunction.getWidth(context),
//                             child: Center(
//                               child: Text(
//                                 "${controller.user.firstName} ${controller.user.middleName} ${controller.user.lastName}",
//                                 style: AppTextstyle.ts20BM,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 35.0),
//                       Obx(
//                         () => Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             _tabButton(
//                               context,
//                               controller.currentTab.value,
//                               "PERSONAL",
//                               0,
//                               () {
//                                 controller.updateTab(0);
//                               },
//                             ),
//                             _tabButton(
//                               context,
//                               controller.currentTab.value,
//                               "EMPLOYEE",
//                               1,
//                               () {
//                                 controller.updateTab(1);
//                               },
//                             ),
//                             _tabButton(
//                               context,
//                               controller.currentTab.value,
//                               "BANK",
//                               2,
//                               () {
//                                 controller.updateTab(2);
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 10.0),
//                       Obx(
//                         () => (controller.currentTab.value == 0)
//                             ? Expanded(
//                                 child: SingleChildScrollView(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 15.0, vertical: 5.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         _detailWidget(
//                                           "Personal Email",
//                                           controller.user.email ?? "-",
//                                           context,
//                                         ),
//                                         _detailWidget(
//                                           "Office Email",
//                                           controller.user.officeEmail ?? "-",
//                                           context,
//                                         ),
//                                         _detailWidget(
//                                           "Personal Number",
//                                           controller.user.personalMobileNo ??
//                                               "-",
//                                           context,
//                                         ),
//                                         _detailWidget(
//                                           "Office Number",
//                                           (controller.user.officeMobileNo ==
//                                                       null ||
//                                                   controller.user
//                                                           .officeMobileNo ==
//                                                       "")
//                                               ? "-"
//                                               : controller.user.officeMobileNo!,
//                                           context,
//                                         ),
//                                         _detailWidget(
//                                           "Emergency Contact Number",
//                                           controller.user
//                                                   .emergencyContactNumber ??
//                                               "-",
//                                           context,
//                                         ),
//                                         _detailWidget(
//                                           "Emergency Relationship (Contact Number)",
//                                           controller.user
//                                                   .emergencyContactPersonRelationshipName ??
//                                               "-",
//                                           context,
//                                         ),
//                                         _detailWidget(
//                                           "Communication Address",
//                                           controller
//                                                   .user.communicationAddress ??
//                                               "-",
//                                           context,
//                                         ),
//                                         _detailWidget(
//                                           "Permanent Address",
//                                           controller.user.permanentAddress ??
//                                               "-",
//                                           context,
//                                         ),
//                                         _detailWidget(
//                                           "Date Of  Birth",
//                                           (controller.user.dob != null)
//                                               ? CommonFunction
//                                                   .formatDateToDDMMYYYY(
//                                                       controller.user.dob!)
//                                               : "-",
//                                           context,
//                                         ),
//                                         _detailWidget(
//                                           "Gender",
//                                           controller.user.gender ?? "-",
//                                           context,
//                                         ),
//                                         _detailWidget(
//                                           "Marital Status",
//                                           controller.user.maritalStatus ?? "-",
//                                           context,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             : controller.currentTab.value == 1
//                                 ? Expanded(
//                                     child: SingleChildScrollView(
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 15.0, vertical: 5.0),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             _detailWidget(
//                                               "Designation",
//                                               controller.user.designationName,
//                                               context,
//                                             ),
//                                             _detailWidget(
//                                               "Department",
//                                               controller.user.departmentName,
//                                               context,
//                                             ),
//                                             _detailWidget(
//                                               "Employee Type",
//                                               controller.user.employeeType ??
//                                                   "-",
//                                               context,
//                                             ),
//                                             _detailWidget(
//                                               "Reporting Person",
//                                               controller.user.reportPerson ??
//                                                   "-",
//                                               context,
//                                             ),
//                                             _detailWidget(
//                                               "Shift",
//                                               controller.user.shiftFrom == null
//                                                   ? "-"
//                                                   : "${CommonFunction.formatTimeFromDatetime(controller.user.shiftFrom!)} to ${CommonFunction.formatTimeFromDatetime(controller.user.shiftTo!)}",
//                                               context,
//                                             ),
//                                             _detailWidget(
//                                               "Joining Date",
//                                               (controller.user.joiningDate !=
//                                                       null)
//                                                   ? CommonFunction
//                                                       .formatDateToDDMMYYYY(
//                                                           controller.user
//                                                               .joiningDate!)
//                                                   : "-",
//                                               context,
//                                             ),
//                                             _detailWidget(
//                                               "Probation Date",
//                                               (controller.user.probationDate !=
//                                                       null)
//                                                   ? CommonFunction
//                                                       .formatDateToDDMMYYYY(
//                                                           controller.user
//                                                               .probationDate!)
//                                                   : "-",
//                                               context,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 : Expanded(
//                                     child: SingleChildScrollView(
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 15.0, vertical: 5.0),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             _detailWidget(
//                                               "Bank Name",
//                                               controller.user.bankName ?? "-",
//                                               context,
//                                             ),
//                                             _detailWidget(
//                                               "IFSC Code",
//                                               controller.user.ifsc == null
//                                                   ? "-"
//                                                   : "${controller.user.ifsc}${controller.user.ifscCode}",
//                                               context,
//                                             ),
//                                             _detailWidget(
//                                               "Account Number",
//                                               controller.user.accountNo ?? "-",
//                                               context,
//                                             ),
//                                             _detailWidget(
//                                               "Aadhar Card Number",
//                                               controller.user.adharCardNo ??
//                                                   "-",
//                                               context,
//                                             ),
//                                             _detailWidget(
//                                               "Pan Card Number",
//                                               controller.user.panCardNo ?? "-",
//                                               context,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                       ),
//                     ],
//                   ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _tabButton(BuildContext context, int currentIndex, String tabText,
//       int tabIndex, VoidCallback onTapFunction) {
//     return InkWell(
//       onTap: onTapFunction,
//       child: Container(
//         width: (CommonFunction.getWidth(context) - 30.0) / 3,
//         decoration: BoxDecoration(
//           color: (currentIndex == tabIndex)
//               ? AppColor.transparentBlue
//               : AppColor.white,
//           border: Border.all(
//             width: 1.0,
//             color: AppColor.blue,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0),
//           child: Center(
//             child: Text(
//               tabText,
//               style: AppTextstyle.ts16BR,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _detailWidget(String title, String value, BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: AppTextstyle.ts14WR.copyWith(color: AppColor.blue),
//           ),
//           const SizedBox(height: 5.0),
//           Text(
//             value,
//             style: AppTextstyle.ts14BB,
//           ),
//           const SizedBox(height: 5.0),
//           Container(
//             color: AppColor.lightGrey,
//             width: CommonFunction.getWidth(context),
//             height: 0.5,
//           ),
//         ],
//       ),
//     );
//   }
// }
