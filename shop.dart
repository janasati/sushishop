import 'package:flutter/material.dart';
import 'food.dart';

class Shop extends ChangeNotifier {
  //food menu
  final List <Food> _foodMenu = [
    //salmon
    Food(name: "Salmon",
        price: "21.00",
        imagePath: 'lib/images/salmon.png',
        rating: "4.9"),
    //tuna
    Food(name: "Tuna",
        price: "23.00",
        imagePath: 'lib/images/tuna.png',
        rating: "4.3"),
  ];

  //customer cart
List<Food> _cart = [];

//getter
List <Food> get foodMenu => _foodMenu;
List <Food> get cart => _cart;

//add to cart
void addToCart(Food foodItem, int quantity) {
  for(int i=0; i<quantity; i++){
    _cart.add(foodItem);
  }
  notifyListeners();
}
//remove from the cart
void removeFromCart(Food food){
  _cart.remove(food);
  notifyListeners();
}
}