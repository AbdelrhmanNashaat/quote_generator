import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator/cubit/add_quote_cubit/add_quote_cubit_cubit.dart';
import 'package:quote_generator/cubit/get_quote_cubit/get_quote_cubit.dart';
import 'package:quote_generator/services/quotes_service.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetQuoteCubit>(
          create: (context) => GetQuoteCubit(quoteService: QuoteService()),
        ),
        BlocProvider<AddQuoteCubit>(
          create: (context) => AddQuoteCubit(),
        ),
      ],
      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
