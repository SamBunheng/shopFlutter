import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/home/model/search.dart';


class SearchSLide extends StatelessWidget {
  const SearchSLide({super.key, required this.searchModel});
  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return    Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 10),
                      child: Icon(Icons.search),
                    ),
                    Text(
                      searchModel.text,
                      style: GoogleFonts.roboto(
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Divider(
                    height: 10,
                    thickness: 1,
                    indent: 50,
                  ),
                ),
              ],
            );
  }
}