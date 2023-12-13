import 'package:flutter/material.dart';
import 'package:purchase/common/color.dart';
import 'package:purchase/common/textstyle.dart';

class ExpandableWidget extends StatelessWidget {
  final bool isExpanded;
  final Widget expandedChild;
  final VoidCallback onTapFunction;
  final String title;
  final String iconUrl;
  const ExpandableWidget({
    super.key,
    required this.expandedChild,
    required this.isExpanded,
    required this.onTapFunction,
    required this.title,
    required this.iconUrl,
  });

  Widget expandedWidget() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
    child: Column(
      children: [
        InkWell(
          onTap: onTapFunction,
          child: Row(
            children: [
              Image(
                image: AssetImage(iconUrl),
                width: 18.0,
                height: 18.0,
              ),
              const SizedBox(width: 10.0),
              Text(
                title,
                style: AppTextstyle.ts16BB,
              ),
              const Spacer(),
              Icon(
                Icons.keyboard_arrow_up_outlined,
                size: 32.0,
                color: AppColor.blue,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        expandedChild,
      ],
    ),
  );

  Widget unexpandedWidget() => Padding(
    padding:
        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
    child: InkWell(
      onTap: onTapFunction,
      child: Row(
        children: [
          Image(
            image: AssetImage(iconUrl),
            width: 18.0,
            height: 18.0,
          ),
          const SizedBox(width: 10.0),
          Text(
            title,
            style: AppTextstyle.ts16BB,
          ),
          const Spacer(),
          Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 32.0,
            color: AppColor.black,
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      firstCurve: Curves.bounceIn,
      secondCurve: Curves.bounceOut,
      firstChild: expandedWidget(),
      secondChild: unexpandedWidget(),
      crossFadeState: isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
