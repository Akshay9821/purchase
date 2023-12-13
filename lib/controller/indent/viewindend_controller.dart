import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchase/common/constant.dart';
import 'package:purchase/model/indent/view_indend_model.dart';
import 'package:purchase/model/user_registration_model.dart';
import 'package:purchase/model/vendor_registration_model.dart';
import 'package:purchase/service/base_client.dart';
import 'package:purchase/utils/dialog_helper.dart';
import 'package:purchase/utils/routes/app_route.dart';

class ViewIndendController extends GetxController {
  List<ViewIndendData> viewIndendData = [];
  String flag = "";
  var isLoading = true.obs;
  late UserData user;
  
  late VendorData vendorData;
  RxList<ViewIndendData> filteredData = <ViewIndendData>[].obs;
  // Variables for HOD, VENDOR, SITE SUPERVISOR, SITE ENGINEER
  var status = "";
  var receivedRole = "";
  var userName = "".obs;

  // Pagination
  int pageNumber = 1;
  var isDataAvailable = true.obs;
  late ScrollController scrollController;

  late TextEditingController searchController;

  @override
  void onInit() {
    super.onInit();
    receivedRole = Constant.staticStorage.read("roleType");
    getAllIndend();
    paginate();
    searchController = TextEditingController();
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

  Future getAllIndend() async {
    if (receivedRole.toUpperCase() != "VENDOR") {
      user =
          UserData.fromJson(json.decode(Constant.staticStorage.read("user")));

      userName.value = "${user.userFirstName} ${user.userLastName}";
    } else {
      vendorData =
          VendorData.fromJson(json.decode(Constant.staticStorage.read("user")));
    }
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
        var responseModel;
        if (receivedRole.toUpperCase() != "VENDOR") {
          responseModel = indendResponseModelFromJson(response);
        } else {
          responseModel = vendorRegistrationModelFromJson(response);
        }
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

  //Approval or Rejected Indend
  Future approveReject(
      bool isApprove, indendId, status, remark, companyId, projectId) async {
    DialogHelper.showLoader("Processing");
    String url = "${Constant.baseUrl}/Indent/InternalTeamApprovedIndent";
    dynamic payload = {
      "indentId": indendId,
      "status": isApprove ? "approved" : "rejected",
      "remark": remark,
      "companyId": companyId,
      "projectId": projectId
    };
    try {
      var response =
          await BaseClient.postRequestWithAuthentication(url, payload);
      var jsonResponse = jsonDecode(jsonDecode(response));
      var validatedResponse = BaseClient.validateResponse(jsonResponse);
      if (validatedResponse == "1") {
        Get.back();
        Get.offNamedUntil(AppRoute.viewIndend, (route) => false);
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

  //to show Edit & delete option button
  bool shouldShowEditDelete(String status) {
    if ((receivedRole.toUpperCase() == "SITE SUPERVISOR" ||
            receivedRole.toUpperCase() == "SITE ENGINEER") &&
        status.toUpperCase() == "IN - PROCESS") {
      return true;
    }
    return false;
  }

//to show Approve & reject permission option button
  bool shouldShowApprovedDelete(int nextIndentActionId) {
    if (nextIndentActionId == user.userDetailsId) {
      return true;
    }
    return false;
  }
  void searchIndendData(String query) {
  if (query == "") {
    filteredData.value = viewIndendData;
    return;
  }

  var temp = <ViewIndendData>[];
  filteredData.value = [];

  temp.addAll(
    viewIndendData.where((item) {
      final companyName = item.companyName.toLowerCase();

      return companyName.contains(query.toLowerCase());
    }),
  );

  filteredData.value = temp;
}

}
