import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final int quantity;
  final double price;

  Product({required this.id, required this.name, required this.quantity, required this.price});
}

class InventoryManagementPage extends StatefulWidget {
  const InventoryManagementPage({super.key});

  @override
  _InventoryManagementPageState createState() => _InventoryManagementPageState();
}

class _InventoryManagementPageState extends State<InventoryManagementPage> {
  List<Product> products = [
    Product(id: '1', name: 'Product 1', quantity: 10, price: 9.99),
    Product(id: '2', name: 'Product 2', quantity: 5, price: 14.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Management'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('Quantity: ${product.quantity} - Price: \$${product.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  products.removeAt(index);
                });
              },
            ),
            onTap: () {
              // Navigate to product details page or perform any other action
              // when a product is tapped
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Navigate to product creation page or perform any other action
          // when the add button is pressed
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: InventoryManagementPage(),
  ));
}
