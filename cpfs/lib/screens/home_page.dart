import 'package:cpfs/controllers/fetch_loans_controller.dart';
import 'package:cpfs/utils/app_double_text.dart';
import 'package:cpfs/utils/card.dart';
import 'package:cpfs/widgets/app_bar.dart';
import 'package:cpfs/widgets/loans.dart'; // Assuming LoanCard is defined here
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<dynamic>> _loansFuture;

  @override
  void initState() {
    super.initState();
    _loansFuture = fetchLoans(); // Fetch the loans when the widget is initialized
  }

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App bar
            const CustomAppBar(),
            const SizedBox(height: 25),

            // Cards
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
                ],
              ),
            ),
            const SizedBox(height: 15),
            SmoothPageIndicator(
              controller: _controller,
              count: 2,
              effect: ExpandingDotsEffect(activeDotColor: Colors.grey.shade500),
            ),
            const SizedBox(height: 25),
            const Divider(),

            // List of loans
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppDoubleText(
                bigText: "Loans",
                smallText: "view all",
                func: () {
                  // Navigate to the full loans page if needed
                },
              ),
            ),

            // Expanded ListView with FutureBuilder to display fetched loans
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: _loansFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error fetching loans: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No loans available.'));
                  } else {
                    final loans = snapshot.data!;
                     final itemCount = loans.length < 2 ? loans.length : 2;
                    return ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: itemCount,
                      itemBuilder: (context, index) {
                        final loan = loans[index];
                        return LoanCard(
                          name: loan['fullName'] ?? 'N/A',
                          type: loan['description'] ?? 'Unknown Loan Type',
                          amount: double.tryParse(loan['amount']) ?? 0.0,
                          interestAmount:
                          double.tryParse(loan['interest']) ?? 0.0,
                           loanId: loan['LoanID'],
                              
                        );
                        
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
