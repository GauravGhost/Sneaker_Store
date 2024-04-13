import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier{
  // List of shoes for sale
  final List<Shoe> shoeShop = [
    Shoe(
        name: 'Air Jordan',
        price: '1223',
        description: 'Air jordan luxurious',
        imagePath: 'lib/images/1.jpg'),
    Shoe(
        name: 'Air Jordan',
        price: '1223',
        description: 'Air jordan luxurious',
        imagePath: 'lib/images/2.jpg'),
    Shoe(
        name: 'Air Jordan',
        price: '1223',
        description: 'Air jordan luxurious',
        imagePath: 'lib/images/3.jpg'),
    Shoe(
        name: 'Air Jordan',
        price: '1223',
        description: 'Air jordan luxurious',
        imagePath: 'lib/images/4.jpg')
  ];

  // List of items in user cart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to the cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items from the cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
