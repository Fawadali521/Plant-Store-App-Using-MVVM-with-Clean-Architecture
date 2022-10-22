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
        description: 'Its spines don\'t grow',
        about:
            "All carbon in proteins, fats and carbohydrates is derived from photosynthesis in plants. Everything we eat, including meat from animals (which feed on plants) is a result of plants using the energy in sunlight to take carbon dioxide and create complex carbon-containing molecules.",
        height: '7.3"',
        humidity: "34%",
        width: '3.4"'),
    CartDetails(
        height: '8.3"',
        humidity: "67%",
        width: '2.3"',
        id: "2",
        imageUrl: "images/cart2.png",
        typeName: 'Indoor',
        name: "Agapanthus",
        price: '33.0',
        description: 'Its spines don\'t grow',
        about:
            "All carbon in proteins, fats and carbohydrates is derived from photosynthesis in plants. Everything we eat, including meat from animals (which feed on plants) is a result of plants using the energy in sunlight to take carbon dioxide and create complex carbon-containing molecules."),
    CartDetails(
        id: "3",
        height: '5.3"',
        humidity: "80%",
        width: '3.0"',
        imageUrl: "images/cart3.png",
        typeName: 'Outdoor',
        name: "Chilopsis",
        price: '310.0',
        description: 'Its spines don\'t grow',
        about:
            "All carbon in proteins, fats and carbohydrates is derived from photosynthesis in plants. Everything we eat, including meat from animals (which feed on plants) is a result of plants using the energy in sunlight to take carbon dioxide and create complex carbon-containing molecules."),
    CartDetails(
        height: '4.3"',
        humidity: "37%",
        width: '1.3"',
        id: "4",
        imageUrl: "images/cart4.png",
        typeName: 'Outdoor',
        name: "Heliconia",
        price: '33.0',
        description: 'Its spines don\'t grow',
        about:
            "All carbon in proteins, fats and carbohydrates is derived from photosynthesis in plants. Everything we eat, including meat from animals (which feed on plants) is a result of plants using the energy in sunlight to take carbon dioxide and create complex carbon-containing molecules.")
  ];
  List<String> tab = ['Recommend', 'Top', 'Indoor', 'Outdoor'];

  CartDetails findId(String id) {
    return cartData.firstWhere((cart) => cart.id == id);
  }
}
