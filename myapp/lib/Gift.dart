import 'package:flutter/foundation.dart';

class Gift {
  String name;
  int point;
  String image;

  Gift({required this.name, required this.point, required this.image});
  fromJson(Map<String, dynamic> json) {
    return Gift(
      name: json['name'],
      point: json['point'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "point": point,
        "image": image,
      };
}
