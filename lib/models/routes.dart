//import 'dart:ffi';

class routes{
  final int routeID;
  final String source;
  final String destination;
  final DateTime travelDate;
  final String returnDate;
  final String price;
  final int saccoID;

  routes({required this.routeID, required this.source, required this.destination, required this.travelDate, required this.returnDate, required this.price, required this.saccoID,});


  // Factory constructor to create routes from map
  factory routes.fromMap(Map<String, dynamic> map) {
    return routes(
      routeID: map['routeID'],
      source: map['source'],
      destination: map['destination'],
      travelDate: map['travelDate'],
      returnDate: map['returnDate'],
      price: map['price'],
      saccoID: map['saccoID'],
    );
  }

}