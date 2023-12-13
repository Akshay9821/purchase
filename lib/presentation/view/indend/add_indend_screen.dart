import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/textstyle.dart';
import 'package:purchase/controller/indent/indend_controller.dart';
import 'package:purchase/model/indent/material_model.dart';
import 'package:purchase/presentation/view/indend/widgets/custom_date_forIndend.dart';
import 'package:purchase/presentation/widget/common/button/custom_button.dart';
import 'package:purchase/presentation/widget/common/reuseable_widget/custom_appbar_3_widget.dart';
import 'package:purchase/presentation/widget/util/custom_textfield.dart';
import 'package:purchase/presentation/widget/util/dropdown/custom_dropdown.dart';

class AddIndentScreen extends StatelessWidget {
  const AddIndentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IndendController());

    final width = CommonFunction.getActualWidth(context);
    final height = CommonFunction.getActualHeight(context);

    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
          child: SizedBox(
              child: Column(
        children: [
          CustomAppbar3Widget(
            title: "Request Indend",
            onTapFunction: () {
              controller.showMaterialBottomSheet(width, height);
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          Obx(() => (!controller.showViewIndend.value)
              ? SizedBox(
                  child: Column(
                    children: [
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: CustomDropdown(
                            itemList: controller.companyList,
                            setValue: (value) {
                              controller.handleSiteNameListChange(value);
                            },
                            initialValue: controller.selectedCompanyName,
                          )),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Obx(
                            () => CustomDropdown(
                              itemList: controller.siteNameList.toList(),
                              setValue: (value) {
                                controller.selectedSiteName = value;
                              },
                              initialValue: controller.selectedSiteName,
                            ),
                          )),
                      CustomTextField(
                        textController: controller.remarksC,
                        hint: "Remarks",
                        minLines: 3,
                        maxLines: 10,
                      ),
                      CustomDateForIndend(
                        setValue: (value) {
                          controller.selectedRequiredByDate = value;
                        },
                        initialDate: controller.selectedRequiredByDate,
                        hint: 'Required By Date*',
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomButton(
                        title: "CREATE",
                        onTapFunction: () {
                          controller.addRequestIndend(
                              context,
                              controller.selectedCompanyName["DisplayText"],
                              controller.selectedSiteName["DisplayText"],
                              controller.remarksC.text,
                              controller.selectedRequiredByDate);
                        },
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Column(children: [
                    companyIndentDataWidget(
                        context,
                        controller.selectedCompanyName["DisplayText"],
                        controller.selectedSiteName["DisplayText"],
                        controller.remarksC.text,
                        controller.selectedRequiredByDate,
                        controller)
                  ]),
                ))
        ],
      ))),
    );
  }
}

Widget companyIndentDataWidget(
    BuildContext context,
    String companyName,
    String siteName,
    String remarks,
    DateTime requiredbyDate,
    IndendController controller) {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0),
    child: Container(
        color: AppColor.white,
        width: CommonFunction.getActualWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Company Name",
              style: AppTextstyle.ts18BB.copyWith(color: AppColor.blue),
            ),
            const SizedBox(height: 5.0),
            Text(
              controller.selectedCompanyName["DisplayText"],
              style: AppTextstyle.ts16BB
                  .copyWith(color: AppColor.black.withOpacity(0.5)),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Site Name",
              style: AppTextstyle.ts18BB.copyWith(color: AppColor.blue),
            ),
            const SizedBox(height: 5.0),
            Text(
              controller.selectedSiteName["DisplayText"],
              style: AppTextstyle.ts16BB
                  .copyWith(color: AppColor.black.withOpacity(0.5)),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Remarks",
              style: AppTextstyle.ts18BB.copyWith(color: AppColor.blue),
            ),
            const SizedBox(height: 5.0),
            Text(
              remarks,
              style: AppTextstyle.ts16BB
                  .copyWith(color: AppColor.black.withOpacity(0.5)),
              overflow: TextOverflow.fade,
            ),
            const SizedBox(height: 10.0),
            Text(
              "Required Date:",
              style: AppTextstyle.ts18BB.copyWith(color: AppColor.blue),
            ),
            const SizedBox(height: 5.0),
            Text(
              CommonFunction.formatDateFromDatetoDDMMYYYY(requiredbyDate),
              style: AppTextstyle.ts16BB
                  .copyWith(color: AppColor.black.withOpacity(0.5)),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: CommonFunction.getActualHeight(context) - 350,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        for (int i = 0;
                            i < controller.materialModelData.length;
                            i++)
                          materialIndentDataWidget(
                            context,
                            controller,
                            controller.materialModelData[i],
                            () {
                              controller.isUpdating.value = true;

                              controller.selectedMaterialName["DisplayText"] =
                                  controller.materialModelData[i].materialName;

                              controller
                                      .selectedSubMaterailName["DisplayText"] =
                                  controller
                                      .materialModelData[i].subMaterialName;

                              controller.materialQtyC.text =
                                  controller.materialModelData[i].qty;
                              controller.materialRemarksC.text = controller
                                  .materialModelData[i].materialRemarks;

                              controller.selectedIndex = -1;

                              controller.showMaterialBottomSheet(
                                  CommonFunction.getActualWidth(context),
                                  CommonFunction.getActualHeight(context));
                            },
                            () {
                              // controller.addMaterailRequestIndend(
                              //   controller.materialModelData[i].materialName,
                              //   controller.materialModelData[i].subMaterialName,
                              //   controller.materialModelData[i].qty,
                              //   controller.materialModelData[i].materialRemarks,
                              // );
                            },
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
                title: "SUBMIT",
                onTapFunction: () {
                  controller.submitIndend();
                })
          ],
        )),
  );
}

Widget materialIndentDataWidget(
  BuildContext context,
  IndendController controller,
  MaterialModel materialModel,
  VoidCallback onTapFunctionForMaterialEdit,
  VoidCallback onTapFunctionForMaterialDelete,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5.0),
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 0.0, right: 10.0, bottom: 0.0),
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
              color: Colors.grey.withOpacity(0.5),
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: CommonFunction.getActualWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Material Name",
                    style: AppTextstyle.ts16BB.copyWith(color: AppColor.blue),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    materialModel.materialName,
                    style: AppTextstyle.ts16BB
                        .copyWith(color: AppColor.black.withOpacity(0.5)),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "SubMaterial Name",
                    style: AppTextstyle.ts16BB.copyWith(color: AppColor.blue),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    materialModel.subMaterialName,
                    style: AppTextstyle.ts16BB
                        .copyWith(color: AppColor.black.withOpacity(0.5)),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Qty",
                    style: AppTextstyle.ts16BB.copyWith(color: AppColor.blue),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    materialModel.qty,
                    style: AppTextstyle.ts16BB
                        .copyWith(color: AppColor.black.withOpacity(0.5)),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Material Remarks",
                    style: AppTextstyle.ts16BB.copyWith(color: AppColor.blue),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    materialModel.materialRemarks,
                    style: AppTextstyle.ts16BB
                        .copyWith(color: AppColor.black.withOpacity(0.5)),
                    overflow: TextOverflow.fade,
                  ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: onTapFunctionForMaterialEdit,
                        child: const Image(
                          image: AssetImage("assets/icons/indend/pen.png"),
                          width: 18.0,
                          height: 18.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      InkWell(
                        onTap: () => onTapFunctionForMaterialDelete,
                        child: const Image(
                          image: AssetImage("assets/icons/indend/delete.png"),
                          width: 18.0,
                          height: 18.0,
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
