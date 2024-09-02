class Loans {
  final String name;
  final String type;
  final double amount;
  final double interestAmount;

  Loans({
    required this.name,
    required this.type,
    required this.amount,
    required this.interestAmount,
  });

  factory Loans.fromJson(Map<String, dynamic> json) {
    return Loans(
        name: json['name'],
        type: json['type'],
        amount: json['amount'],
        interestAmount: json['interestAmount']);
  }
}
