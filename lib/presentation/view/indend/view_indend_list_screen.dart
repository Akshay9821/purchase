import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/textstyle.dart';
import 'package:purchase/controller/indent/viewindend_controller.dart';
import 'package:purchase/model/indent/view_indend_model.dart';
import 'package:purchase/presentation/widget/common/button/custom_button.dart';

class ViewIndendListScreen extends StatelessWidget {
  final ViewIndendData data;

  const ViewIndendListScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ViewIndendController());
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
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
              ],
            ),
          ),
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
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Company Name :",
                          style: AppTextstyle.ts14BB
                              .copyWith(color: AppColor.blue),
                        ),
                        const SizedBox(
                          width: 2.0,
                        ),
                        Expanded(
                          child: Text(
                            data.companyName ?? "-",
                            style: AppTextstyle.ts14BR,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Project Name :",
                          style: AppTextstyle.ts14BB
                              .copyWith(color: AppColor.blue),
                        ),
                        const SizedBox(
                          width: 2.0,
                        ),
                        Expanded(
                          child: Text(
                            data.projectName ?? "",
                            style: AppTextstyle.ts14BR,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Project Location :",
                          style: AppTextstyle.ts14BB
                              .copyWith(color: AppColor.blue),
                        ),
                        const SizedBox(
                          width: 2.0,
                        ),
                        Expanded(
                          child: Text(
                            data.projectLocation ?? "",
                            style: AppTextstyle.ts14BR,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          "${CommonFunction.formatDateToDayMonth(data.requiredDate)}-${CommonFunction.formatDateToYear(data.requiredDate)}",
                          style: AppTextstyle.ts14BR,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Remarks :",
                          style: AppTextstyle.ts14BB
                              .copyWith(color: AppColor.blue),
                        ),
                        const SizedBox(
                          width: 2.0,
                        ),
                        Expanded(
                          child: Text(
                            data.remark ?? "",
                            style: AppTextstyle.ts14BR,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: CommonFunction.getActualWidth(context),
                          height: 20.0,
                          color: AppColor.blue.withOpacity(0.5),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Material Details",
                              style: AppTextstyle.ts14BB
                                  .copyWith(color: AppColor.blue),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        // Loop to display each material
                        for (IndentMaterial material in data.indentMaterial)
                          _viewMaterialCardWidget(
                              context, controller, data, material)
                      ],
                    ),
                    const Divider(),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Created Date :",
                              style: AppTextstyle.ts14BB
                                  .copyWith(color: AppColor.blue),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              CommonFunction.formatDateFromDatetoDDMMYYYY(
                                  data.createdDate),
                              style: AppTextstyle.ts14BR,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Created By:",
                              style: AppTextstyle.ts14BB
                                  .copyWith(color: AppColor.blue),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              data.createdBy ?? "",
                              style: AppTextstyle.ts14BR
                                  .copyWith(color: AppColor.blue),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Status :",
                              style: AppTextstyle.ts14BB
                                  .copyWith(color: AppColor.blue),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              data.status ?? "",
                              style: AppTextstyle.ts14BR
                                  .copyWith(color: AppColor.blue),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              boxShadow: [
                BoxShadow(
                  color: AppColor.black.withOpacity(0.2),
                  offset: const Offset(
                    -1.0,
                    -1.0,
                  ),
                  blurRadius: 1.0,
                  spreadRadius: 0.25,
                ),
              ],
            ),
            child: controller.shouldShowApprovedDelete(data.nextIndentActionId)
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          title: "APPROVE",
                          onTapFunction: () {
                            controller.approveReject(
                                true,
                                data.indentId,
                                data.status,
                                data.remark,
                                data.companyId,
                                data.projectId);
                          },
                          isHalf: true,
                        ),
                        CustomButton(
                          title: "REJECT",
                          onTapFunction: () {
                            controller.approveReject(
                                false,
                                data.indentId,
                                data.status,
                                data.remark,
                                data.companyId,
                                data.projectId);
                          },
                          isHalf: true,
                          color: AppColor.transparentRed,
                        ),
                      ],
                    ))
                : Container(),
          )
        ],
      ),
    )));
  }
}

Widget _viewMaterialCardWidget(
  BuildContext context,
  ViewIndendController controller,
  ViewIndendData data,
  IndentMaterial object,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5.0),
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 0.0),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name :",
                        style:
                            AppTextstyle.ts14BB.copyWith(color: AppColor.blue),
                      ),
                      const SizedBox(
                        width: 2.0,
                      ),
                      Expanded(
                        child: Text(
                          object.materialName ?? "-",
                          style: AppTextstyle.ts14BR,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sub-Material :",
                        style:
                            AppTextstyle.ts14BB.copyWith(color: AppColor.blue),
                      ),
                      const SizedBox(
                        width: 2.0,
                      ),
                      Expanded(
                        child: Text(
                          object.materialSubtypeName ?? "",
                          style: AppTextstyle.ts14BR,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Quantity :",
                        style:
                            AppTextstyle.ts14BB.copyWith(color: AppColor.blue),
                      ),
                      const SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "${object.quantity}" ?? "",
                        style: AppTextstyle.ts14BR,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "UOM :",
                        style:
                            AppTextstyle.ts14BB.copyWith(color: AppColor.blue),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        object.uomCode ?? "",
                        style: AppTextstyle.ts14BR,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remarks :",
                        style:
                            AppTextstyle.ts14BB.copyWith(color: AppColor.blue),
                      ),
                      const SizedBox(
                        width: 2.0,
                      ),
                      Expanded(
                        child: Text(
                          object.materialRemark ?? "",
                          style: AppTextstyle.ts14BR,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                  controller.shouldShowEditDelete(data.status)
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Divider(),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {

                                  },
                                  child: const Image(
                                    image: AssetImage(
                                        "assets/icons/indend/pen.png"),
                                    width: 18.0,
                                    height: 18.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: const Image(
                                    image: AssetImage(
                                        "assets/icons/indend/delete.png"),
                                    width: 18.0,
                                    height: 18.0,
                                    fit: BoxFit.contain,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      : Container()
                ],
              )),
        )
      ],
    ),
  );
}
