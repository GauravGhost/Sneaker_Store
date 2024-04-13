import 'package:ecommerce/components/shoe_tile.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Adding shoe to cart method
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // Alert for success
    showDialog(
      
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        title: const Text('Successfully Added!'),
        content: const Text('Check your cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) {
      return Column(
        children: [
          // search bar
          _searchBar(),
          // message
          _message(),
          // hot picks
          _hotPicksSection(),

          const SizedBox(height: 8),

          // Shoe Tiles
          _shoeTiles(context, value),

          // Divider
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Divider(
              color: Colors.grey[300],
            ),
          )
        ],
      );
    });
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

  Widget _shoeTiles(BuildContext context, Cart value) {
    return Expanded(
      child: ListView.builder(
        itemCount: value.getShoeList().length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Shoe shoe = value.getShoeList()[index];
          return ShoeTile(
            shoe: shoe,
            onTap: () => addShoeToCart(shoe),
          );
        },
      ),
    );
  }
}
