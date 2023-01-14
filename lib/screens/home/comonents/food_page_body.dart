import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimesions.dart';

import '../../../widgets/big_text.dart';
import '../../../widgets/icon_and_text_widget.dart';
import '../../../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {

  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;

      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position){
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
            dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: Size.square(9.0),
            activeSize: Size(18.0,9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
            
          ),
        ),
        SizedBox(height: Dimensions.height30,),
        Container(

          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(text: ".",color:Colors.black26),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: EdgeInsets.only(bottom: 2),

                child: SmallText(text: "Food pairing",),
              )

            ],
          ),
        ),
         ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
              itemCount: 10, itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10),
              child: Row(
                children: [
                  Container(
                    width:Dimensions.listViewImgSize,
                    height: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/image/car2.png"
                            ),
                          fit: BoxFit.cover
                        )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewTextSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            bottomRight: Radius.circular(Dimensions.radius20)
                          ),
                          color: Colors.white,

                        ),
                      child: Padding(
                        padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: "Xe đua công thức F1 từ Viet Nam"),
                            SizedBox(height: Dimensions.height10,),
                            SmallText(text: "Được lắp ráp và sản xuất từ"),
                            SizedBox(height: Dimensions.height10,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children:const [
                                IconAndTextWidget(
                                  icon: Icons.circle_sharp,
                                  text: "Normal",
                                  iconColor: AppColors.iconColor1,
                                ),
                                IconAndTextWidget(
                                  icon: Icons.location_on,
                                  text: "1.7 km",
                                  iconColor: AppColors.mainColor,
                                ),
                                IconAndTextWidget(
                                  icon: Icons.access_time_outlined,
                                  text: "32min",
                                  iconColor: AppColors.iconColor1,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),

        
      ],
    );
  }

  Widget  _buildPageItem(int index) {

    Matrix4 matrix = new Matrix4.identity();

    if(index ==_currentPageValue.floor()){
      var currScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index==_currentPageValue.floor()+1){
      var currScale = _scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index==_currentPageValue.floor()-1){
      var currScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);


    }else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);

    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven?Colors.greenAccent:Colors.orangeAccent,
                image: DecorationImage(
                    image: AssetImage(
                      "assets/image/car1.jpeg",

                    ),
                    fit: BoxFit.cover
                )
            ),

          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30 ,right: Dimensions.width30,bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0,5)
                  ),
                  BoxShadow(
                    color: Colors.white,

                    offset: Offset(-5,0)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(5,0)
                  ),
                ]

              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15,left: Dimensions.height15,right: Dimensions.height15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Xe đua F1",size: 20,),
                    SizedBox(height: Dimensions.height10,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index)  {
                            return Icon(Icons.star,color: AppColors.yellowColor,size: 20,);}),

                        ),
                        SizedBox(width: 10,),
                        SmallText(text: "4.5"),
                        SizedBox(width: 10,),
                        SmallText(text: "1287"),
                        SizedBox(width: 3,),
                        SmallText(text: "comments")
                      ],
                    ),
                    SizedBox(height: Dimensions.height20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:const [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: AppColors.iconColor1,
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "1.7 km",
                          iconColor: AppColors.mainColor,
                        ),
                        IconAndTextWidget(
                          icon: Icons.access_time_outlined,
                          text: "32min",
                          iconColor: AppColors.iconColor1,
                        ),
                      ],
                    )
                  ],
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }
}