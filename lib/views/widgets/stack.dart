import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quote_generator/cubit/show_quotes_cubit/show_quotes_cubit_cubit.dart';
import 'package:quote_generator/views/fav_view.dart';

import 'clicked_container.dart';

class CustomStack extends StatefulWidget {
  const CustomStack({
    super.key,
  });

  @override
  State<CustomStack> createState() => _CustomStackState();
}

class _CustomStackState extends State<CustomStack> {
  @override
  void initState() {
    BlocProvider.of<ShowQuotesCubitCubit>(context).fetchAllQuotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClickedContainer(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const FavView();
                },
              ),
            );
          },
          child: const Center(
            child: Text(
              'Click Here To View Favorite Quotes',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(50, 50, 50, 1),
              ),
            ),
          ),
        ),
        Positioned(
          top: -18,
          left: 342,
          child: BlocBuilder<ShowQuotesCubitCubit, ShowQuotesCubitState>(
            builder: (context, state) {
              return CircleAvatar(
                radius: 15.r,
                backgroundColor: const Color(0xff323232),
                child: Text(
                  '${BlocProvider.of<ShowQuotesCubitCubit>(context).quotes!.length}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffFBFBFB),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
