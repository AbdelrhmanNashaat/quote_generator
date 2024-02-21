import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/quote_model.dart';
import 'quote_widget.dart';
import 'stack.dart';

class SuccessWidget extends StatelessWidget {
  final QuoteModel quoteModel;
  const SuccessWidget({
    super.key,
    required this.quoteModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomStack(),
        SizedBox(height: 15.h),
        QuoteWidget(quoteModel: quoteModel),
      ],
    );
  }
}
