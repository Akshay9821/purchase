import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/constant.dart';
import 'package:purchase/common/textstyle.dart';
import 'package:purchase/model/indent/material_model.dart';
import 'package:purchase/model/indent/view_indend_model.dart';
import 'package:purchase/model/user_registration_model.dart';
import 'package:purchase/presentation/view/indend/view_indend_screen.dart';
import 'package:purchase/presentation/widget/common/button/custom_button.dart';
import 'package:purchase/presentation/widget/util/custom_textfield.dart';
import 'package:purchase/presentation/widget/util/dropdown/custom_dropdown.dart';
import 'package:purchase/service/base_client.dart';
import 'package:purchase/utils/dialog_helper.dart';
import 'package:purchase/utils/routes/app_route.dart';

class IndendController extends GetxController {
  late dynamic selectedCompanyName;
  late dynamic selectedSiteName;
  late dynamic selectedMaterialName;
  late dynamic selectedSubMaterailName;
  late TextEditingController remarksC;

  late UserData user;
  // materials details
  late TextEditingController materialQtyC, materialRemarksC;
  String requiredByDate = "";
  DateTime selectedRequiredByDate = DateTime.now();
  var companyIndendDataList = <CompanyDetail>[];
  var materialIndendDataList = [];

  var showViewIndend = false.obs;
  var showAddMaterialBtn = false.obs;

  var materialModelData = <MaterialModel>[].obs;
  var isUpdating = false.obs;
  var selectedIndex = -1.obs;

  List<ViewIndendData> viewIndendData = [];
  String flag = "";
  var isLoading = true.obs;

  
  // Variables for HOD, VENDOR, SITE-SUPERVISOR, SITE-ENGINEER
  var receivedRole = "";

  // Pagination
  int pageNumber = 1;
  var isDataAvailable = true.obs;
  late ScrollController scrollController;
  @override
  void onInit() {
    super.onInit();
    initializeController();

    getAllIndend();
    paginate();
  }

