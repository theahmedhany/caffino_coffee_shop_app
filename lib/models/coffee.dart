class Coffee {
  final String name;
  final double price;
  final String imagePath;
  int quantity;
  String size;

  Coffee({
    required this.name,
    required this.price,
    required this.imagePath,
    this.quantity = 1,
    this.size = 'M',
  });
}
