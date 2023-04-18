class ShippingDetailModel {
  ShippingDetailModel(
      {required this.name,
      required this.phone,
      required this.type,
      this.address});

  final String name;
  final String phone;
  final String type;
  final String? address;

  factory ShippingDetailModel.fromJson(Map<String, dynamic> json) {
    return ShippingDetailModel(
      name: json['name'],
      phone: json['phone'],
      type: json['type'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'type': type,
      'address': address,
    };
  }

  @override
  String toString() {
    return 'ShippingDetailModel(name: $name, phone: $phone, type: $type, address: $address)';
  }
}
