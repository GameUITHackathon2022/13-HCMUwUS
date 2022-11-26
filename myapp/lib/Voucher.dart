class Voucher {
  String? id;
  String name;
  String? description;
  String? image;
  String? code;
  String? value;
  String? expiryDate;
  String? howToActivate;
  String? activateConditions;

  Voucher(
      {this.id,
      required this.name,
      this.description,
      this.image,
      this.code,
      this.value,
      this.expiryDate,
      this.howToActivate,
      this.activateConditions});

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        code: json["code"],
        value: json["value"],
        expiryDate: json["expiry_date"],
        howToActivate: json["how_to_activate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "code": code,
        "value": value,
        "expiry_date": expiryDate,
      };
}
