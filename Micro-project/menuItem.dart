class MenuItem {
  final String name;
  final double price;
  final String category;

  MenuItem(this.name, this.price, this.category);

  //function to display each menuItem detail
  void displayItemDetail() {
    print(
        "Item Name: $name\nPrice: \$${price.toStringAsFixed(2)}\nCategory: $category");
  }
}