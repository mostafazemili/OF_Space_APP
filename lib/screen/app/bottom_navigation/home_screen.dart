import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    'images/12.png',
    'images/13.png',
    'images/13.png',
    'images/12.png',
    'images/12.png',
    'images/13.png',
    'images/13.png',
    'images/12.png',
    'images/12.png',
  ];

  final List<String> categoryImages = [
    'images/12.png',
    'images/13.png',
    'images/12.png',
    'images/13.png',
    'images/12.png',
    'images/12.png',
    'images/13.png',
    'images/12.png',
  ];

  final List<String> productNames = [
    'Studio Apartment',
    'Penthouse Apartment',
    'Bedroom Apartment',
    'Villa',
    'Townhouse',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            'Categories',
            style: GoogleFonts.nunito(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: GridView.builder(
            itemCount: categoryImages.length,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              String categoryImagePath = categoryImages[index];

              return Image.asset(
                categoryImagePath,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            'Latest Products',
            style: GoogleFonts.nunito(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: productNames.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            String productName = productNames[index];

            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.title),
                title: Text(productName),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            'Latest Products',
            style: GoogleFonts.nunito(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            String imagePath = images[index];

            return Card(
              color: Colors.black87,
              child: InkWell(
                onTap: () {
                  // Handle card tap if needed
                },
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
