import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/cubit/add_quote_cubit/add_quote_cubit_cubit.dart';
import 'package:quote_generator/cubit/show_quotes_cubit/show_quotes_cubit_cubit.dart';
import 'package:quote_generator/views/widgets/home_view_body.dart';

class CustomIconButton extends StatelessWidget {
  final bool isFav;
  const CustomIconButton({
    super.key,
    required this.isFav,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<AddQuoteCubit>(context).addQuote(data);
        BlocProvider.of<ShowQuotesCubitCubit>(context).fetchAllQuotes();
      },
      child: Container(
        width: 100.w,
        height: 42.h,
        decoration: BoxDecoration(
          color: const Color(0xffFBFBFB),
          border: Border.all(
            width: 2,
            color: const Color(0xff8249B5),
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(6.r),
          ),
        ),
        child: Center(
          child: isFav
              ? const Icon(
                  Icons.favorite,
                  size: 36,
                  color: Color(0xff8249B5),
                )
              : const Icon(
                  FontAwesomeIcons.heart,
                  size: 36,
                  color: Color(0xff8249B5),
                ),
        ),
      ),
    );
  }
}
