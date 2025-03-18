class Item {
  String name;

  Item({required this.name});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'] ?? 'no name',
    );
  }
}
