class Plan {
  final String type;
  final String payPerYear;
  final String detail;
  final String cashOut;
  final String benefit;

  Plan(this.type, this.payPerYear, this.detail, this.cashOut, this.benefit);
}

final List<Plan> plans = [
  Plan("Standard", "5.00", "10,000", "5", "60 time/year"),
  Plan("Silver", "10.00", "20,000", "10", "120 time/year"),
  Plan("Gold", "15.00", "50,000", "15", "200 time/year"),
];