  void paginate() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (viewIndendData.length < (pageNumber * 5)) {
        return;
      }
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        pageNumber++;
        getAllIndend();
        update();
      }
    });
  }

  void initializeController() {
    remarksC = TextEditingController();
    materialQtyC = TextEditingController();
    materialRemarksC = TextEditingController();
    getCompanyNameList();
    // getMaterialDataList();
    receivedRole = Constant.staticStorage.read("roleType");
  }

  var companyList = [
    {"zAttributesId": -1, "DisplayText": "Company Name*"},
  ];
  var siteNameList = [
    {"zAttributesId": -1, "DisplayText": "Site Name*"},
  ].obs;

  //material details
  var materialDataList = [
    {"zAttributesId": -1, "DisplayText": "Material*"},
  ].obs;
  var submaterialDataList = [
    {"zAttributesId": -1, "DisplayText": "Sub Material*"},
  ].obs;

  void addRequestIndend(BuildContext context, String companyName,
      String siteName, String remarks, DateTime requiredbyDate) {
    if (companyName == "" || companyName == "Company Name*") {
      DialogHelper.showErrorSnackbar("Company name cannot be Empty.");
    } else if (siteName == "" || siteName == "Site Name*") {
      DialogHelper.showErrorSnackbar("Site name cannot be Empty.");
    } else {
      showViewIndend.value = true;
      showAddMaterialBtn.value = true;
      materialModelData.clear();
    }
  }

  void addMaterailRequestIndend(
    String materialName,
    int materMasterId,
    String subMaterialName,
    int subMasterMaterialNameId,
    String qty,
    String materialRemarks,
  ) {
    if (materialName == "" || materialName == "Material*") {
      DialogHelper.showErrorSnackbar("Material name cannot be Empty.");
    } else if (subMaterialName == "" || subMaterialName == "Sub Material*") {
      DialogHelper.showErrorSnackbar("Sub Material cannot be Empty.");
    } else if (qty == "") {
      DialogHelper.showErrorSnackbar("Qty cannot be Empty.");
    } else {
      if (isUpdating.value) {
        // Update existing data
        var updatedMaterial = MaterialModel(
          materialName: materialName,
          masterMasterNameId: materMasterId,
          subMaterialName: subMaterialName,
          subMasterMasterNameId: subMasterMaterialNameId,
          qty: qty,
          materialRemarks: materialRemarks,
        );

        // Find the index of the existing data and update it
        final index = materialModelData.indexWhere(
          (element) => element.materialName == selectedIndex,
        );

        if (index != -1) {
          materialModelData[index] = updatedMaterial;
        }
      } else {
        // Add new data
        materialModelData.add(MaterialModel(
          materialName: materialName,
          masterMasterNameId: materMasterId,
          subMaterialName: subMaterialName,
          subMasterMasterNameId: subMasterMaterialNameId,
          qty: qty,
          materialRemarks: materialRemarks,
        ));
      }

      clearMaterialData();
      Get.back();
    }
  }

  Future getAllIndend() async {
    String url =
        "${Constant.baseUrl}/Indent/PullIndent?pageSize=5&pageNumber=$pageNumber";

    // if (status != "") {
    //   url =
    //       "${Constant.baseUrl}/Lead/PullHrishabrajInternalLead?pageSize=5&pageNumber=$pageNumber&flag=$receivedRole&status=$status";
    // }
    try {
      var response = await BaseClient.getRequestWithAuthentication(url);
      var jsonResponse = jsonDecode(jsonDecode(response));
      var validatedResponse = BaseClient.validateResponse(jsonResponse);
      if (validatedResponse == "1") {
        var responseModel = indendResponseModelFromJson(response);
        viewIndendData.addAll(responseModel.data);
        isLoading.refresh();
        if (viewIndendData.length < (pageNumber * 5)) {
          isDataAvailable.value = false;
        }
      } else {
        DialogHelper.showErrorSnackbar(validatedResponse);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      DialogHelper.showErrorSnackbar(e.toString());
    }
  }

  void showMaterialBottomSheet(double width, double height) {
    Get.bottomSheet(SingleChildScrollView(
      child: Container(
        height: height * 0.50,
        width: width,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Material Details ",
              style: AppTextstyle.ts20BB,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Obx(() => CustomDropdown(
                      itemList: materialDataList.toList(),
                      setValue: (value) {
                        handleSubMaterailListChange(value);
                      },
                      initialValue: selectedMaterialName,
                    ))),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Obx(
                  () => CustomDropdown(
                    itemList: submaterialDataList.toList(),
                    setValue: (value) {
                      selectedSubMaterailName = value;
                    },
                    initialValue: selectedSubMaterailName,
                  ),
                )),
            CustomTextField(
              textController: materialQtyC,
              hint: "QTY*",
              minLines: 1,
              maxLines: 1,
              keyboardType: TextInputType.number,
            ),
            CustomTextField(
              textController: materialRemarksC,
              hint: "Material Remarks*",
              minLines: 3,
              maxLines: 10,
            ),
            Obx(
              () => CustomButton(
                title: isUpdating.value ? "UPDATE" : "ADD",
                onTapFunction: () {
                  if (isUpdating.value) {
                    addMaterailRequestIndend(
                        selectedMaterialName["DisplayText"],
                        selectedMaterialName["MaterialMasterId"],
                        selectedSubMaterailName["DisplayText"],
                        selectedSubMaterailName["MaterialSubtypeMasterId"],
                        materialQtyC.text,
                        materialRemarksC.text);
                  } else {
                    addMaterailRequestIndend(
                        selectedMaterialName["DisplayText"],
                        selectedMaterialName["MaterialMasterId"],
                        selectedSubMaterailName["DisplayText"],
                        selectedSubMaterailName["MaterialSubtypeMasterId"],
                        materialQtyC.text,
                        materialRemarksC.text);
                  }
                },
              ),
            )
          ],
        ),
      ),
    ));
  }

  void getCompanyNameList() 
  {
    user = UserData.fromJson(json.decode(Constant.staticStorage.read("user")));
    companyIndendDataList = user.companyDetails;
    companyIndendDataList.forEach((item) {
      companyList.add({
        "zAttributesId": item.companyId,
        "DisplayText": item.companyName,
      });
    });

    selectedCompanyName = companyList[0];
    selectedSiteName = siteNameList[0];
  }

  void handleSiteNameListChange(value) {
    selectedCompanyName = value;
    companyIndendDataList.forEach((element) {
      if (element.companyId == selectedCompanyName["zAttributesId"]) {
        siteNameList.add({
          "zAttributesId": element.companyId,
          "DisplayText": element.projectName,
        });
      }
    });
  }

  void getMaterialDataList() {
    print("material data :${jsonDecode(Constant.staticStorage.read("materialData"))}");
    materialIndendDataList =
        jsonDecode(Constant.staticStorage.read("materialData"));

        

    materialIndendDataList.forEach((item) {
      materialDataList.add({
        "zAttributesId": item["MaterialCode"],
        "DisplayText": item["MaterialName"],
        "MaterialMasterId": item["MaterialMasterId"],
      });
    });

    selectedMaterialName = materialDataList[0];
    selectedSubMaterailName = submaterialDataList[0];
  }

  void handleSubMaterailListChange(value) {
    selectedMaterialName = value;
    materialIndendDataList.forEach((element) {
      if (element["MaterialCode"] == selectedMaterialName["zAttributesId"]) {
        submaterialDataList.add({
          "zAttributesId": element["MaterialCode"],
          "DisplayText": element["MaterialSubtypeName"],
          "MaterialSubtypeMasterId": element["MaterialSubtypeMasterId"]
        });
      }
    });
  }

  bool validateIndend() {
    if (materialModelData.isEmpty) {
      DialogHelper.showErrorSnackbar(
          "Material data not found! please add material");
      return false;
    }

    return true;
  }

  // Api calls
  Future submitIndend() async {
    if (!validateIndend()) {
      return;
    }
    DialogHelper.showLoader("Adding Indend");

    List<Map<String, dynamic>> materialDetailsList = [];

    for (MaterialModel materialModel in materialModelData) {
      Map<String, dynamic> materialDetails = {
        'IndentMaterialId': materialModelData.indexOf(materialModel),
        'MaterialId': materialModel.masterMasterNameId,
        'MaterialSubTypeMasterId': materialModel.subMasterMasterNameId,
        'Quantity': int.parse(materialModel.qty),
        'Remark': materialModel.materialRemarks,
      };

      materialDetailsList.add(materialDetails);
    }
    String materialDetailsJson = jsonEncode(materialDetailsList);

    String url = "${Constant.baseUrl}/Indent/AddUpdateIndent";

    dynamic payload = {
      "indentId": 0,
      "companyId": selectedCompanyName["zAttributesId"],
      "projectId": selectedSiteName["zAttributesId"],
      "remark": remarksC.text,
      "requiredDate":
          CommonFunction.formatDateFromDatetoYYYYMMDD(selectedRequiredByDate),
      "materialDetails": materialDetailsJson,
    };
    try {
      var response =
          await BaseClient.postRequestWithAuthentication(url, payload);
      var jsonResponse = jsonDecode(jsonDecode(response));
      print("data Response:${jsonResponse.toString()}");
      var validatedResponse = BaseClient.validateResponse(jsonResponse);
      if (validatedResponse == "1") {
        Get.back();
        showViewIndend.value = false;
        showAddMaterialBtn.value = false;
        clearCompanyData();
        Get.offNamed(AppRoute.viewIndend);
        DialogHelper.showSuccessSnackbar(jsonResponse["SuccessMessage"][0]);
      } else {
        Get.back();
        DialogHelper.showErrorSnackbar(validatedResponse);
      }
    } catch (e) {
      Get.back();
      DialogHelper.showErrorSnackbar(e.toString());
    }
  }

  void clearCompanyData() {
    selectedCompanyName = companyList[0];
    selectedSiteName = siteNameList[0];
    selectedRequiredByDate = DateTime.now();
    remarksC.text = "";
  }

  void clearMaterialData() {
    selectedMaterialName = materialDataList[0];
    selectedSubMaterailName = submaterialDataList[0];
    materialQtyC.text = "";
    materialRemarksC.text = "";
  }
}
