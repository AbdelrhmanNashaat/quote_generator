import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_generator/bloc_observer.dart';
import 'package:quote_generator/cubit/show_quotes_cubit/show_quotes_cubit_cubit.dart';
import 'package:quote_generator/models/quote_model.dart';
import 'package:quote_generator/views/fav_view.dart';
import 'package:quote_generator/views/home_view.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(QuoteModelAdapter());
  await Hive.openBox<QuoteModel>('quote');
  runApp(const QuoteGenerator());
}

class QuoteGenerator extends StatelessWidget {
  const QuoteGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => ShowQuotesCubitCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'GemunuLibre'),
            initialRoute: '/',
            routes: {
              '/': (context) => const HomeView(),
              '/fav': (context) => const FavView(),
            },
          ),
        );
      },
    );
  }
}
