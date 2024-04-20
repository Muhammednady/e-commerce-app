class AddressModel {
  int? code;
  String? message;
  List<Address>? address;

  AddressModel({this.code, this.message, this.address});

  AddressModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      address = <Address>[];
      json['data'].forEach((v) {
        address!.add(new Address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.address != null) {
      data['data'] = this.address!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  int? id;
  String? city;
  String? country;
  String? title;
  String? address;
  String? note;
  double? longitude;
  double? latitude;
  User? user;

  Address(
      {this.id,
        this.city,
        this.country,
        this.title,
        this.address,
        this.note,
        this.longitude,
        this.latitude,
        this.user});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    country = json['country'];
    title = json['title'];
    address = json['address'];
    note = json['note'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city'] = this.city;
    data['country'] = this.country;
    data['title'] = this.title;
    data['address'] = this.address;
    data['note'] = this.note;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? phone;
  String? email;

  User({this.id, this.name, this.phone, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}