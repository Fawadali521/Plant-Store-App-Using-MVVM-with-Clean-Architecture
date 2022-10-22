import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:green_tree/ui/custom_widgets/simple_text.dart';
import 'package:green_tree/ui/screens/product_details_section/product_details_view_model.dart';
import 'package:green_tree/core/services/data/cat_data.dart';
import 'package:green_tree/core/utils/constant/kcolors.dart';
import 'package:green_tree/ui/custom_widgets/custom_icon.dart';
import 'package:green_tree/core/utils/constant/ktext_style.dart';

class ProductDetailsView extends StatelessWidget {
  static const routeName = '/cart-detail';
  @override
  Widget build(BuildContext context) {
    final cartId = ModalRoute.of(context)?.settings.arguments as String;
    final cart = Provider.of<CartData>(
      context,
      listen: false,
    ).findId(cartId);
    return ChangeNotifierProvider(
      create: (context) => ProductDetailsViewModel(),
      child:
          Consumer<ProductDetailsViewModel>(builder: (context, model, child) {
        return Scaffold(
          body: Container(
            color: kColors.cartBackColor,
            height: double.maxFinite,
            width: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIcon(
                          color: kColors.whiteColor,
                          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                      CustomIcon(
                        color: kColors.mainColor,
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          color: kColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 50,
                  child: Container(
                    height: 350,
                    width: 250,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: AssetImage(cart.imageUrl))),
                  ),
                ),
                DraggableScrollableSheet(
                  initialChildSize: .5,
                  minChildSize: .1,
                  maxChildSize: .8,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      decoration: const BoxDecoration(
                        color: kColors.whiteColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                      ),
                      width: double.maxFinite,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            Divider(
                              height: 40.h,
                              indent: 155,
                              endIndent: 155,
                              color: kColors.greyColor,
                              thickness: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cart.name,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SimpleText(
                                          text: "\$${cart.price}",
                                          color: Colors.green,
                                          fontweight: FontWeight.bold,
                                          fontsize: 20,
                                        ),
                                        Wrap(
                                          spacing: 0.0,
                                          children: List.generate(5, (index) {
                                            return Icon(Icons.star,
                                                color: Colors.yellow);
                                          }),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  height: 25.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: kColors.mainColor),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(
                                        Icons.remove,
                                        color: kColors.whiteColor,
                                        size: 20,
                                      ),
                                      SimpleText(
                                        text: '2',
                                        color: kColors.whiteColor,
                                        fontweight: FontWeight.bold,
                                        fontsize: 20,
                                      ),
                                      const Icon(
                                        Icons.add,
                                        color: kColors.whiteColor,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 30.h),
                            Container(
                              height: 130.h,
                              width: double.maxFinite,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SimpleText(
                                      text: "About",
                                      color: kColors.greyColor,
                                      fontweight: FontWeight.bold,
                                      fontsize: 20),
                                  SimpleText(
                                      text: cart.about,
                                      color: kColors.greyColor,
                                      fontweight: FontWeight.normal,
                                      fontsize: 15)
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              height: 60.h,
                              width: double.maxFinite,
                              child: ListView.builder(
                                  itemCount: 3,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 70.h,
                                      width: 130.w,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            //margin: const EdgeInsets.only(right: 50.0),
                                            width: 60.w,
                                            height: 60.h,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kColors.mainColor,
                                            ),
                                            child: Icon(
                                              model.detailIcon[index],
                                              color: kColors.whiteColor,
                                            ),
                                          ),
                                          SizedBox(width: 10.h),
                                          Container(
                                            padding: EdgeInsets.only(top: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(model.detail[index],
                                                    style: kTextStyle()
                                                        .smallGreyText),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Text(model.values[index],
                                                    style: kTextStyle()
                                                        .smallBoldText),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomIcon(
                                  color: kColors.greyColor,
                                  icon:
                                      const Icon(Icons.shopping_cart_outlined),
                                ),
                                Material(
                                  elevation: 20,
                                  child: Container(
                                    height: 40.h,
                                    width: 280.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kColors.mainColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.check_box,
                                          color: kColors.whiteColor,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        SimpleText(
                                            text: 'BUY NOW',
                                            color: kColors.whiteColor,
                                            fontweight: FontWeight.bold,
                                            fontsize: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
