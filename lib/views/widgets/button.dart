import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_generator/cubit/add_quote_cubit/add_quote_cubit_cubit.dart';

import '../../cubit/get_quote_cubit/get_quote_cubit.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<GetQuoteCubit>(context).getRandomQuote();
        BlocProvider.of<AddQuoteCubit>(context).resetState();
      },
      child: Container(
        width: 180.w,
        height: 42.h,
        decoration: BoxDecoration(
          color: const Color(0xff8249B5),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(6.r),
          ),
        ),
        child: const Center(
          child: Text(
            'Generate Another Quote',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xffFBFBFB),
            ),
          ),
        ),
      ),
    );
  }
}
