import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimesions.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';

import '../../widgets/expandeble_text_widget.dart';

class RecommendFoodDetail extends StatelessWidget {
  const RecommendFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.close),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
                child: Container(

                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5,bottom: 10),
                  child: Center(child: BigText(text: "Xe đua F1",size: Dimensions.font26,)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20 ),

                    )
                  ),
                ),
                preferredSize: Size.fromHeight(20)),
            pinned: true,
            expandedHeight: 300,
            backgroundColor: Colors.green,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/image/car2.png",
              width: double.maxFinite,
              fit: BoxFit.cover,
              ),

            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(

                  child:ExpandableTextWidget(text: "Loạt cuộc đua Công thức 1 có nguồn gốc từ Giải Grand Prix Đua Mô tô vào những năm 1920 và 1930. Công thức là một tập các quy định mà tất cả những người và xe tham gia phải tuân thủ. Giải Công thức 1 chỉ được chấp thuận sau Chiến tranh thế giới thứ hai vào năm 1946, với cuộc đua không tính vô địch đầu tiên được tổ chức vào năm đó. Một số tổ chức đua xe Grand Prix đã đặt ra các luật lệ dành cho Giải vô địch Thế giới từ trước chiến tranh, nhưng do chiến tranh trì hoãn, Giải vô địch Các tay đua Thế giới không trở thành giải chính thức cho đến năm 1947. Cuộc đua vô địch thế giới đầu tiên được tổ chức tại Silverstone, Liên hiệp Anh vào năm 1950. Một giải vô địch dành cho đội đua diễn ra tiếp đó vào năm 1958. Các giải vô địch quốc gia được tổ chức tại Nam Phi và Liên hiệp Anh vào thập niên 1960 và 1970. Các cuộc đua Công thức 1 không tính vô địch được tổ chức trong nhiều năm nhưng do chi phí cho cuộc đua ngày càng cao, cuộc đua không tính vô địch cuối cùng diễn ra vào năm 1983[3].",),
                  margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                )
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20*2.5,vertical: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,),
                BigText(text: "\$12.88 " + " X " +" 0 ",color: AppColors.mainBlackColor,size: Dimensions.font26,),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,)
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height30,left: Dimensions.width20,right: Dimensions.width20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20*2),
                    topRight: Radius.circular(Dimensions.radius20*2)
                ),
                // color: AppColors.buttonBackgroundColor
                color: Colors.grey.shade200
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),

                  decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor
                  ),
                  child: BigText(text: "\$10 | Add to cart",color: Colors.white,)  ,)
              ],
            ),
          ),
        ],
      ),

    );
  }
}
