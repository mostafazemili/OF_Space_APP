import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<String> images = [
    'images/12.png',
    'images/13.png',
    'images/13.png',
    'images/12.png',
    'images/12.png',
  ];

  final List<String> texts = [
    'Studio Apartment',
    'Penthouse ',
    'Bedroom Apartment',
    'Townhouse',
    'Villa',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: images.length,
        padding: EdgeInsets.all(5),
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 131/215,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          // mainAxisExtent: 70
        ),
        itemBuilder: (context, index) {
          return  Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                  height: 100,
                ),
                Text(
                  texts[index],
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        });
  }
}