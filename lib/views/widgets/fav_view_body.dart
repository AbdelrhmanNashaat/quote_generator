import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_generator/cubit/show_quotes_cubit/show_quotes_cubit_cubit.dart';

import 'bg.dart';
import 'fav_button.dart';

import 'loved_quotes.dart';
import 'text_field.dart';

class FavViewBody extends StatefulWidget {
  const FavViewBody({super.key});

  @override
  State<FavViewBody> createState() => _FavViewBodyState();
}

class _FavViewBodyState extends State<FavViewBody> {
  var quotes;
  @override
  void initState() {
    quotes = BlocProvider.of<ShowQuotesCubitCubit>(context).fetchAllQuotes();
    quotes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BgColorWidget(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 30.h),
          ),
          const SliverToBoxAdapter(
            child: NavigateTOFav(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 10.h),
          ),
          const SliverToBoxAdapter(
            child: SearchBarWidget(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 10.h),
          ),
          const LovedQuotes(),
        ],
      ),
    );
  }
}
