import 'package:cpfs/utils/app_double_text.dart';
import 'package:cpfs/widgets/app_bar.dart';
import 'package:cpfs/widgets/loans.dart';
import 'package:flutter/material.dart';

class LoanPage extends StatelessWidget {
  const LoanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Column(
        children: [
         const CustomAppBar(),

          const Divider(),
            // list of loans

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppDoubleText(
                bigText: "Loans",
                smallText: "view all",
                func: () {
                  // Navigator.pushNamed(context, AppRoutes.allHotels);
                },
              ),
            ),

              Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: const [
                  LoanCard(
                    name: 'John Doe',
                    type: 'Home Loan',
                    amount: 250000,
                    interestAmount: 25000,
                  ),
                  LoanCard(
                    type: 'Car Loan',
                    name: 'Jane Smith',
                    amount: 15000,
                    interestAmount: 1500,
                  ),
                  LoanCard(
                    type: 'Education Loan',
                    name: 'Alex Johnson',
                    amount: 40000,
                    interestAmount: 4000,
                  ),
                ],
              ),
            )
        ],
      ),

    );
  }
}