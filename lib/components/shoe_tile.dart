import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShoeTile extends StatelessWidget {
  final Shoe shoe;

  const ShoeTile({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Shoe Picture
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(shoe.imagePath)),
          // Description
          Text(
            shoe.description,
            style: TextStyle(color: Colors.grey[600]),
          ),
          // Price + details
Row(
  children: [
    Column(
      children: [
        Text(shoe.name),

        Text(shoe.price)
      ],
    )
  ],
)
          // button to add to cart
        ],
      ),
    );
  }
}
