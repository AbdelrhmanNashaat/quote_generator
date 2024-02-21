import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quote_generator/cubit/show_quotes_cubit/show_quotes_cubit_cubit.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        BlocProvider.of<ShowQuotesCubitCubit>(context)
            .searchQuote(query: value);
      },
      cursorColor: const Color.fromRGBO(50, 50, 50, 0.7),
      decoration: InputDecoration(
        hintText: 'Type Something Here To Search..',
        hintStyle: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(50, 50, 50, 0.7),
        ),
        fillColor: const Color(0xffFBFBFB),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
        ),
      ),
    );
  }
}
