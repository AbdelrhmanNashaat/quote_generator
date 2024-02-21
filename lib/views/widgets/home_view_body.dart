import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quote_generator/cubit/get_quote_cubit/get_quote_state.dart';

import '../../cubit/get_quote_cubit/get_quote_cubit.dart';

import 'bg.dart';

import 'home_success.dart';

// ignore: prefer_typing_uninitialized_variables
var data;

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetQuoteCubit>(context).getRandomQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BgColorWidget(
      child: BlocBuilder<GetQuoteCubit, GetQuoteState>(
        builder: (context, state) {
          if (state is QuoteSuccess) {
            data = state.quoteModel;
            return SuccessWidget(
              quoteModel: state.quoteModel,
            );
          }
          if (state is QuoteLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xffFBFBFB),
                strokeWidth: 4.5,
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Failed to Get Quote, Try again!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFBFBFB),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
