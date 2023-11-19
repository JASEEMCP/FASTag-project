class UserModel {
  String? fastTagId;
  String? ownerName;
  String? vehicalNumber;
  int? phoneNumber;
  String? vehicalName;
  String? vehicalClass;
  bool? tagStatus;
  int? fasTagBalance;

  UserModel({
    this.fasTagBalance,
    this.fastTagId,
    this.ownerName,
    this.phoneNumber,
    this.tagStatus,
    this.vehicalClass,
    this.vehicalName,
    this.vehicalNumber,
  });
}
