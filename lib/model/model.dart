import 'package:flutter/material.dart';

class DetaiPage {
  String title;
  String description;
  String imgUrl;
  int price;

  DetaiPage(
      {required this.title,
      required this.description,
      required this.imgUrl,
      required this.price});
}

List<DetaiPage> itmlist = [
  DetaiPage(
    title: 'Java',
    description: 'Experience above +2 years',
    imgUrl: 'https://avatars.githubusercontent.com/u/1609975?s=280&v=4',
    price: 70000,
  ),

  
];
