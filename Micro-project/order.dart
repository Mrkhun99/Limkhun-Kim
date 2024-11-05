import 'menuItem.dart';
import 'customer.dart';

class Order {
  final int orderID;
  final Customer customer;
  final List<MenuItem> orderItems;
  String status;
  bool paymentStatus;
  double totalPrice = 0;
  static int _idIteration = 1;

  Order(this.customer, this.orderItems,
      {this.status = "Order was Placed.", this.paymentStatus = false}): orderID = _idIteration++ {
    calulatePrice();
  }

  //total price calculation
  void calulatePrice() {
    for (int i = 0; i < orderItems.length; i++) {
      totalPrice += orderItems[i].price;
    }
  }

  //update order status
  void updateStatus(String newStatus) {
    status = newStatus;
  }

  
  void makePayment() => paymentStatus = true;
}
