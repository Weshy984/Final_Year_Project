import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../models/bookings.dart';
import '../models/tickets.dart';
import '../services/database_service.dart';

class AdminDash extends StatelessWidget {
  const AdminDash({super.key});

  @override
  Widget build(BuildContext context) {
    final databaseService = DatabaseService();

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Admin Dashboard')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder<List<Bookings>>(
                future: databaseService.fetchBookings(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No bookings available');
                  } else {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('ID')),
                            DataColumn(label: Text('Full Name')),
                            DataColumn(label: Text('Phone')),
                            DataColumn(label: Text('Bus ID')),
                            DataColumn(label: Text('Seat ID')),
                            DataColumn(label: Text('Date')),
                            DataColumn(label: Text('Luggage')),
                            DataColumn(label: Text('Amount')),
                            DataColumn(label: Text('Date Booked')),
                          ],
                          rows: snapshot.data!.map((booking) {
                            return DataRow(cells: [
                              DataCell(Text(booking.id.toString())),
                              DataCell(Text(booking.fullname)),
                              DataCell(Text(booking.phone)),
                              DataCell(Text(booking.busID.toString())),
                              DataCell(Text(booking.seatID.toString())),
                              DataCell(Text(booking.date)),
                              DataCell(Text(booking.luggage)),
                              DataCell(Text(booking.amount)),
                              DataCell(Text(booking.dateBooked.toString())),
                            ]);
                          }).toList(),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            const Gap(20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder<List<TicketDetails>>(
                future: databaseService.fetchTicketDetails(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No tickets available');
                  } else {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('Ticket ID')),
                            DataColumn(label: Text('Source')),
                            DataColumn(label: Text('Destination')),
                            DataColumn(label: Text('Date')),
                            DataColumn(label: Text('Departure Time')),
                            DataColumn(label: Text('Seat No')),
                            DataColumn(label: Text('Travel Time')),
                          ],
                          rows: snapshot.data!.map((ticket) {
                            return DataRow(cells: [
                              DataCell(Text(ticket.ticketID.toString())),
                              DataCell(Text(ticket.source)),
                              DataCell(Text(ticket.destination)),
                              DataCell(Text(ticket.date)),
                              DataCell(Text(ticket.departureTime)),
                              DataCell(Text(ticket.seatno)),
                              DataCell(Text(ticket.travelTime ?? 'N/A')),
                            ]);
                          }).toList(),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
