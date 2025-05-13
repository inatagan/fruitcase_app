import 'package:flutter/material.dart';
import 'package:showcaseapp/models/item.dart';
import 'package:showcaseapp/viewmodels/status.dart';

final apple = Item(
  id: '1',
  name: 'Apple',
  description: 'A sweet red fruit.',
  price: 0.99,
);

final orange = Item(
  id: '2',
  name: 'Orange',
  description: 'A juicy orange fruit.',
  price: 0.79,
);

final banana = Item(
  id: '3',
  name: 'Banana',
  description: 'A yellow fruit.',
  price: 0.59,
);

final grape = Item(
  id: '4',
  name: 'Grape',
  description: 'A small purple fruit.',
  price: 0.49,
);

final pear = Item(
  id: '5',
  name: 'Pear',
  description: 'A sweet green fruit.',
  price: 0.89,
);

final strawberry = Item(
  id: '6',
  name: 'Strawberry',
  description: 'A red fruit with seeds.',
  price: 1.29,
);

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  final List<Item> selectedItems = [];

  void addItemToBasket(Item item) {
    setState(() {
      selectedItems.add(item);
    });
    print('Added to basket: ${item.name}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: const Text('Fruit Basket'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 3 / 2,
              ),
              padding: const EdgeInsets.all(8.0),
              itemCount: 6,
              itemBuilder: (context, index) {
                final items = [apple, orange, banana, grape, pear, strawberry];
                final item = items[index];
                return GestureDetector(
                  onTap: () => addItemToBasket(item),
                  child: Card(
                    elevation: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage('images/fruits.png'),
                          height: 50,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(item.description),
                        Text('\$${item.price}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total: \$${selectedItems.fold(0.0, (total, item) => total + item.price).toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    selectedItems.clear();
                  });
                },
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle checkout action
                print('Checkout with items: $selectedItems');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderStatusScreen()),
                );
              },
              child: const Text('Checkout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
