class ShippingDetailModel {
  ShippingDetailModel({
    required this.name,
    required this.phone,
    required this.type,
    this.address,
  });

  factory ShippingDetailModel.fromJson(Map<String, dynamic> json) {
    return ShippingDetailModel(
      name: json['name'] as String,
      phone: json['phone'] as String,
      type: json['type'] as String,
      address: json['address'] as String,
    );
  }

  final String name;
  final String phone;
  final String type;
  final String? address;

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
