import 'menuItem.dart';

class Menu {
  final List<MenuItem> menuItems = [];

  //function to add new item in to Menu
  void addItem(MenuItem item) => menuItems.add(item);

  //function to remove item from Menu
  void removeItem(MenuItem item) => menuItems.remove(item);

  //function to find item in menu
  List<MenuItem> findItem(String name) {
    List<MenuItem> foundItem = menuItems
        .where((item) => item.name.toLowerCase() == name.toLowerCase())
        .toList();
    if(foundItem.isEmpty){
      print("No items found matching '$name'.");
    }
    return foundItem;
  }

  //function to display all items in menu
  void displayMenuItems() {
    if (menuItems.isEmpty) {
      print("No item in the menu!");
    } else {
      for (var item in menuItems) {
        item.displayItemDetail();
      }
    }
  }
}
