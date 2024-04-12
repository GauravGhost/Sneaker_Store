import 'package:ecommerce/components/shoe_tile.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            // search bar
            _searchBar(),
            // message
            _message(),
            // hot picks
            _hotPicksSection(),

            const SizedBox(height: 10),

            // Shoe Tiles
            _shoeTiles(context)
          ],
        ));
  }

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Search",
            style: TextStyle(color: Colors.grey),
          ),
          Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _message() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Text(
        'everyone flies... some fly longer than others',
        style: TextStyle(color: Colors.grey[600]),
      ),
    );
  }

  Widget _hotPicksSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Hot Picks 🔥',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            'See all',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _shoeTiles(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
        
        Shoe shoe = Shoe(
            name: 'Air jordan',
            price: '230',
            description: 'cool shoe',
            imagePath: 'lib/images/2.jpg');
        return ShoeTile(
          shoe: shoe,
        );
      }),
    );
  }
}
