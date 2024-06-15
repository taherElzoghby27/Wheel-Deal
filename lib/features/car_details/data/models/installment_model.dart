class InstallmentAvailableModel {
  String? carId;
  String? deposit;
  String? installmentPlan;
  String? monthly;
  String? total;

  InstallmentAvailableModel({
    this.carId,
    this.deposit,
    this.installmentPlan,
    this.monthly,
    this.total,
  });

  InstallmentAvailableModel.fromMap(Map<String, dynamic> map) {
    carId = map['car_id'] ?? String;
    deposit = map['deposit'] ?? String;
    installmentPlan = map['installment_plan'] ?? String;
    monthly = map['monthly'] ?? String;
    total = map['total'] ?? String;
  }
}
