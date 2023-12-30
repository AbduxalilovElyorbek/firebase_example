class UserModel {
  final String? uid;
  final String name;
  final String email;
  final String password;
  final String? address;
  final String? phoneNumber;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.password,
    this.address,
    this.phoneNumber,
  });

  factory UserModel.fromJson(
    Map<dynamic, dynamic> json,
  ) =>
      UserModel(
        uid: json["uid"],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        address: json['address'],
        phoneNumber: json['phone_number'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "address": address,
        "phone_number": phoneNumber,
      };
}
