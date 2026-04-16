import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  final Item item;

  const ItemPage({super.key, required this.item});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Column(
        children: [
          Hero(
            tag: item.name,
            child: Image.asset(
              item.image,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text('Rp ${item.price}',
                    style: const TextStyle(fontSize: 20, color: Colors.orange)),
                const Divider(),
                Text('Rating: ${item.rating} ⭐'),
                Text('Tersisa: ${item.stock} pcs'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}