
import 'package:bar/app/features/homepage/models/bar_item.dart';
import 'package:bar/app/utils/helper/base_view_model.dart';
import 'package:flutter/material.dart';

///[HomePageViewModel] contains ViewModel for [HomePageView].
class HomePageViewModel extends BaseViewModel {

  ///[_items] is List of Range Values in our Bar.
  final List<BarItem> _items = [
    BarItem(start: 0, end: 30, color: Colors.red, value: "Dangerous"),
    BarItem(start: 30, end: 40, color: Colors.orange, value: "Moderate"),
    BarItem(start: 40, end: 60, color: Colors.green, value: "Ideal"),
    BarItem(start: 60, end: 70, color: Colors.orange, value: "Moderate"),
    BarItem(start: 70, end: 120, color: Colors.red, value: "Dangerous"),
  ];

  List<BarItem> get items => _items;
  ///TArrowPosition in our Bar. Validation to keep this value within range is handled in the Bar Widget.
  int arrowPosition = 0;
  ///Set [arrowPosition] and call notifylistener.
  setArrowPosition(int val){
    arrowPosition = val;
    notifyListeners();
  }

}
