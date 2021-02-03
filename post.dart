import 'package:flutter/foundation.dart';

class Post {
  final int id;
  final String email;
  final String name;
  final String username;
  Adreess add;




  Post({
    @required this.id,
    @required this.name,
    @required this.username,
    @required this.email,
    @required this.add


  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'] as int,
        name: json['name'] as String,
        username: json['username'] as String,
        email: json['email'] as String,
        add: json['address']!=null?new Adreess.fromJson(json['address']):null

    );
  }
}


class Adreess {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  Adreess({
    @required this.street,
    @required this.suite,
    @required this.city,
    @required this.zipcode,

  });
  factory Adreess.fromJson(Map<String, dynamic> json) {
    return Adreess(
        street: json['street'] as String,
        suite: json['suite'] as String,
        city: json['city'] as String,
        zipcode: json['zipcode'] as String

    );
  }
}