class InstallmentAvailableModel {
  num? carId;
  num? deposit;
  num? installmentPlan;
  num? monthly;
  num? total;

  InstallmentAvailableModel({
    this.carId,
    this.deposit,
    this.installmentPlan,
    this.monthly,
    this.total,
  });

  InstallmentAvailableModel.fromMap(Map<String, dynamic> map) {
    carId = map['car_id'] ?? 0;
    deposit = map['deposit'] ?? 0;
    installmentPlan = map['installment_plan'] ?? 0;
    monthly = map['monthly'] ?? 0;
    total = map['total'] ?? 0;
  }
}
