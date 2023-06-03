import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl;
  int quantity;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });
}

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<Product> cartItems = [
    Product(
      name: 'Product 1',
      price: 9.99,
      imageUrl: 'assets/images/product1.jpg',
      quantity: 2,
    ),
    Product(
      name: 'Product 2',
      price: 14.99,
      imageUrl: 'assets/images/product2.jpg',
    ),
    // Add more cart items as needed
  ];

  double calculateTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  void incrementQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.asset(
                    item.imageUrl,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => decrementQuantity(index),
                      ),
                      Text(item.quantity.toString()),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => incrementQuantity(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => removeItem(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${calculateTotalPrice().toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Implement the checkout functionality here
            },
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
