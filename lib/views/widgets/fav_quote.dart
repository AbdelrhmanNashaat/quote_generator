import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/quote_model.dart';
import 'delete_button.dart';

class FavQuoteWidget extends StatelessWidget {
  final QuoteModel quoteModel;
  const FavQuoteWidget({
    super.key,
    required this.quoteModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.r, right: 16),
      width: 353.w,
      decoration: decoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 10.h),
          Text(
            '“${quoteModel.quote}”',
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            quoteModel.author,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(50, 50, 50, 0.7),
            ),
          ),
          SizedBox(height: 10.h),
          DeleteButton(quoteModel: quoteModel),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      color: const Color(0xffFBFBFB),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(6.r),
        bottomRight: Radius.circular(6.r),
      ),
    );
  }
}
