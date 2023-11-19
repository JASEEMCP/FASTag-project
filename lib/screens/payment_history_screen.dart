import 'package:flutter/material.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  List amount = [45, 23, 53, 64, 34, 34];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: Text(
              "+ \$${amount[index]}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            title: const Text("Place : Kozikode"),
            subtitle: const Text("Time : 20:00 IST"),
            trailing: const Text("Date: 05/11/2023"),
          );
        },
      ),
    );
  }
}
