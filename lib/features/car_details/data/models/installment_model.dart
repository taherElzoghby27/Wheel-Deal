class InstallmentAvailableModel {
  int? carId;
  int? deposit;
  int? installmentPlan;
  int? monthly;
  int? total;

  InstallmentAvailableModel({
    this.carId,
    this.deposit,
    this.installmentPlan,
    this.monthly,
    this.total,
  });

  InstallmentAvailableModel.fromMap(Map<String, dynamic> map) {
    carId = map['car_id'];
    deposit = map['deposit'];
    installmentPlan = map['installment_plan'];
    monthly = map['monthly'];
    total = map['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['car_id'] = carId;
    data['deposit'] = deposit;
    data['installment_plan'] = installmentPlan;
    data['monthly'] = monthly;
    data['total'] = total;
    return data;
  }
}
