import 'package:mysql1/mysql1.dart';

import '../models/bookings.dart';
import '../models/tickets.dart';

class DatabaseService {
  final _connectionSettings = ConnectionSettings(
    host: '10.0.2.2',
    port: 3306,
    user: 'root',
    db: 'tiketi',
  );

  Future<List<Bookings>> fetchBookings() async {
    final conn = await MySqlConnection.connect(_connectionSettings);
    try {
      final results = await conn.query('SELECT * FROM bookings');
      List<Bookings> bookings = results.map((row) {
        return Bookings(
          id: row['id'] as int,
          fullname: row['fullname'] as String,
          phone: row['phone'] as String,
          busID: row['busID'] as int,
          seatID: row['seatID'] as int,
          date: row['date'] as String,
          luggage: row['luggage'] as String,
          amount: row['amount'] as String,
          dateBooked: DateTime.parse(row['dateBooked'].toString()),
        );
      }).toList();
      return bookings;
    } catch (error) {
      print('Failed to fetch bookings: $error');
      return [];
    } finally {
      await conn.close();
    }
  }

  Future<List<TicketDetails>> fetchTicketDetails() async {
    final conn = await MySqlConnection.connect(_connectionSettings);
    try {
      final results = await conn.query('SELECT * FROM tickets');
      List<TicketDetails> tickets = results.map((row) {
        return TicketDetails(
          ticketID: row['ticketID'],
          source: row['source'],
          destination: row['destination'],
          date: row['date'],
          departureTime: row['departureTime'],
          seatno: row['seatno'],
          travelTime: row['travelTime'],
          amount: row['amount'],
          phoneNumber: row['phoneNumber'],
          saccoName: row['saccoName'],
        );
      }).toList();
      return tickets;
    } catch (error) {
      print('Failed to fetch tickets: $error');
      return [];
    } finally {
      await conn.close();
    }
  }

}
