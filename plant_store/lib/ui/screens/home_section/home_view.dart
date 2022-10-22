import 'package:flutter/material.dart';
import 'package:green_tree/core/utils/constant/kcolors.dart';
import 'package:green_tree/ui/custom_widgets/main_text.dart';
import 'package:green_tree/ui/custom_widgets/textformfield.dart';
import 'package:green_tree/ui/screens/home_section/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:green_tree/core/utils/constant/kcolors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/services/data/cat_data.dart';
import '../../custom_widgets/cart_custom_clipper.dart';
import '../../custom_widgets/my_custom_clipper.dart';
import 'package:green_tree/ui/custom_widgets/custom_tab_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return ChangeNotifierProvider(
      create: (context) => CartData(),
      child: Consumer<CartData>(
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(20),
              color: kColors.whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('images/gril1.jpg'),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: kColors.mainColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          color: kColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text("Let's find your plants!",
                      style: Theme.of(context).textTheme.bodyLarge),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormFields(
                    hintText: 'Search Plant',
                    pIcon: Icon(
                      Icons.search,
                      color: kColors.mainColor,
                    ),
                    sIcon: Icon(
                      Icons.keyboard_voice_sharp,
                      color: kColors.mainColor,
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: kColors.textFormColor),
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          unselectedLabelStyle:
                              Theme.of(context).textTheme.bodySmall,
                          controller: tabController,
                          labelColor: kColors.mainColor,
                          unselectedLabelColor: kColors.greyColor,
                          isScrollable: true,
                          tabs: [
                            Tab(
                              text: model.tab[0],
                            ),
                            Tab(
                              text: model.tab[1],
                            ),
                            Tab(
                              text: model.tab[2],
                            ),
                            Tab(
                              text: model.tab[3],
                            ),
                          ]),
                    ),
                  ),
                  CustomTabBar(controller: tabController),
                  Text(
                    'Recent Viewed',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Container(
                    height: 60,
                    width: double.maxFinite,
                    child: ListView.builder(
                        itemCount: model.cartData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 60,
                            width: 260,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  //margin: const EdgeInsets.only(right: 50.0),
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: kColors.recentBackColor,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            model.cartData[index].imageUrl),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(model.cartData[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(model.cartData[index].description,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  elevation: 10,
                  unselectedFontSize: 0,
                  selectedFontSize: 0,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: kColors.whiteColor,
                  selectedItemColor: kColors.mainColor,
                  unselectedItemColor: kColors.greyColor,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: const [
                    BottomNavigationBarItem(
                        label: 'Home', icon: Icon(Icons.home)),
                    BottomNavigationBarItem(
                        label: ('person'), icon: Icon(Icons.person)),
                    BottomNavigationBarItem(
                        label: ('shoppingCart'),
                        icon: Icon(Icons.shopping_cart)),
                    BottomNavigationBarItem(
                        label: ('list'), icon: Icon(Icons.list_alt_rounded)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
