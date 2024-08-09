import 'package:flutter/material.dart';

class DashCard extends StatelessWidget {
  final String currency;
  final double loanAmount;
  final int totalLoans;
  final Color color;
  const DashCard(
      {super.key,
      required this.currency,
      required this.loanAmount,
      required this.totalLoans, required this.color, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
          padding: EdgeInsets.all(20),
          width: 300,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              currency,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('\$${loanAmount.toString()}',
                style: TextStyle(color: Colors.white, fontSize: 28)),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Loans waiting Approval",
                    style: TextStyle(color: Colors.white)),
                Text(totalLoans.toString(), style: TextStyle(color: Colors.white))
              ],
            )
          ])),
    );
    ;
  }
}
