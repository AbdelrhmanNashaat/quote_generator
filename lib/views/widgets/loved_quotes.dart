import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/show_quotes_cubit/show_quotes_cubit_cubit.dart';
import '../../models/quote_model.dart';
import 'fav_quote.dart';

class LovedQuotes extends StatelessWidget {
  const LovedQuotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowQuotesCubitCubit, ShowQuotesCubitState>(
      builder: (context, state) {
        List<QuoteModel> quotes =
            BlocProvider.of<ShowQuotesCubitCubit>(context).quotes!;
        if (state is ShowQuotesCubitSuccessful) {
          return SliverList.builder(
            itemCount: quotes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 12.r),
                child: FavQuoteWidget(quoteModel: quotes[index]),
              );
            },
          );
        }
        if (state is ShowQuotesCubitLoaded) {
          return SliverList.builder(
            itemCount: state.quotes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 12.r),
                child: FavQuoteWidget(quoteModel: state.quotes[index]),
              );
            },
          );
        } else {
          return const Center(
            child: Text(
              'No result!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          );
        }
      },
    );
  }
}
