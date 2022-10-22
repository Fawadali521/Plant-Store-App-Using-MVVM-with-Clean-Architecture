import 'package:flutter/material.dart';
import 'package:green_tree/core/model/cart_details.dart';
import 'package:green_tree/core/services/data/cat_data.dart';
import 'package:green_tree/core/utils/constant/kcolors.dart';
import 'package:green_tree/ui/custom_widgets/main_text.dart';
import 'package:provider/provider.dart';

class ProductDetailsView extends StatelessWidget {
  static const routeName = '/cart-detail';
  List<String> animalNames = ['Elephant', 'Tiger', 'Kangaroo'];
  List<String> animalFamily = ['Elephantidae', 'Panthera', 'Macropodidae'];
  List<String> animalLifeSpan = ['60-70', '8-10', '15-20'];
  List<String> animalWeight = ['2700-6000', '90-310', '47-66'];
  int selectedTile = 0;
  @override
  Widget build(BuildContext context) {
    final cartId = ModalRoute.of(context)?.settings.arguments as String;
    final cart = Provider.of<CartData>(
      context,
      listen: false,
    ).findId(cartId);
    return Scaffold(
      appBar: AppBar(
        title: Text('details'),
      ),
      body: Container(
        color: kColors.cartBackColor,
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kColors.whiteColor,
                    ),
                    child: Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: kColors.mainColor),
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: kColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 30,
              left: 50,
              child: Container(
                height: 350,
                width: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(cart.imageUrl))),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: .5,
              minChildSize: .1,
              maxChildSize: .8,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: kColors.whiteColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  width: double.maxFinite,
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Divider(
                        height: 50,
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cart.name,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("\$${cart.price}"),
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
                          )
                        ],
                      ),
                      ListTile(
                        title: Text(
                          "NAME",
                        ),
                        subtitle: Text(
                          animalNames[selectedTile],
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "FAMILY",
                        ),
                        subtitle: Text(
                          animalFamily[selectedTile],
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "LIFESPAN",
                        ),
                        subtitle: Text(
                          animalLifeSpan[selectedTile],
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "WEIGHT",
                        ),
                        subtitle: Text(
                          animalWeight[selectedTile],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
