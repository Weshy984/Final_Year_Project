class Bookings{
  final int id;
  final String fullname;
  final int phone;
  final int busID;
  final int seatID;
  final String date;
  final String luggage;
  final int amount;
  final DateTime dateBooked;

  Bookings({required this.id, required this.fullname, required this.phone, required this.busID, required this.seatID, required this.date, required this.luggage, required this.amount, required this.dateBooked});
}