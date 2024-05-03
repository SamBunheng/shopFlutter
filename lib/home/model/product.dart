import 'package:flutter/material.dart';

class ProductModel{
  final int id;
  final String iconpath;
  final String name;
  final String des;
  final String realprice;
  final String price;
  final String image;
  final double  rating;
  final List<String> memory;
  final List<Color> morecolor;

  ProductModel({
    required this.id, 
    required this.iconpath, 
    required this.name, 
    required this.des,
    required this.realprice,
    required this.price, 
    required this.image,
    required this.rating,
    required this.memory,
    required this.morecolor});
}
  final List<ProductModel> listProduct = [
    ProductModel(
      id: 1, 
      iconpath: 'asset/images/airpod.png', 
      image: 'asset/images/landscape-apple-airpods-3rd-gen-white-02-1200x900-removebg-preview.png',
      name: 'Airpods', 
      des: '\t\tAirPods are designed to work seamlessly with Apple devices, particularly iPhones, iPads, and Mac computers, but they can also be used with non-Apple devices through Bluetooth connectivity.',
      price: '\$132.00', 
      realprice: '\$200.00',
      memory: [
              '1Tb',
              '825Gb',
              '512GB',
              '256GB',
      ],
      morecolor: [
              Colors.green.shade400,
              Colors.red.shade400,
              Colors.blue.shade400,
              Colors.grey.shade200,
            ],
      rating: 4.9),
      
     ProductModel(
      id: 2, 
      iconpath: 'asset/images/macbook.png', 
      image: 'asset/images/macbook-removebg-preview.png',
      name: 'Macbook', 
      des: '\t\tThe MacBook is a line of laptop computers developed and sold by Apple Inc. The MacBook line includes several models, each with its own specifications and features.',
      price: '\$2250.0', 
      realprice: '\$2750.0',
      memory: [
              '1Tb',
              '825Gb',
              '512GB',
               '256GB',
      ],
      morecolor: [
              Colors.pink.shade200,
              Colors.black,
              Colors.blue.shade200,
              Colors.grey.shade200,
            ],
      rating: 2.5),
       ProductModel(
      id: 3, 
      iconpath: 'asset/images/iphone15.png', 
      image: 'asset/images/iphone15-removebg-preview.png',
      name: 'Iphone', 
      des: '\t\tThe iPhone is a line of smartphones developed and sold by Apple Inc.The iPhone runs on Apples iOS operating system and offers a range of features and capabilities.',
      price: '\$1250.0', 
      realprice: '\$1500.0',
      memory: [
              '1Tb',
              '825Gb',
              '512GB',
               '256GB',
      ],
      morecolor: [
              Colors.red.shade200,
              Colors.black,
              Colors.purple.shade200,
              Colors.grey.shade200,
            ],
      rating: 3.7),
       ProductModel(
      id: 4, 
      iconpath: 'asset/images/iwatch.png', 
      image: 'asset/images/apple-watch-series-7-9to5mac-9-removebg-preview.png',
      name: 'I-Watch', 
      des: '\t\tThe Apple Watch is a popular smartwatch developed by Apple Inc.The Apple Watch is designed to be worn on the wrist and integrates with the users iPhone, providing a wide range of features and functionality.',
      price: '\$270.00', 
      realprice: '\$340.00',
      memory: [
              '1Tb',
              '825Gb',
              '512GB',
               '256GB',
      ],
      morecolor: [
              Colors.red.shade200,
              Colors.black,
              Colors.blue.shade200,
              Colors.grey.shade200,
            ],
      rating: 4.0),
      ProductModel(
      id: 5, 
      iconpath: 'asset/images/samsung.png', 
      image: 'asset/images/samsung.png',
      name: 'Samsung', 
      des: '\t\ta multinational conglomerate based in South Korea. It is one of the world\'s largest and most recognized technology companies, known for its diverse range of products and services. ',
      price: '\$550.0', 
      realprice: '\$650.0',
      memory: [
              '1Tb',
              '825Gb',
              '512GB',
               '256GB',
      ],
      morecolor: [
              Colors.red.shade200,
              Colors.black,
              Colors.purple.shade200,
              Colors.grey.shade200,
            ],
      rating: 3.7),
      ProductModel(
      id: 6, 
      iconpath: 'asset/images/msi.png', 
      image: 'asset/images/msi.png',
      name: 'MSI', 
      des: '\t\s a Taiwanese multinational company that specializes in the design and manufacturing of computer hardware, particularly laptops, desktops, motherboards, graphics cards, and gaming peripherals',
      price: '\$750.0', 
      realprice: '\$1000.0',
      memory: [
              '1Tb',
              '825Gb',
              '512GB',
               '256GB',
      ],
      morecolor: [
              Colors.red.shade200,
              Colors.black,
              Colors.purple.shade200,
              Colors.grey.shade200,
            ],
      rating: 3.9),
    ProductModel(
      id: 7, 
      iconpath: 'asset/images/ioskeyboard.png', 
      image: 'asset/images/ioskeyboard.png',
      name: 'IOS keyboard', 
      des: '\t\tthe default keyboard provided by Apple on devices running the iOS operating system, such as iPhones and iPads. It serves as the primary input method for typing and entering text on these devices.',
      price: '\$100.0', 
      realprice: '\$120.0',
      memory: [
              '1Tb',
              '825Gb',
              '512GB',
               '256GB',
      ],
      morecolor: [
              Colors.red.shade200,
              Colors.black,
              Colors.purple.shade200,
              Colors.grey.shade200,
            ],
      rating: 3.0),
      ProductModel(
      id: 8, 
      iconpath: 'asset/images/windowKeyboard.png', 
      image: 'asset/images/windowKeyboard.png',
      name: 'Window Keyboard', 
      des: '\t\s  a peripheral input device used to enter text, commands, and other characters into a computer or electronic device. It consists of a set of keys arranged in a specific layout, typically based on the QWERTY design.',
      price: '\$20.0', 
      realprice: '\$25.0',
      memory: [
              '1Tb',
              '825Gb',
              '512GB',
               '256GB',
      ],
      morecolor: [
              Colors.red.shade200,
              Colors.black,
              Colors.purple.shade200,
              Colors.grey.shade200,
            ],
      rating: 3.2),
      ProductModel(
      id: 9, 
      iconpath: 'asset/images/airpod_max.png', 
      image: 'asset/images/airpod_max.png',
      name: 'Airpod Max', 
      des: '\t\ta premium wireless over-ear headphone model developed and manufactured by Apple Inc. It was released in December 2020 as part of the AirPods lineup, which includes the popular AirPods and AirPods Pro earbuds.',
      price: '\$350.0', 
      realprice: '\$450.0',
      memory: [
              '1Tb',
              '825Gb',
              '512GB',
               '256GB',
      ],
      morecolor: [
              Colors.red.shade200,
              Colors.black,
              Colors.purple.shade200,
              Colors.grey.shade200,
            ],
      rating: 3.7),
      ProductModel(
      id: 10, 
      iconpath: 'asset/images/RogScar15.png', 
      image: 'asset/images/RogScar15.png',
      name: 'ROG Strix SCAR 15', 
      des: '\t\s a gaming brand and product line developed by ASUS, a prominent technology company. The ROG brand is dedicated to delivering high-performance gaming hardware, peripherals, and accessories for gamers.',
      price: '\$2090.0', 
      realprice: '\$2150.0',
      memory: [
              '1Tb',
              '825Gb',
              '512GB',
               '256GB',
      ],
      morecolor: [
              Colors.red.shade200,
              Colors.black,
              Colors.purple.shade200,
              Colors.grey.shade200,
            ],
      rating: 4.2),
  ];
