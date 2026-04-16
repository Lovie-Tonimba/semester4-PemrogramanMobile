import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
        name: 'Sugar',
        price: 5000,
        image: 'img/sugar.png',
        stock: 10,
        rating: 4.5),
    Item(
        name: 'Salt',
        price: 2000,
        image: 'img/salt.png',
        stock: 50,
        rating: 4.0),
    Item(
        name: 'Cooking oil',
        price: 25000,
        image: 'img/cookingOil.png',
        stock: 20,
        rating: 4.3),
    Item(
        name: 'Soy Sauce',
        price: 15000,
        image: 'img/soySauce.png',
        stock: 8,
        rating: 5.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lovies Store',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ProductCard(item: items[index]);
              },
            ),
          ),
          const FooterWidget(),
        ],
      ),
    );
  }
}

// Kartu Produk
class ProductCard extends StatelessWidget {
  final Item item;
  const ProductCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/item', extra: item);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: item.name,
                child: Image.asset(item.image,
                    fit: BoxFit.cover, width: double.infinity),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text('Rp ${item.price}',
                      style: TextStyle(
                          color: Colors.yellow[700],
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Stok: ${item.stock}',
                          style: const TextStyle(
                              fontSize: 11, color: Colors.grey)),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 14),
                          Text('${item.rating}',
                              style: const TextStyle(fontSize: 11)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Footer
class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      color: Theme.of(context).colorScheme.primaryContainer,
      child: const Text(
        'Lovie Jechonia Tonimba - 244107060101',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
      ),
    );
  }
}
