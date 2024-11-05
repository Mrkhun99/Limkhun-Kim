import 'customer.dart';

class TableReservation {
  final int reservationID;
  final Customer customer;
  final int tableNum;
  final DateTime reservationDate;
  String status;
  static int _idIteration = 1;

  TableReservation(this.customer, this.tableNum, this.reservationDate,
      {this.status = "Table has been Reserved."})
      :reservationID = _idIteration++;

  //function to cancel table reservation
  void cancelReservation() => status =
      "Table reservation has been canceled."; //should check hour for cancel
}
