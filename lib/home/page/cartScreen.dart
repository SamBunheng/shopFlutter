import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/home/controller/proController.dart';
import 'package:shop/home/widget/cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final ProController controller = ProController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Item'),
      ),
      body: ListView.builder(
        itemCount: controller.listCart.length,
        itemBuilder: (context, index) => CartSlide(controller.listCart[index]),),
    );
  }
}