import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:green_tree/ui/getcustom_widgets/simple_text.dart';
import 'package:green_tree/core/services/data/cat_data.dart';
import 'package:green_tree/core/utils/constant/kcolors.dart';
import 'package:green_tree/ui/custom_widgets/custom_icon.dart';
import 'package:green_tree/core/utils/constant/ktext_style.dart';

class MyCartView extends StatelessWidget {
  static const routeName = '/my-cart';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartData(),
      child: Consumer<CartData>(builder: (context, model, child) {
        return Scaffold(
          body: Container(
            padding: EdgeInsets.only(right: 15, left: 15),
            color: kColors.whiteColor,
            height: double.maxFinite,
            width: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  top: 50,
                  left: 5,
                  right: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIcon(
                          color: kColors.cartBackColor,
                          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                      SimpleText(
                          text: 'My Cart',
                          color: kColors.mainColor,
                          fontweight: FontWeight.bold,
                          fontsize: 20),
                      CustomIcon(
                        color: kColors.whiteColor,
                        icon: const Icon(
                          Icons.more_vert_outlined,
                          color: kColors.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 5,
                  right: 5,
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: ListView.builder(
                        itemCount: model.cartData.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 20),
                            padding: EdgeInsets.all(10),
                            height: 80.h,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kColors.cartBackColor),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 30),
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: kColors.recentBackColor,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            model.cartData[index].imageUrl),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                SizedBox(width: 15.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(model.cartData[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(model.cartData[index].description,
                                        style: kTextStyle().smallGreyText),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Container(
                                      height: 20.h,
                                      width: 80.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                    color: kColors.mainColor)),
                                            child: Icon(
                                              Icons.remove,
                                              color: kColors.mainColor,
                                            ),
                                          ),
                                          SimpleText(
                                              text: "1",
                                              color: kColors.mainColor,
                                              fontweight: FontWeight.bold,
                                              fontsize: 20),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                    color: kColors.mainColor)),
                                            child: Icon(
                                              Icons.add,
                                              color: kColors.mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.more_vert_outlined,
                                      color: kColors.mainColor,
                                    ),
                                    SimpleText(
                                        text:
                                            "\$${model.cartData[index].price}",
                                        color: Colors.green,
                                        fontweight: FontWeight.bold,
                                        fontsize: 20)
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.35,
                  minChildSize: .1,
                  maxChildSize: .6,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      decoration: const BoxDecoration(
                        color: kColors.whiteColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                      ),
                      width: double.maxFinite,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            SizedBox(height: 30.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SimpleText(
                                    text: "Subtotal:",
                                    color: kColors.greyColor,
                                    fontweight: FontWeight.normal,
                                    fontsize: 20),
                                SimpleText(
                                    text: "\$74.00",
                                    color: kColors.greyColor,
                                    fontweight: FontWeight.normal,
                                    fontsize: 20)
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SimpleText(
                                    text: "Shipping Cost:",
                                    color: kColors.greyColor,
                                    fontweight: FontWeight.normal,
                                    fontsize: 20),
                                SimpleText(
                                    text: "\$10.00",
                                    color: kColors.greyColor,
                                    fontweight: FontWeight.normal,
                                    fontsize: 20)
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Divider(
                              color: kColors.greyColor,
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SimpleText(
                                    text: "Total:",
                                    color: kColors.mainColor,
                                    fontweight: FontWeight.bold,
                                    fontsize: 20),
                                SimpleText(
                                    text: "\$84.00",
                                    color: kColors.mainColor,
                                    fontweight: FontWeight.bold,
                                    fontsize: 20)
                              ],
                            ),
                            SizedBox(height: 30.h),
                            Material(
                              elevation: 20,
                              child: Container(
                                height: 40.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kColors.mainColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SimpleText(
                                        text: 'Place your order',
                                        color: kColors.whiteColor,
                                        fontweight: FontWeight.bold,
                                        fontsize: 20),
                                  ],
                                ),
                              ),
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
