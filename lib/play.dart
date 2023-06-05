import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final double cardWidth;
  final String carName;
  final String price;
  final String transmission;
  final String fuelType;
  final String condition;

  const CarCard({
    required this.cardWidth,
    required this.carName,
    required this.price,
    required this.transmission,
    required this.fuelType,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 316,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/home_screen/image1.png',
                  width: cardWidth,
                  height: cardWidth * 0.6, // Adjust the aspect ratio as needed
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    carName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    price,
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ),
                Wrap(
                  spacing: 8,
                  children: [
                    _buildTag(transmission),
                    _buildTag(fuelType),
                    _buildTag(condition),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  // Handle favorite button tap
                },
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}

