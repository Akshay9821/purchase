import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/textstyle.dart';
import 'package:purchase/controller/indent/viewindend_controller.dart';
import 'package:purchase/model/indent/view_indend_model.dart';
import 'package:purchase/presentation/view/indend/add_indend_screen.dart';
import 'package:purchase/presentation/view/indend/view_indend_list_screen.dart';

class ViewIndendScreen extends StatelessWidget {
  const ViewIndendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ViewIndendController());
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
          child: SizedBox(
        width: CommonFunction.getActualWidth(context),
        height: CommonFunction.getHeightWithoutAppbar(context),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(
                    children: [
                      const Image(
                        image: AssetImage("assets/images/common/logo.png"),
                        width: 30.0,
                        height: 30.0,
                      ),
                      const SizedBox(width: 5.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "View Indend",
                            style: AppTextstyle.ts18BB,
                          ),
                          Text(
                            "${controller.receivedRole} ",
                            style: AppTextstyle.ts12BB,
                          )
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  controller.receivedRole == "Site Supervisor"
                      ? InkWell(
                          onTap: () {
                            Get.to(const AddIndentScreen());
                          },
                          child: Icon(
                            Icons.add_circle,
                            color: AppColor.blue,
                          ),
                        )
                      : Container()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: controller.searchController,
                decoration: InputDecoration(
                  hintText: 'Search by company...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  controller.searchIndendData(value);
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Obx(() => (controller.isLoading.value)
                            ? const Center(child: CircularProgressIndicator())
                            : (controller.viewIndendData.isEmpty)
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: const AssetImage(
                                              "assets/images/common/nodata.png"),
                                          width: CommonFunction.getActualWidth(
                                                  context) -
                                              100,
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "No data found!",
                                          style: AppTextstyle.ts16BB,
                                        ),
                                      ],
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: controller.viewIndendData.length,
                                    shrinkWrap: true,
                                    controller: controller.scrollController,
                                    itemBuilder: (context, index) {
                                      if (index ==
                                              controller.viewIndendData.length -
                                                  1 &&
                                          controller.isDataAvailable.value) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      return Column(
                                        children: [
                                          for (int i = 0;
                                              i <
                                                  controller
                                                      .viewIndendData.length;
                                              i++)
                                            _viewIndendCardWidget(
                                              context,
                                              controller,
                                              controller.viewIndendData[i],
                                              // controller.indendMaterialData[i],
                                              () {
                                                // controller.navigateToAddCompofScreen(
                                                //   controller.viewCompofList[i],
                                                // );
                                              },
                                              () {
                                                // controller.apiCallToDeleteCompoff(
                                                //   controller.viewCompofList[i],
                                                // );
                                              },
                                              i,
                                            ),
                                        ],
                                      );
                                    },
                                  )),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

Widget _viewIndendCardWidget(
  BuildContext context,
  ViewIndendController controller,
  ViewIndendData object,
  // IndentMaterial data,
  VoidCallback onTapFunctionForIndendEdit,
  VoidCallback onTapFunctionIndendDelete,
  int cardIndex,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5.0),
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 0.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.black.withOpacity(0.2),
                offset: const Offset(
                  0.0,
                  0.0,
                ),
                blurRadius: 0.0,
                spreadRadius: 0.25,
              ),
            ],
            border: Border.all(
              color: AppColor.grey,
              width: 1.0,
            ),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  color: AppColor.blue.withOpacity(0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Requested :",
                            style: AppTextstyle.ts16BB
                                .copyWith(color: AppColor.blue),
                          ),
                          const SizedBox(
                            width: 2.0,
                          ),
                          Expanded(
                            child: Text(
                              object.createdBy ?? "-",
                              style: AppTextstyle.ts16BR
                                  .copyWith(color: AppColor.blue),
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Company Name :",
                      style: AppTextstyle.ts14BB.copyWith(color: AppColor.blue),
                    ),
                    const SizedBox(
                      width: 2.0,
                    ),
                    Expanded(
                      child: Text(
                        object.companyName ?? "-",
                        style: AppTextstyle.ts14BR,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Project Name :",
                      style: AppTextstyle.ts14BB.copyWith(color: AppColor.blue),
                    ),
                    const SizedBox(
                      width: 2.0,
                    ),
                    Expanded(
                      child: Text(
                        object.projectName ?? "",
                        style: AppTextstyle.ts14BR,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColor.transparentOrange
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          color: AppColor.transparentOrange,
                                          width:
                                              1) // Adjust the radius for rounded corners
                                      ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Required :",
                                          style: AppTextstyle.ts14BB
                                              .copyWith(color: AppColor.blue),
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          "${CommonFunction.formatDateToDayMonth(object.requiredDate)}-${CommonFunction.formatDateToYear(object.requiredDate)}",
                                          style: AppTextstyle.ts14BR
                                              .copyWith(color: AppColor.blue),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Get.to(ViewIndendListScreen(
                                    data:
                                        controller.viewIndendData[cardIndex]));
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "View",
                                          style: AppTextstyle.ts14BB.copyWith(
                                            color: AppColor.blue,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20.0,
                                          color: AppColor.blue,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
