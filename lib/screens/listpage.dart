import 'package:flutter/material.dart';

class Listitm {
  String title;
  String description;
  String imgUrl;
  int price;

  Listitm({
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.price,
  });
}

List<Listitm> itmlist = [
  Listitm(
      title: 'adadad', description: 'adadsadad', imgUrl: 'adad', price: 5000),
];
