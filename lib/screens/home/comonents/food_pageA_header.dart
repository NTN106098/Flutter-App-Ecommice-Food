import 'package:flutter/material.dart';
import 'package:food_app/utils/dimesions.dart';

import '../../../utils/colors.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/small_text.dart';

class food_page_header extends StatelessWidget {
  const food_page_header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: Dimensions.width20 ,right: Dimensions.width20),
      margin: EdgeInsets.only(bottom: Dimensions.height15,top: Dimensions.height45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: "Việt Nam",color: AppColors.mainColor,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(text: "Hồ Chí Mính",color: Colors.black54,),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              )
            ],
          ),
          Center(
            child: Container(
              width: Dimensions.height45,
              height: Dimensions.height45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: AppColors.mainColor
              ),
              child: Icon(Icons.search,color: Colors.white,size: Dimensions.iconSize24,),
            ),
          )
        ],
      ),
    );
  }
}