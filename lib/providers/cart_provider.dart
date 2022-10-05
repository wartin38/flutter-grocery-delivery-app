import 'package:flutter/widgets.dart';

class CartProvider extends ChangeNotifier {
  double _totalSum = 0;
  int _itemsInCart = 0;
  List<dynamic> items = [];

  double get totalAmount => _totalSum;
  int get itemsCount => _itemsInCart;

  void addMenuOfTheWeek() {
    _itemsInCart++;
    _totalSum += 250;
    notifyListeners();
  }

  void updateTotal(double amount) {
    _totalSum += amount;
    notifyListeners();
  }

  void incrementItemsInCart() {
    _itemsInCart++;
    notifyListeners();
  }
}
