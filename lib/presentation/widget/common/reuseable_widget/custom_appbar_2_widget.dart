import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/common_function.dart';
import 'package:purchase/common/textstyle.dart';
import 'package:purchase/controller/indent/indend_controller.dart';
import 'package:purchase/utils/routes/app_route.dart';

class CustomAppbar2Widget extends StatelessWidget {
  final String title;
 

  const CustomAppbar2Widget(
      {super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
              const SizedBox(width: 20.0),
              Text(
                title,
                style: AppTextstyle.ts20BM,
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
