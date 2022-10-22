import 'package:flutter/cupertino.dart';

import '../../model/cart_details.dart';

class CartData with ChangeNotifier {
  List<CartDetails> cartData = [
    CartDetails(
        id: "1",
        imageUrl: "images/cart1.png",
        typeName: 'Indoor',
        name: "Peace Lily",
        price: '31.0',
        description: 'Its spines don\'t grow'),
    CartDetails(
        id: "2",
        imageUrl: "images/cart2.png",
        typeName: 'Indoor',
        name: "Agapanthus",
        price: '33.0',
        description: 'Its spines don\'t grow'),
    CartDetails(
        id: "3",
        imageUrl: "images/cart3.png",
        typeName: 'Outdoor',
        name: "Chilopsis",
        price: '310.0',
        description: 'Its spines don\'t grow'),
    CartDetails(
        id: "4",
        imageUrl: "images/cart4.png",
        typeName: 'Outdoor',
        name: "Heliconia",
        price: '33.0',
        description: 'Its spines don\'t grow')
  ];
  List<String> tab = ['Recommend', 'Top', 'Indoor', 'Outdoor'];

  CartDetails findId(String id) {
    return cartData.firstWhere((cart) => cart.id == id);
  }
}
