import 'package:cpfs/utils/app_double_text.dart';
import 'package:cpfs/utils/card.dart';
import 'package:cpfs/widgets/app_bar.dart';
import 'package:cpfs/widgets/loans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            //app bar

            const CustomAppBar(),
            const SizedBox(
              height: 25,
            ),

            //cards
            // ignore: sized_box_for_whitespace
            Container(
                height: 200,
                child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    children: [
                      DashCard(
                        currency: "USD",
                        loanAmount: 123,
                        totalLoans: 9,
                        color: Colors.deepPurple.shade300,
                      ),
                      DashCard(
                        currency: "ZWG",
                        loanAmount: 123,
                        totalLoans: 9,
                        color: Colors.blue.shade300,
                      ),
                    ])),
            const SizedBox(
              height: 15,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 2,
              effect: ExpandingDotsEffect(activeDotColor: Colors.grey.shade500),
            ),
            const SizedBox(
              height: 25,
            ),

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
                padding: EdgeInsets.all(8.0),
                children: [
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
      ),
    );
  }
}
