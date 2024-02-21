import 'package:flutter/material.dart';

import 'clicked_container.dart';

class NavigateTOFav extends StatelessWidget {
  const NavigateTOFav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClickedContainer(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.arrow_back_ios),
          Text(
            'Back To Home Screen',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(50, 50, 50, 1),
            ),
          ),
        ],
      ),
    );
  }
}
