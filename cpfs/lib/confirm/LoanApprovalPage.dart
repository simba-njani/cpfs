import 'package:cpfs/controllers/approve_controller.dart';
import 'package:flutter/material.dart';

class LoanApprovalPage extends StatefulWidget {
  final String type;
  final String name;
  final double amount;
  final double interestAmount;
  final int loanId;

  const LoanApprovalPage({
    Key? key,
    required this.type,
    required this.name,
    required this.amount,
    required this.interestAmount,
    required this.loanId,
  }) : super(key: key);

  @override
  _LoanApprovalPageState createState() => _LoanApprovalPageState();
}

class _LoanApprovalPageState extends State<LoanApprovalPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Confirm Loan Approval',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          _buildBackground(),
          FadeTransition(
            opacity: _fadeAnimation,
            child: _buildLoanDetails(context),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey, Color(0xFF1E5FD0)],
        ),
      ),
    );
  }

  Widget _buildLoanDetails(BuildContext context) {
    final payableAmount =
        widget.amount + widget.interestAmount; // Calculate payable amount

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildAnimatedDetailCard('Name', widget.name, 1),
            _buildAnimatedDetailCard('Loan Type', widget.type, 2),
            _buildAnimatedDetailCard(
                'Principal Amount', '\$${widget.amount.toStringAsFixed(2)}', 3),
            _buildAnimatedDetailCard('Interest Amount',
                '\$${widget.interestAmount.toStringAsFixed(2)}', 4),
            _buildAnimatedDetailCard(
                'Payable Amount', '\$${payableAmount.toStringAsFixed(2)}', 5),
            const Spacer(),
            _buildAnimatedApproveButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: const [
        Icon(
          Icons.monetization_on,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(height: 10),
        Text(
          'Loan Approval',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Review and confirm the loan details',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedDetailCard(String title, String value, int index) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: const Offset(0, 0),
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
        0.1 * index, 
        (0.6 + 0.1 * index).clamp(0.0, 1.0), // Ensure end <= 1.0
        curve: Curves.easeOut,
      ),
      )),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            value,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildAnimatedApproveButton(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: ElevatedButton(
        onPressed: () {
          // Add loan approval logic here
          approveLoan(context, widget.loanId);
          print("Approving loan with ID: ${widget.loanId}");
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color(0xFF1533B4),
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
        ),
        child: const Text(
          'Approve Loan',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
