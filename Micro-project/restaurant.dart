import 'menu.dart';
import 'order.dart';
import 'tableReservation.dart';

class Restaurant {
  final Menu menu = Menu();
  final List<Order> orders = [];
  final List<TableReservation> reservations = [];
  final Map<int, bool> tables = {}; //trun = free, false = reserved

  //Input number of table in the restaurant
  void initailizeTable(int num) {
    for (int i = 1; i <= num; i++) {
      tables[i] = true;
    }
  }

  //create order
  Order createOrder(Order order) {
    orders.add(order);
    return order;
  }

  //Mark order completed
  // void updateOrderStatus(Order order) {
  //   order.updateStatus('Order was completed');
  //   print(order.status);
  // }

  //Mark payment completed
  void updateOrderPayment(Order order) {
    if (!order.paymentStatus) {
      order.makePayment();
      print("${order.customer.name} payment is succefully!");
      order.updateStatus('Order was completed');
      print(order.status);
    } else {
      print("Payment has already paid.");
    }
  }

  //reserve table
  void reserveTable(TableReservation tableReservation) {
    reservations.add(tableReservation);
    tables[tableReservation.tableNum] = false;
    print(
        "${tableReservation.customer.name} has reserve a table successfully!");
  }

  //cancel table reservation
  void cancelTable(TableReservation tableReservation) {
    reservations.remove(tableReservation);
    tables[tableReservation.tableNum] = true;
    tableReservation.cancelReservation();
    print(
        "${tableReservation.customer.name} has canceled the table reservation.");
  }

  //check if table available
  bool checkAvailableTable(int tableNum) {
    return tables[tableNum] ?? true;
  }

  //display all orders in the restaurant
  void displayAllOrders() {
    print("\n=== All Orders ===");
    if (orders.isEmpty) {
      print("No orders found.");
    } else {
      for (var order in orders) {
        print(
            "Order ID: ${order.orderID}\nCustomer: ${order.customer.name}\nContact: ${order.customer.phoneNum}\nStatus: ${order.status}\nTotal Price: \$${order.totalPrice}\nPayment Status: ${order.paymentStatus}");
      }
    }
  }

  // Method to display all reservations in the restaurant
  void displayAllReservations() {
    print("\n=== All Reservations ===");
    if (reservations.isEmpty) {
      print("No reservations found.");
    } else {
      for (var reservation in reservations) {
        print(
            "Reservation ID: ${reservation.reservationID}\nCustomer: ${reservation.customer.name}\nContact: ${reservation.customer.phoneNum}\nTable: ${reservation.tableNum}\nDate: ${reservation.reservationDate.toLocal()}\nStatus: ${reservation.status}");
      }
    }
    print('\n');
  }
}
