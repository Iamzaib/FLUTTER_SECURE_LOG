import 'dart:convert';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

class User {
  String firstName;
  String surName;
  String companyName;
  String location;
  String companyLogo;
  String signature;
  //String signatureText;

  User({
    required this.firstName,
    required this.surName,
    required this.companyName,
    required this.location,
    required this.companyLogo,
    required this.signature,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        firstName: json["firstname"],
        surName: json["surname"],
        companyName: json["companyname"],
        location: json["location"],
        companyLogo: json["companylogo"],
        signature: json["signature"],
      );

  Map<String, dynamic> toMap() => {
        "firstname": firstName,
        "surname": surName,
        "companyname": companyName,
        "location": location,
        "companylogo": companyLogo,
        "signature": signature,
      };
}
