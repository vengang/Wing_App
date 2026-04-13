class AccountModel {
  final String id;
  final String title;
  final String type;
  final String accountNumber; 
  final String balanceUSD;
  final String balanceKHR;
  final String isDefault;

  AccountModel(
    this.id,
    this.title,
    this.type,
    this.accountNumber,
    this.balanceUSD,
    this.balanceKHR,
    this.isDefault,
  );
}
