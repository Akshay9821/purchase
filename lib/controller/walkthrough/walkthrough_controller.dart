import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:purchase/model/walkthrough_model.dart';
import 'package:purchase/utils/routes/app_route.dart';

class WalkthroughController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.toNamed(AppRoute.login);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<WalkthroughModel> onboardingPages = [
    WalkthroughModel(
        'assets/images/walkthrough/vendor_registeration.png',
        'Vendor Registration',
        'The process of offically recording or listing informarion in an authoritative or organized system.'),
    WalkthroughModel(
        'assets/images/walkthrough/address_needs.png',
        'Address The Needs',
        'Something (Material) that is Necessary to Meet the Requirements or Satisfy the demands of Someone(Construction).'),
    WalkthroughModel(
        'assets/images/walkthrough/select_vendor.png',
        'Select Possible Vendors',
        'The Vendor Selection process is a Series of processement Steps to determine product of service requirement and Match them with Vendor Capabilities and Pricing.'),
    WalkthroughModel(
        'assets/images/walkthrough/po_process.png',
        'Start The Purchase Order Process',
        'The Purchase Order process Consits of all the steps business take to create approve,validate,manage and tracks PO`s from the moment a need in Identfied.'),
    WalkthroughModel(
        'assets/images/walkthrough/contact_with_vendor.png',
        'Keep In Contact With The Vendor',
        'Good Communication with your Suppliers in Essential for building Strong And Productive RelationShip.'),
    WalkthroughModel(
        'assets/images/walkthrough/evaluate.png',
        'Evalute The Overall Supplier Experience',
        'The Evaluation Should Include a Review of the Supplier`s Finincial Stability, Quality, of Product or Services, Delivery Times and Customer Serivces.')
  ];
}
