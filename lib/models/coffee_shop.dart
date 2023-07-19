import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier{
  // Coffee for sale list
  final List<Coffee> _shop = [
    Coffee(name: 'Long Black', price: '₹ 299',imagePath: 'assets/images/coffee1.png'),
    Coffee(name: 'Latte', price: '₹ 599',imagePath: 'assets/images/coffee2.png'),
    Coffee(name: 'Expresso', price: '₹ 199',imagePath: 'assets/images/coffee3.png'),
    Coffee(name: 'Ice Coffee', price: '₹ 499',imagePath: 'assets/images/coffee4.png'),
  ];

  // user cart
  final List<Coffee> _userCart = [];

  // get coffee list
  List<Coffee> get coffeeShop {
    return _shop;
  }

  // get user cart
  List<Coffee> get userCart {
    return _userCart;
  }

  // add item to user cart
  void addItemToCart(Coffee coffee){
    userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemToCart(Coffee coffee){
    userCart.remove(coffee);
    notifyListeners();
  }
}