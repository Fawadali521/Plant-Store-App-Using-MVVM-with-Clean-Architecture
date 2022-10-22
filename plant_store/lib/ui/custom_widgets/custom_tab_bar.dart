import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_tree/core/services/data/cat_data.dart';
import 'package:green_tree/ui/screens/product_details_section/product_details_view.dart';
import 'package:provider/provider.dart';

import 'cart_custom_clipper.dart';
import 'package:green_tree/core/utils/constant/kcolors.dart';

class CustomTabBar extends StatelessWidget {
  TabController controller;
  CustomTabBar({required this.controller});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartData(),
      child: Consumer<CartData>(
        builder: (context, model, child) {
          return Container(
            height: 250.h,
            width: double.maxFinite,
            child: TabBarView(controller: controller, children: [
              ListView.builder(
                  itemCount: model.cartData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 20.0),
                      width: 220,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              ProductDetailsView.routeName,
                              arguments: model.cartData[index].id);
                        },
                        child: Stack(
                          children: [
                            //bottom section of container
                            Positioned(
                              bottom: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: kColors.textFormColor,
                                ),
                                height: 150.h,
                                width: 218,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 100.h),
                                      Text(model.cartData[index].typeName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(model.cartData[index].name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium),
                                          Container(
                                            height: 20,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: kColors.whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Text(
                                              "\$${model.cartData[index].price}",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // upper section of container
                            Positioned(
                              bottom: 40,
                              child: ClipPath(
                                clipper: CartCustomClipper(),
                                child: Container(
                                  height: 170.h,
                                  width: 200.w,
                                  decoration: BoxDecoration(
                                    color: kColors.cartBackColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                  ),
                                ),
                              ),
                            ),
                            //image section
                            Positioned(
                              bottom: 80,
                              child: Container(
                                height: 170.h,
                                width: 150,
                                child: Image(
                                    image: AssetImage(
                                        model.cartData[index].imageUrl)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              const Center(child: Text('Top')),
              const Center(child: Text('indoor')),
              const Center(child: Text('outdoor')),
            ]),
          );
        },
      ),
    );
  }
}
