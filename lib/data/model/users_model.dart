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

//================My User Model ================================

class MyUserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  MyUserModel(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.image,
        this.points,
        this.credit,
        this.token});

  MyUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['points'] = this.points;
    data['credit'] = this.credit;
    data['token'] = this.token;
    return data;
  }
}