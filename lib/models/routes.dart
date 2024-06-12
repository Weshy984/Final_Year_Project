import 'dart:ffi';

class routes{
  final int routeID;
  final String source;
  final String destination;
  final String travelDate;
  final String returnDate;
  final Float price;
  final String saccoName;

  routes({required this.routeID, required this.source, required this.destination, required this.travelDate, required this.returnDate, required this.price, required this.saccoName});

}