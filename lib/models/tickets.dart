
class TicketDetails{
  final int ticketID;
  final String source;
  final String destination;
  final String date;
  final String departureTime;
  final String seatno;
  final String? travelTime;

  TicketDetails({required this.ticketID, required this.source, required this.destination, required this.date, required this.departureTime, required this.seatno, this.travelTime});


}