class UsersModel {
  String? status;
  String id;
  String name;
  String phone;
  String usrename;

  UsersModel(
      {required this.id,
      required this.name,
      required this.phone,
      required this.usrename});

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        usrename: json['username']);
  }
}
