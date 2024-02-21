import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BgColorWidget extends StatelessWidget {
  final Widget child;
  const BgColorWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      width: double.infinity.sw,
      height: double.infinity.sh,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [
            Color.fromRGBO(93, 19, 231, 1),
            Color.fromRGBO(130, 73, 181, 1),
          ],
        ),
      ),
      child: child,
    );
  }
}
