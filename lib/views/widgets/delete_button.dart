import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_generator/cubit/show_quotes_cubit/show_quotes_cubit_cubit.dart';

import '../../models/quote_model.dart';

class DeleteButton extends StatelessWidget {
  final QuoteModel quoteModel;
  const DeleteButton({
    super.key,
    required this.quoteModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        quoteModel.delete();
        BlocProvider.of<ShowQuotesCubitCubit>(context).fetchAllQuotes();
      },
      child: Container(
        width: double.infinity.sw,
        height: 42.h,
        decoration: BoxDecoration(
          color: const Color(0xffFBFBFB),
          border: Border.all(
            color: const Color(0xff8249B5),
            width: 2,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(6.r),
            bottomRight: Radius.circular(6.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite,
              color: Color(0xff8249B5),
              size: 30,
            ),
            SizedBox(width: 10.w),
            const Text(
              'Remove From Favorite',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Color(0xff8249B5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
