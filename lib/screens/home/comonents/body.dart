import 'package:flutter/material.dart';

import 'food_pageA_header.dart';
import 'food_page_body.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            food_page_header(),
            Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
            ))
          ],
        );
  }
}





