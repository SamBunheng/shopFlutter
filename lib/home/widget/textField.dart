import 'package:flutter/material.dart';
import 'package:shop/home/model/product.dart';
import 'package:shop/home/page/searchpage.dart';

class InputField extends StatefulWidget {
  InputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.icon,
    this.onChange,
    this.maxLines,
  });
  var controller = TextEditingController();
  var hintText;
  var maxLines;
  var labelText;
  var icon;
  var onChange;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          // Add padding around the search bar
          // Use a Material design search bar
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.hintText,
              labelText: widget.labelText,
              contentPadding: const EdgeInsets.all(15),
              // Add a clear button to the search bar
              // suffixIcon: IconButton(
              //   icon: Icon(Icons.clear),
              //   onPressed: () => _searchController.clear(),
              // ),
              // Add a search icon or button to the search bar
              prefixIcon: widget.icon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      );

  }
}