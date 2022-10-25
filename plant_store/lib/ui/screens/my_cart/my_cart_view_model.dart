import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCartViewModel with ChangeNotifier {
  List<String> detail = ['Height', 'Humidity', 'Width'];
  List<String> values = ['7.6"', '78%', '2.3'];
  List<IconData> detailIcon = [Icons.height, Icons.water_drop, Icons.dehaze];
}
