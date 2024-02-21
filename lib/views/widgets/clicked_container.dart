import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClickedContainer extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const ClickedContainer({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 353.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(251, 251, 251, 0.7),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.r),
          ),
        ),
        child: child,
      ),
    );
  }
}
