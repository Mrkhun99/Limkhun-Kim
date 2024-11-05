import 'customer.dart';
import 'menuItem.dart';
import 'order.dart';
import 'restaurant.dart';
import 'tableReservation.dart';

void main() {
  //create restaurant INSTANCE and initialize tables
  Restaurant restaurant = Restaurant();
  restaurant.initailizeTable(10);

  //create menu items INSTANCE
  final MenuItem khmerNoodles = MenuItem('Khmer Noodles', 4.99, 'Main Course');
  final MenuItem chickenRice = MenuItem('Chicken Rice', 2.5, 'Main Course');
  final MenuItem soup = MenuItem('Soup', 4.99, 'Main Course');
  final MenuItem coke = MenuItem('Coke', 2, 'drink');

  //add items to the restaurant menu
  restaurant.menu.addItem(khmerNoodles);
  restaurant.menu.addItem(chickenRice);
  restaurant.menu.addItem(soup);
  restaurant.menu.addItem(coke);

  //display menu items
  print("=== Restaurant Menu ===");
  restaurant.menu.displayMenuItems();

  //create customer INSTANCE
  final Customer customer1 = Customer('Kim Sokhom', '012 181 899');
  final Customer customer2 = Customer('Kim LimKhun', '012 999 969');

  //Order INSTANCE
  final Order order1 = Order(customer1, [khmerNoodles, soup, coke]);
  final Order order2 = Order(customer2, [chickenRice]);

  //customer view items
  print("\n=== Customer View Menu ===");
  customer1.viewItem(restaurant);

  //customer order items
  print("\n=== Customer Place an Order ===");
  customer1.placeOrder(restaurant, order1);
  print("\n");
  customer2.placeOrder(restaurant, order2);

  //after customer complete payment
  print("\n=== Customer Completed Payment ===");
  restaurant.updateOrderPayment(order1);

  //Table reservation INSTANCE
  final tableReservation1 =
      TableReservation(customer1, 1, DateTime.utc(2024, 12, 31));
  final tableReservation2 =
      TableReservation(customer2, 2, DateTime.utc(2024, 12, 31));

  //customer reserve table
  print("\n=== Customer Reserves a Table ===");
  customer1.reserveTable(restaurant, tableReservation1);
  customer2.reserveTable(restaurant, tableReservation2);

  //there is a customer cancel table & other customer book that table
  print("\n=== Customer Cancels Reservation ===");
  customer1.cancelReservation(restaurant, tableReservation1);
  customer2.reserveTable(restaurant, tableReservation2);

  //remove item and find it
  print("\n=== Finding a Menu Item ===");
  restaurant.menu.removeItem(chickenRice); //test remove item from the menu
  restaurant.menu.findItem('chickenRice'); //test find chickenRice after remove

  print("\n");
  restaurant.menu.displayMenuItems(); // display all items

  print("\n");
  restaurant.createOrder(order1); //restuarant can create order for customer

  print("\n");
  restaurant.checkAvailableTable(1); //test check availabile table

  // print("\n");
  // restaurant.reserveTable(
  //     tableReservation1); //restaurant do a TableReservaton for customer2

  print("\n");
  restaurant.reserveTable(
      tableReservation2); //restaurant do a TableReservaton for customer1

  print("\n");
  restaurant.displayAllOrders();

  print("\n");
  restaurant.displayAllReservations();
}
