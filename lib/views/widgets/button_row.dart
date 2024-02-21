import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quote_generator/cubit/add_quote_cubit/add_quote_cubit_cubit.dart';
import 'package:quote_generator/cubit/add_quote_cubit/add_quote_cubit_state.dart';

import 'button.dart';
import 'icon_button.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomButton(),
        SizedBox(width: 10.w),
        BlocBuilder<AddQuoteCubit, AddQuoteState>(
          builder: (context, state) {
            return CustomIconButton(
              isFav: state is AddQuoteSuccess ? true : false,
            );
          },
        ),
      ],
    );
  }
}
