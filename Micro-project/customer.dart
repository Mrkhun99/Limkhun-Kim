import 'restaurant.dart';
// import 'menuItem.dart';
import 'order.dart';
import 'tableReservation.dart';

class Customer {
  final int customerID;
  final String name;
  final String phoneNum;
  static int _idIteration = 1;

  Customer(this.name, this.phoneNum) : customerID = _idIteration++;

  //view item in Restaurant menu
  void viewItem(Restaurant restaurant) {
    print("Items List: ");
    restaurant.menu.displayMenuItems();
  }

  //function to order item from the restuarant
  void placeOrder(Restaurant restaurant, Order order) {
    restaurant.createOrder(order);
    print("Order placed with ID ${order.orderID} for customer ${this.name}");
    print("=== Reciep ===");
    print("Order ID: ${order.orderID}");
    print("Total Price: \$${order.totalPrice}");
    print("Order Status: ${order.status}");
    print("Payment Status: ${order.paymentStatus}");
  }

  //function to reserve table in the restuarant
  void reserveTable(Restaurant restaurant, TableReservation tableReservation) {
    if (restaurant.checkAvailableTable(tableReservation.tableNum)) {
      restaurant.reserveTable(tableReservation);
      print(
          "Table ${tableReservation.tableNum} reserved for $name on ${tableReservation.reservationDate.toLocal()}");
    } else {
      print(
          "Table ${tableReservation.tableNum} is not available on ${tableReservation.reservationDate.toLocal()}");
    }
  }

  //customer may cancel their reservation
  void cancelReservation(
      Restaurant restaurant, TableReservation tableReservation) {
    restaurant.cancelTable(tableReservation);
  }
}
