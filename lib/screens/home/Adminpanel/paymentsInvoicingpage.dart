import 'package:flutter/material.dart';

class InvoiceItem {
  final String description;
  final double amount;

  InvoiceItem({required this.description, required this.amount});
}

class PaymentInvoicePage extends StatelessWidget {
  final String invoiceNumber;
  final String customerName;
  final List<InvoiceItem> items;
  final double totalAmount;

  const PaymentInvoicePage({super.key, 
    required this.invoiceNumber,
    required this.customerName,
    required this.items,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invoice Number: $invoiceNumber',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Customer: $customerName',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Items:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  InvoiceItem item = items[index];
                  return ListTile(
                    title: Text(item.description),
                    trailing: Text('\$${item.amount.toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Select Bank:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const BankDropdown(),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                child: const Text('Make Payment'),
                onPressed: () {
                  // Perform action when the payment button is pressed
                  // For example, initiate the payment process
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BankDropdown extends StatefulWidget {
  const BankDropdown({super.key});

  @override
  _BankDropdownState createState() => _BankDropdownState();
}

class _BankDropdownState extends State<BankDropdown> {
  String? selectedBank;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButton<String>(
        value: selectedBank,
        onChanged: (value) {
          setState(() {
            selectedBank = value;
          });
        },
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(Icons.arrow_drop_down),
        style: const TextStyle(fontSize: 16.0),
        items: <String>[
          'Bank 1',
          'Bank 2',
          'Bank 3',
          'Bank 4',
          'Bank 5',
          'Bank 6',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class InvoiceFormPage extends StatefulWidget {
  final List<InvoiceForm> invoiceForms;

  const InvoiceFormPage({super.key, required this.invoiceForms});

  @override
  _InvoiceFormPageState createState() => _InvoiceFormPageState();
}

class _InvoiceFormPageState extends State<InvoiceFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.invoiceForms.length,
        itemBuilder: (context, index) {
          InvoiceForm invoiceForm = widget.invoiceForms[index];
          return ListTile(
            title: Text('Customer: ${invoiceForm.customerName}'),
            subtitle: Text('Service/Product: ${invoiceForm.serviceProduct}'),
            trailing: IconButton(
              icon: const Icon(Icons.money_off),
              onPressed: () {
                setState(() {
                  invoiceForm.isRefunded = true;
                });
              },
            ),
            onTap: () {
              // Open the payment invoice page for the selected invoice
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentInvoicePage(
                    invoiceNumber: invoiceForm.invoiceNumber,
                    customerName: invoiceForm.customerName,
                    items: invoiceForm.items,
                    totalAmount: invoiceForm.totalAmount,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class InvoiceForm {
  final String invoiceNumber;
  final String customerName;
  final String serviceProduct;
  final String stylistName;
  final List<InvoiceItem> items;
  final double totalAmount;
  bool isRefunded;

  InvoiceForm({
    required this.invoiceNumber,
    required this.customerName,
    required this.serviceProduct,
    required this.stylistName,
    required this.items,
    required this.totalAmount,
    this.isRefunded = false,
  });
}

void main() {
  List<InvoiceForm> invoiceForms = [
    InvoiceForm(
      invoiceNumber: 'INV-001',
      customerName: 'John Doe',
      serviceProduct: 'Haircut',
      stylistName: 'Jane',
      items: [
        InvoiceItem(description: 'Haircut', amount: 50.0),
      ],
      totalAmount: 50.0,
    ),
    InvoiceForm(
      invoiceNumber: 'INV-002',
      customerName: 'Jane Smith',
      serviceProduct: 'Manicure',
      stylistName: 'Sara',
      items: [
        InvoiceItem(description: 'Manicure', amount: 30.0),
      ],
      totalAmount: 30.0,
    ),
    InvoiceForm(
      invoiceNumber: 'INV-003',
      customerName: 'Mike Johnson',
      serviceProduct: 'Massage',
      stylistName: 'Emily',
      items: [
        InvoiceItem(description: 'Massage', amount: 80.0),
      ],
      totalAmount: 80.0,
    ),
    InvoiceForm(
      invoiceNumber: 'INV-004',
      customerName: 'Lisa Taylor',
      serviceProduct: 'Hair Color',
      stylistName: 'Michelle',
      items: [
        InvoiceItem(description: 'Hair Color', amount: 100.0),
      ],
      totalAmount: 100.0,
    ),
    InvoiceForm(
      invoiceNumber: 'INV-005',
      customerName: 'Alex Green',
      serviceProduct: 'Facial',
      stylistName: 'Olivia',
      items: [
        InvoiceItem(description: 'Facial', amount: 60.0),
      ],
      totalAmount: 60.0,
    ),
  ];

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blue,
      fontFamily: 'Roboto',
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
    ),
    home: InvoiceFormPage(invoiceForms: invoiceForms),
  ));
}
