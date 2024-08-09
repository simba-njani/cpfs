import 'package:flutter/material.dart';

class LoanCard extends StatelessWidget {
  final String type;
  final String name;
  final double amount;
  final double interestAmount;

  const LoanCard({super.key, required this.type, required this.name, required this.amount, required this.interestAmount,});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Loan Type: $type'),
            const SizedBox(height: 4),
            Text('Amount: \$${amount.toStringAsFixed(2)}'),
            const SizedBox(height: 4),
            Text('Interest Amount: \$${interestAmount.toStringAsFixed(2)}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Approve loan logic here
              },
              
              child: const Text('Approve Loan'),
            ),
          ],
        ),
      ),
    );
  }
}